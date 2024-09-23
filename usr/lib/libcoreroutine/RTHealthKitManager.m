@implementation RTHealthKitManager

+ (id)stringFromRTHealthKitWorkoutActivityType:(int64_t)a3
{
  if (a3 <= 36)
  {
    if (a3 == 13)
      return CFSTR("Cycling");
    if (a3 == 24)
      return CFSTR("Hiking");
  }
  else
  {
    switch(a3)
    {
      case 'G':
        return CFSTR("Wheelchair Run");
      case '4':
        return CFSTR("Walking");
      case '%':
        return CFSTR("Running");
    }
  }
  return CFSTR("Unknown");
}

+ (id)stringFromRTWorkoutEndReminderAlertDismissedReason:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("Unknown");
  else
    return off_1E92A46F8[a3 - 1];
}

+ (id)workoutSessionStateToString:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("RTHealthKitWorkoutSessionStateUnknown");
  else
    return off_1E92A4720[a3 - 1];
}

- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  RTHealthKitManager *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v25 = 0;
    v19 = "Invalid parameter not satisfying: contactsManager";
    v20 = (uint8_t *)&v25;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_15;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v24 = 0;
    v19 = "Invalid parameter not satisfying: defaultsManager";
    v20 = (uint8_t *)&v24;
    goto LABEL_14;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v23 = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    v20 = (uint8_t *)&v23;
    goto LABEL_14;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 0;
      v19 = "Invalid parameter not satisfying: platform";
      v20 = (uint8_t *)&v22;
      goto LABEL_14;
    }
LABEL_15:

    v17 = 0;
    goto LABEL_16;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E10]), "initWithHealthStore:", v15);
  self = -[RTHealthKitManager initWithContactsManager:defaultsManager:distanceCalculator:healthKitStore:platform:workoutClusterStore:](self, "initWithContactsManager:defaultsManager:distanceCalculator:healthKitStore:platform:workoutClusterStore:", v10, v11, v12, v15, v14, v16);

  v17 = self;
LABEL_16:

  return v17;
}

- (RTHealthKitManager)initWithContactsManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 healthKitStore:(id)a6 platform:(id)a7 workoutClusterStore:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTHealthKitManager *v19;
  uint64_t v20;
  id errorFunction;
  uint64_t v22;
  _HKWorkoutObserver *workoutObserver;
  uint64_t v24;
  HKMedicalIDStore *medicalIDStore;
  RTHealthKitManager *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[16];

  v34 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v35 = a7;
  v18 = a8;
  if (!v15)
  {
    v28 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v28 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v17)
  {
    v28 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: healthStore";
    goto LABEL_17;
  }
  if (!v35)
  {
    v28 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: platform";
      goto LABEL_17;
    }
LABEL_18:

    v26 = 0;
    v27 = v34;
    goto LABEL_19;
  }
  v33 = v18;
  if (v18)
  {
    v36.receiver = self;
    v36.super_class = (Class)RTHealthKitManager;
    v19 = -[RTNotifier init](&v36, sel_init);
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D183B8], "createErrorFunctionWithPerpendicularDistance");
      v20 = objc_claimAutoreleasedReturnValue();
      errorFunction = v19->_errorFunction;
      v19->_errorFunction = (id)v20;

      objc_storeStrong((id *)&v19->_contactsManager, a3);
      objc_storeStrong((id *)&v19->_defaultsManager, a4);
      objc_storeStrong((id *)&v19->_distanceCalculator, a5);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7058]), "initWithHealthStore:", v17);
      workoutObserver = v19->_workoutObserver;
      v19->_workoutObserver = (_HKWorkoutObserver *)v22;

      -[_HKWorkoutObserver setDelegate:](v19->_workoutObserver, "setDelegate:", v19);
      objc_storeStrong((id *)&v19->_healthStore, a6);
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6848]), "initWithHealthStore:", v17);
      medicalIDStore = v19->_medicalIDStore;
      v19->_medicalIDStore = (HKMedicalIDStore *)v24;

      objc_storeStrong((id *)&v19->_platform, a7);
      objc_storeStrong((id *)&v19->_workoutClusterStore, a8);
      v19->_listenForNewWorkoutsForRaceRouteEnabled = 0;
      v19->_listenForNewWorkoutsForSMSuggestionsEnabled = 0;
      v19->_listenForWorkoutSnapshotUpdatesEnabled = 0;
      v19->_listenForWorkoutOngoingChangedEnabled = 0;
      -[RTService setup](v19, "setup");
    }
    self = v19;
    v26 = self;
    v27 = v34;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    v27 = v34;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterStore", buf, 2u);
    }

    v26 = 0;
  }
  v28 = v33;
LABEL_19:

  return v26;
}

- (void)_setup
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD handler[4];
  id v22;
  int out_token;
  id location;

  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    objc_initWeak(&location, self);
    out_token = 0;
    v3 = (const char *)objc_msgSend(CFSTR("RTHealthKitManagerObservedNewWorkoutForRaceRoute"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__RTHealthKitManager__setup__block_invoke;
    handler[3] = &unk_1E929C650;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch(v3, &out_token, v4, handler);

    v6 = (const char *)objc_msgSend(CFSTR("RTHealthKitManagerObservedNewWorkoutForSMSuggestions"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = v5;
    v17 = 3221225472;
    v18 = __28__RTHealthKitManager__setup__block_invoke_405;
    v19 = &unk_1E929C650;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v6, &out_token, v7, &v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  -[RTHealthKitManager defaultsManager](self, "defaultsManager", v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsWorkoutMinDistance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTHealthKitManager defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsWorkoutMinDistance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_workoutMinDistance = objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    self->_workoutMinDistance = 1000;
  }
  -[RTHealthKitManager defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsWorkoutMinDistanceCycling"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[RTHealthKitManager defaultsManager](self, "defaultsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("RTDefaultsWorkoutMinDistanceCycling"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_workoutMinDistanceCycling = objc_msgSend(v15, "unsignedIntegerValue");

  }
  else
  {
    self->_workoutMinDistanceCycling = 5000;
  }
  -[RTHealthKitManager _setupEvalMode](self, "_setupEvalMode");
}

void __28__RTHealthKitManager__setup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onNewWorkoutForRaceRouteNotification");

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = CFSTR("RTHealthKitManagerObservedNewWorkoutForRaceRoute");
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }

}

void __28__RTHealthKitManager__setup__block_invoke_405(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onNewWorkoutForSMSuggestionsNotification");

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = CFSTR("RTHealthKitManagerObservedNewWorkoutForSMSuggestions");
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }

}

- (void)_shutdownWithHandler:(id)a3
{
  HKHealthStore *healthStore;
  HKObserverQuery *theNewWorkoutsForRaceRouteQuery;
  void (**v6)(id, _QWORD);

  healthStore = self->_healthStore;
  theNewWorkoutsForRaceRouteQuery = self->_theNewWorkoutsForRaceRouteQuery;
  v6 = (void (**)(id, _QWORD))a3;
  -[HKHealthStore stopQuery:](healthStore, "stopQuery:", theNewWorkoutsForRaceRouteQuery);
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_theNewWorkoutsForSMSuggestionsQuery);
  v6[2](v6, 0);

}

+ (id)stringFromWorkoutActivityType:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("WheelChairRunPace");
  v4 = CFSTR("Unknown");
  if (a3 == 37)
    v4 = CFSTR("Running");
  if (a3 != 71)
    v3 = v4;
  if (a3 == 13)
    return CFSTR("Cycling");
  else
    return (id)v3;
}

+ (id)stringFromHealthKitDecimationLevel:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A4750[a3 - 1];
}

+ (id)stringFromTimeInterval:(double)a3
{
  if (qword_1ED942A38 != -1)
    dispatch_once(&qword_1ED942A38, &__block_literal_global_113);
  return (id)objc_msgSend((id)_MergedGlobals_3_0, "stringFromTimeInterval:", a3);
}

uint64_t __45__RTHealthKitManager_stringFromTimeInterval___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = v0;

  objc_msgSend((id)_MergedGlobals_3_0, "setAllowedUnits:", 224);
  return objc_msgSend((id)_MergedGlobals_3_0, "setZeroFormattingBehavior:", 0x10000);
}

+ (id)stringFromDate:(id)a3 dateFormat:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (qword_1ED942A50 != -1)
    dispatch_once(&qword_1ED942A50, &__block_literal_global_420_0);
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  v8 = 2;
  if (v7)
    v8 = 3;
  v9 = (id)_MergedGlobals_3_0[v8];
  objc_msgSend(v9, "stringFromDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __48__RTHealthKitManager_stringFromDate_dateFormat___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED942A40;
  qword_1ED942A40 = v0;

  v2 = (void *)qword_1ED942A40;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend((id)qword_1ED942A40, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss-SSS"));
  v4 = objc_opt_new();
  v5 = (void *)qword_1ED942A48;
  qword_1ED942A48 = v4;

  v6 = (void *)qword_1ED942A48;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  return objc_msgSend((id)qword_1ED942A48, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

+ (BOOL)isPermittedWorkoutActivityType:(unint64_t)a3
{
  return (a3 - 13 < 0x3B) & (0x400000001000001uLL >> (a3 - 13));
}

+ (int64_t)RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:(unint64_t)a3
{
  if (a3 - 13 > 0x3A || ((1 << (a3 - 13)) & 0x400008001000001) == 0)
    return 0;
  else
    return a3;
}

+ (unint64_t)RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6)
    return 0;
  else
    return a3;
}

+ (unint64_t)HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 13) > 0x3A || ((1 << (a3 - 13)) & 0x400008001000801) == 0)
    return 3000;
  else
    return a3;
}

- (void)createNewWorkoutClusterStore
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTHealthKitManager_createNewWorkoutClusterStore__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__RTHealthKitManager_createNewWorkoutClusterStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createNewWorkoutClusterStore");
}

- (void)_createNewWorkoutClusterStore
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "Creating new HKWorkoutClusterStore", v7, 2u);
  }

  -[RTHealthKitManager setWorkoutClusterStore:](self, "setWorkoutClusterStore:", 0);
  v4 = objc_alloc(MEMORY[0x1E0CB6E10]);
  -[RTHealthKitManager healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHealthStore:", v5);
  -[RTHealthKitManager setWorkoutClusterStore:](self, "setWorkoutClusterStore:", v6);

}

+ (BOOL)isFakeRunningUpdate:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "internalState") - 10;
  if (v5 <= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sessionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, ignore fake WorkoutSessionRunning Update for workout with UUID, %@", (uint8_t *)&v12, 0x20u);

    }
  }

  return v5 < 3;
}

- (void)didUpdateWorkoutSnapshot:(id)a3
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
  block[2] = __47__RTHealthKitManager_didUpdateWorkoutSnapshot___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __47__RTHealthKitManager_didUpdateWorkoutSnapshot___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  RTCurrentWorkoutSnapshot *v25;
  RTCurrentWorkoutSnapshot *v26;
  RTCurrentWorkoutSnapshot *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  RTHealthKitManagerWorkoutSnapshotUpdateNotification *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  int v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  _BYTE v49[10];
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "activityType");
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "locationType");
    v43 = objc_msgSend(*(id *)(a1 + 40), "sessionState");
    *(_DWORD *)buf = 138413314;
    v45 = v1;
    v46 = 2112;
    v47 = v2;
    v48 = 1024;
    *(_DWORD *)v49 = v40;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v42;
    v50 = 1024;
    v51 = v43;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, incoming workout snapshot, activityType, %d, locationType, %d, sessionState, %d", buf, 0x28u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "sessionState") == 2)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isFakeRunningUpdate:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentWorkoutSessionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5
        || (objc_msgSend(*(id *)(a1 + 32), "currentWorkoutSessionIdentifier"),
            v1 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            !objc_msgSend(v1, "isEqual:", v2)))
      {
        v6 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "activityType");
        objc_msgSend(*(id *)(a1 + 32), "_getRTWorkoutDefaultTypesForSMSuggestions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v6, "isWorkoutActivityType:inTypes:", v8, v9);

        if (v5)
        {

          if ((v10 & 1) == 0)
            goto LABEL_15;
        }
        else if (!v10)
        {
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setCurrentWorkoutSessionIdentifier:", v11);

        objc_msgSend(*(id *)(a1 + 32), "setCurrentWorkoutIsFirstPartyWorkout:", objc_msgSend(*(id *)(a1 + 40), "isFirstPartyWorkout"));
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = v14;
          v46 = 2112;
          v47 = v15;
          v48 = 2112;
          *(_QWORD *)v49 = v16;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, new workout started with uuid, %@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "onNewWorkoutForSMSuggestionsNotification");
        goto LABEL_15;
      }

    }
LABEL_15:
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "locationType");

    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("RTDefaultsMostRecentWorkoutLocationType"));

    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "activityType");

    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("RTDefaultsMostRecentWorkoutActivityType"));

  }
  if (*(_QWORD *)(a1 + 40)
    && (v25 = -[RTCurrentWorkoutSnapshot initWithHKCurrentWorkoutSnapshot:]([RTCurrentWorkoutSnapshot alloc], "initWithHKCurrentWorkoutSnapshot:", *(_QWORD *)(a1 + 40))) != 0)
  {
    v26 = v25;
  }
  else
  {
    v27 = [RTCurrentWorkoutSnapshot alloc];
    objc_msgSend(*(id *)(a1 + 32), "currentWorkoutSessionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(*(id *)(a1 + 32), "currentWorkoutIsFirstPartyWorkout");
    objc_msgSend(*(id *)(a1 + 40), "builderStartDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "snapshotDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[RTCurrentWorkoutSnapshot initWithSessionIdentifier:activityType:locationType:swimmingLocationType:isFirstPartyWorkout:sessionState:workoutStartDate:snapshotDate:](v27, "initWithSessionIdentifier:activityType:locationType:swimmingLocationType:isFirstPartyWorkout:sessionState:workoutStartDate:snapshotDate:", v28, 0, 1, 0, v29, 3, v30, v31);

  }
  v32 = -[RTHealthKitManagerWorkoutSnapshotUpdateNotification initWithWorkoutSnapshot:]([RTHealthKitManagerWorkoutSnapshotUpdateNotification alloc], "initWithWorkoutSnapshot:", v26);
  objc_msgSend(*(id *)(a1 + 32), "onWorkoutSnapshotUpdateNotification:", v32);
  v33 = *(void **)(a1 + 40);
  if (!v33 || objc_msgSend(v33, "sessionState") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentWorkoutSessionIdentifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentWorkoutIsFirstPartyWorkout:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v36;
      v46 = 2112;
      v47 = v37;
      _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, %@, setting current workout session to nil", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateWorkoutStateWithSnapshot:", *(_QWORD *)(a1 + 40));

}

- (void)_updateWorkoutStateWithSnapshot:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  -[RTHealthKitManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsWorkoutOngoing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v15)
  {
    v7 = objc_msgSend(v15, "sessionState");
    if (v7 <= 6 && ((1 << v7) & 0x4A) != 0)
    {
      -[RTHealthKitManager defaultsManager](self, "defaultsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = MEMORY[0x1E0C9AAA0];
    }
    else
    {
      -[RTHealthKitManager defaultsManager](self, "defaultsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RTDefaultsWorkoutOngoing"));

    v13 = objc_msgSend((id)objc_opt_class(), "RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:", objc_msgSend(v15, "sessionState"));
    -[RTHealthKitManager defaultsManager](self, "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("RTDefaultsMostRecentWorkoutState"));

  }
  else
  {
    -[RTHealthKitManager defaultsManager](self, "defaultsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsWorkoutOngoing"));

    -[RTHealthKitManager defaultsManager](self, "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", &unk_1E93293A8, CFSTR("RTDefaultsMostRecentWorkoutState"));
  }

  -[RTHealthKitManager _postWorkoutOngoingChangedNotificationIfNecessary:](self, "_postWorkoutOngoingChangedNotificationIfNecessary:", v6);
}

- (void)_postWorkoutOngoingChangedNotificationIfNecessary:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  int v7;
  RTHealthKitManagerWorkoutOngoingChangedNotification *v8;

  v3 = a3;
  -[RTHealthKitManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsWorkoutOngoing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7 != v3)
  {
    v8 = objc_alloc_init(RTHealthKitManagerWorkoutOngoingChangedNotification);
    -[RTHealthKitManager onWorkoutOngoingChangedNotification:](self, "onWorkoutOngoingChangedNotification:", v8);

  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
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
  v7[2] = __61__RTHealthKitManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__RTHealthKitManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentWorkoutSnapshotWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__146;
  v13[4] = __Block_byref_object_dispose__146;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__146;
  v11[4] = __Block_byref_object_dispose__146;
  v12 = 0;
  -[RTHealthKitManager workoutObserver](self, "workoutObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v7[3] = &unk_1E92A4320;
  v7[4] = self;
  v9 = v11;
  v10 = v13;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "currentWorkoutSnapshotWithCompletion:", v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

}

void __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2;
  block[3] = &unk_1E92A42F8;
  v16 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __62__RTHealthKitManager__fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  RTCurrentWorkoutSnapshot *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "builderStartDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[RTHealthKitManager _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke_2";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Current workout, start date: %@", (uint8_t *)&v7, 0x16u);

    }
    v6 = -[RTCurrentWorkoutSnapshot initWithHKCurrentWorkoutSnapshot:]([RTCurrentWorkoutSnapshot alloc], "initWithHKCurrentWorkoutSnapshot:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    if (v4)
    {
      v7 = 136315138;
      v8 = "-[RTHealthKitManager _fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Current workout snapshot is nil", (uint8_t *)&v7, 0xCu);
    }

    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setListenForNewWorkoutsForRaceRouteEnabled:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_listenForNewWorkoutsForRaceRouteEnabled != a3)
  {
    self->_listenForNewWorkoutsForRaceRouteEnabled = a3;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_listenForNewWorkoutsForRaceRouteEnabled)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "listening for new workouts for Race Route enabled, %@", (uint8_t *)&v6, 0xCu);
    }

    if (self->_listenForNewWorkoutsForRaceRouteEnabled)
      -[RTHealthKitManager _listenForNewWorkoutsForRaceRoute](self, "_listenForNewWorkoutsForRaceRoute");
    else
      -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_theNewWorkoutsForRaceRouteQuery);
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5);
  +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForRaceRouteNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[RTHealthKitManager setListenForNewWorkoutsForRaceRouteEnabled:](self, "setListenForNewWorkoutsForRaceRouteEnabled:", v6 != 0);
  }
  else
  {
    +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForSMSuggestionsNotification, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
    {
      -[RTHealthKitManager setListenForNewWorkoutsForSMSuggestionsEnabled:](self, "setListenForNewWorkoutsForSMSuggestionsEnabled:", v6 != 0);
    }
    else
    {
      +[RTNotification notificationName](RTHealthKitManagerWorkoutSnapshotUpdateNotification, "notificationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqualToString:", v11);

      if (v12)
      {
        -[RTHealthKitManager setListenForWorkoutSnapshotUpdatesEnabled:](self, "setListenForWorkoutSnapshotUpdatesEnabled:", v6 != 0);
      }
      else
      {
        +[RTNotification notificationName](RTHealthKitManagerWorkoutOngoingChangedNotification, "notificationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "isEqualToString:", v13);

        if (v14)
        {
          -[RTHealthKitManager setListenForWorkoutOngoingChangedEnabled:](self, "setListenForWorkoutOngoingChangedEnabled:", v6 != 0);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = 138412290;
            v17 = v5;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
          }

        }
      }
    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5);
  +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForRaceRouteNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[RTHealthKitManager setListenForNewWorkoutsForRaceRouteEnabled:](self, "setListenForNewWorkoutsForRaceRouteEnabled:", v6 != 0);
  }
  else
  {
    +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForSMSuggestionsNotification, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
    {
      -[RTHealthKitManager setListenForNewWorkoutsForSMSuggestionsEnabled:](self, "setListenForNewWorkoutsForSMSuggestionsEnabled:", v6 != 0);
    }
    else
    {
      +[RTNotification notificationName](RTHealthKitManagerWorkoutSnapshotUpdateNotification, "notificationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqualToString:", v11);

      if (v12)
      {
        -[RTHealthKitManager setListenForWorkoutSnapshotUpdatesEnabled:](self, "setListenForWorkoutSnapshotUpdatesEnabled:", v6 != 0);
      }
      else
      {
        +[RTNotification notificationName](RTHealthKitManagerWorkoutOngoingChangedNotification, "notificationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "isEqualToString:", v13);

        if (v14)
        {
          -[RTHealthKitManager setListenForWorkoutOngoingChangedEnabled:](self, "setListenForWorkoutOngoingChangedEnabled:", v6 != 0);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = 138412290;
            v17 = v5;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v16, 0xCu);
          }

        }
      }
    }
  }

}

- (void)_listenForNewWorkoutsForRaceRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HKObserverQuery *v13;
  HKObserverQuery *theNewWorkoutsForRaceRouteQuery;
  _QWORD v15[5];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!self->_theNewWorkoutsForRaceRouteQuery)
  {
    v3 = (void *)MEMORY[0x1E0CB3528];
    -[RTHealthKitManager _getRTWorkoutDefaultTypesForRaceRoute](self, "_getRTWorkoutDefaultTypesForRaceRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTHealthKitManager _getPredicatesFromRTWorkoutDefaultTypes:](self, "_getPredicatesFromRTWorkoutDefaultTypes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orPredicateWithSubpredicates:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB6A78], "_predicateForObjectsFromAppleWatches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB6980]);
    objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__RTHealthKitManager__listenForNewWorkoutsForRaceRoute__block_invoke;
    v15[3] = &unk_1E92A4348;
    v15[4] = self;
    v13 = (HKObserverQuery *)objc_msgSend(v11, "initWithSampleType:predicate:updateHandler:", v12, v10, v15);
    theNewWorkoutsForRaceRouteQuery = self->_theNewWorkoutsForRaceRouteQuery;
    self->_theNewWorkoutsForRaceRouteQuery = v13;

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_theNewWorkoutsForRaceRouteQuery);
  }
}

void __55__RTHealthKitManager__listenForNewWorkoutsForRaceRoute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (**v4)(void);

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "onNewWorkoutForRaceRouteNotification");
  v4[2]();

}

- (void)onNewWorkoutForRaceRouteNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTHealthKitManager_onNewWorkoutForRaceRouteNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __58__RTHealthKitManager_onNewWorkoutForRaceRouteNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNewWorkoutForRaceRouteNotification");
}

- (void)_onNewWorkoutForRaceRouteNotification
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[RTHealthKitManager receivedInitialNewWorkoutsQueryResponse](self, "receivedInitialNewWorkoutsQueryResponse"))
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
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, posting New Workout Notification", (uint8_t *)&v9, 0x16u);

    }
    v8 = (void *)objc_opt_new();
    -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
  else
  {
    -[RTHealthKitManager setReceivedInitialNewWorkoutsQueryResponse:](self, "setReceivedInitialNewWorkoutsQueryResponse:", 1);
  }
}

- (void)onNewWorkoutForSMSuggestionsNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager_onNewWorkoutForSMSuggestionsNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __62__RTHealthKitManager_onNewWorkoutForSMSuggestionsNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNewWorkoutForSMSuggestionsNotification");
}

- (void)_onNewWorkoutForSMSuggestionsNotification
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[RTHealthKitManager listenForNewWorkoutsForSMSuggestionsEnabled](self, "listenForNewWorkoutsForSMSuggestionsEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, Posting New Workout Notification For SM Suggestions", (uint8_t *)&v13, 0x16u);

    }
    v5 = objc_opt_new();
    -[RTNotifier postNotification:](self, "postNotification:", v5);
  }
  else if (v6)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for Workout Notification For SM Suggestions. Hence skipping the notification", (uint8_t *)&v13, 0x16u);

  }
}

- (void)onWorkoutSnapshotUpdateNotification:(id)a3
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
  v7[2] = __58__RTHealthKitManager_onWorkoutSnapshotUpdateNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTHealthKitManager_onWorkoutSnapshotUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkoutSnapshotUpdateNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWorkoutSnapshotUpdateNotification:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[RTHealthKitManager listenForWorkoutSnapshotUpdatesEnabled](self, "listenForWorkoutSnapshotUpdatesEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315394;
      v13 = "-[RTHealthKitManager _onWorkoutSnapshotUpdateNotification:]";
      v14 = 2112;
      v15 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%s, Posting New Workout Snapshot Update Notification, %@", (uint8_t *)&v12, 0x16u);
    }

    -[RTNotifier postNotification:](self, "postNotification:", v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for Workout Snapshot Update Notification. Hence skipping the notification", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)onWorkoutOngoingChangedNotification:(id)a3
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
  v7[2] = __58__RTHealthKitManager_onWorkoutOngoingChangedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTHealthKitManager_onWorkoutOngoingChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkoutOngoingChangedNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWorkoutOngoingChangedNotification:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[RTHealthKitManager listenForWorkoutOngoingChangedEnabled](self, "listenForWorkoutOngoingChangedEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315394;
      v13 = "-[RTHealthKitManager _onWorkoutOngoingChangedNotification:]";
      v14 = 2112;
      v15 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%s, Posting WorkoutOnGoingChanged Notification, %@", (uint8_t *)&v12, 0x16u);
    }

    -[RTNotifier postNotification:](self, "postNotification:", v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, No active listeners for WorkoutOnGoingChanged Notification. Hence skipping the notification", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (BOOL)_doesWorkoutHaveSubsetRoute:(id)a3
{
  id v3;
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
  BOOL v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7308]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7310]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7318]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "metadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72E8]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v21 = v11;
            objc_msgSend(v4, "metadata");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F0]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v13;
            if (v14)
            {
              objc_msgSend(v4, "metadata");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F8]);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15 != 0;

            }
            else
            {
              v16 = 0;
            }

            v11 = v21;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)_getTotalDistanceForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[16];

  v4 = a3;
  if (v4)
  {
    if (-[RTHealthKitManager _doesWorkoutHaveSubsetRoute:](self, "_doesWorkoutHaveSubsetRoute:", v4))
    {
      objc_msgSend(v4, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
      objc_msgSend(v4, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7310]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v8 - v11;

      v13 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "totalDistance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (double)_getDurationForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  uint8_t v16[16];

  v4 = a3;
  if (v4)
  {
    if (-[RTHealthKitManager _doesWorkoutHaveSubsetRoute:](self, "_doesWorkoutHaveSubsetRoute:", v4))
    {
      objc_msgSend(v4, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
      objc_msgSend(v4, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7318]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v8 - v11;

    }
    else
    {
      objc_msgSend(v4, "duration");
      v12 = v14;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v16, 2u);
    }

    v12 = 0.0;
  }

  return v12;
}

- (id)_getStartDateForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    if (-[RTHealthKitManager _doesWorkoutHaveSubsetRoute:](self, "_doesWorkoutHaveSubsetRoute:", v4))
    {
      objc_msgSend(v4, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7308]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)_getEndDateForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    if (-[RTHealthKitManager _doesWorkoutHaveSubsetRoute:](self, "_doesWorkoutHaveSubsetRoute:", v4))
    {
      objc_msgSend(v4, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72E8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  uint64_t *v35;
  int64_t v36;
  double v37;
  BOOL v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a10;
  v22 = v21;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutTypes"));
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (a4 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThre"
                           "shold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1124;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v47 = __Block_byref_object_copy__146;
  v48 = __Block_byref_object_dispose__146;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__146;
  v44 = __Block_byref_object_dispose__146;
  v45 = 0;
  -[RTNotifier queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __170__RTHealthKitManager_getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
  block[3] = &unk_1E92A4370;
  v34 = buf;
  block[4] = self;
  v30 = v18;
  v36 = a4;
  v31 = v19;
  v32 = v20;
  v37 = a7;
  v38 = a8;
  v39 = a9;
  v33 = v22;
  v35 = &v40;
  dispatch_sync(v24, block);

  if (a11)
    *a11 = objc_retainAutorelease((id)v41[5]);
  v25 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

LABEL_20:
  return v25;
}

void __170__RTHealthKitManager_getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(double *)(a1 + 96);
  v8 = *(unsigned __int8 *)(a1 + 104);
  v9 = *(unsigned __int8 *)(a1 + 105);
  v10 = *(_QWORD *)(a1 + 88);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v2, "_getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v3, v10, v4, v5, v8, v9, v7, v6, &obj);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)_getWorkoutsWithStartDate:(id)a3 limit:(int64_t)a4 sortDescriptors:(id)a5 nearLocation:(id)a6 distanceThreshold:(double)a7 onlySourcedFromFitnessApp:(BOOL)a8 includePastureModeRoutes:(BOOL)a9 workoutTypes:(id)a10 error:(id *)a11
{
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  dispatch_semaphore_t v34;
  void *v35;
  void *v36;
  int64_t v37;
  NSObject *v38;
  void *v39;
  dispatch_time_t v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  void *v64;
  void *v65;
  char v66;
  id *v67;
  BOOL v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  objc_class *v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  void *context;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  NSObject *dsema;
  void *v100;
  uint64_t v101;
  id v102;
  _BOOL4 v105;
  id v106;
  id obj;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  NSObject *v114;
  uint64_t *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE buf[12];
  __int16 v134;
  id v135;
  __int16 v136;
  int64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  uint64_t v143;
  _BYTE v144[128];
  _BYTE v145[128];
  void *v146;
  _QWORD v147[4];

  v105 = a8;
  v147[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v91 = a5;
  v102 = a6;
  v15 = a10;
  v88 = v14;
  v92 = v15;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v83, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_74;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a11)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutTypes"));
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_74:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v106 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_75;
  }
  if (!objc_msgSend(v15, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThr"
                           "eshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      v134 = 1024;
      LODWORD(v135) = 1157;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "workout types cannot be zero (in %s:%d)", buf, 0x12u);
    }

  }
  if (a4 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThr"
                           "eshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:]";
      v134 = 1024;
      LODWORD(v135) = 1158;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v91)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3928]);
    v19 = (void *)objc_msgSend(v18, "initWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
    v146 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)a4 >= 0x1389)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v22;
      v134 = 2112;
      v135 = v23;
      v136 = 2048;
      v137 = a4;
      v138 = 2048;
      v139 = 5000;
      v140 = 2048;
      v141 = 5000;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, limit, %lu, excedded maximum value, %lu. Reducing limit to max of %lu", buf, 0x34u);

    }
  }
  v106 = (id)objc_opt_new();
  v100 = (void *)objc_opt_new();
  v97 = v14;
  v89 = *MEMORY[0x1E0D18598];
  v90 = *MEMORY[0x1E0CB2D50];
  v101 = *MEMORY[0x1E0CB7390];
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v98 = (void *)objc_opt_new();
    if (v105)
    {
      objc_msgSend(MEMORY[0x1E0CB6A78], "_predicateForObjectsFromAppleWatches");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addObject:", v24);

    }
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v97, 0, 1);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObject:", v96);
    if (objc_msgSend(v92, "count"))
    {
      v25 = (void *)objc_opt_new();
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v26 = v92;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v130 != v28)
              objc_enumerationMutation(v26);
            v30 = +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * i), "unsignedIntegerValue"));
            objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForWorkoutsWithWorkoutActivityType:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v31);

          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
        }
        while (v27);
      }

      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 2, v25);
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB3528];
      -[RTHealthKitManager _getRTWorkoutDefaultTypesForRaceRoute](self, "_getRTWorkoutDefaultTypesForRaceRoute");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTHealthKitManager _getPredicatesFromRTWorkoutDefaultTypes:](self, "_getPredicatesFromRTWorkoutDefaultTypes:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "orPredicateWithSubpredicates:", v33);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v98, "addObject:", v95);
    v123 = 0;
    v124 = &v123;
    v125 = 0x3032000000;
    v126 = __Block_byref_object_copy__146;
    v127 = __Block_byref_object_dispose__146;
    v128 = 0;
    v117 = 0;
    v118 = &v117;
    v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__146;
    v121 = __Block_byref_object_dispose__146;
    v122 = 0;
    v34 = dispatch_semaphore_create(0);
    -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v98);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a4 - objc_msgSend(v106, "count");
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __171__RTHealthKitManager__getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
    v113[3] = &unk_1E9296EE0;
    v115 = &v123;
    v116 = &v117;
    v38 = v34;
    v114 = v38;
    objc_msgSend(v35, "fetchWorkoutsWithPredicate:limit:sortDescriptors:completion:", v36, v37, v91, v113);

    dsema = v38;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v40))
      goto LABEL_35;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceDate:", v39);
    v43 = v42;
    v44 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "filteredArrayUsingPredicate:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "submitToCoreAnalytics:type:duration:", v48, 1, v43);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v50 = (void *)MEMORY[0x1E0CB35C8];
    v147[0] = v90;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v147, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v89, 15, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = objc_retainAutorelease(v52);

    }
    else
    {
LABEL_35:
      v53 = 0;
    }

    v94 = v53;
    if (v94)
      objc_msgSend(v100, "addObject:", v94);
    if (v118[5])
      objc_msgSend(v100, "addObject:");
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v54 = (id)v124[5];
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v109, v144, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v110;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v110 != v56)
            objc_enumerationMutation(v54);
          v58 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
          v59 = (void *)MEMORY[0x1D8231EA8]();
          if (!a4 || objc_msgSend(v106, "count") != a4)
          {
            if (!v105)
              goto LABEL_78;
            objc_msgSend(v58, "sourceRevision");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "source");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "bundleIdentifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "rangeOfString:", CFSTR("com.apple.health")) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v63)
            {
LABEL_78:
              if (a9
                || (objc_msgSend(v58, "metadata"),
                    v64 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v64, "valueForKey:", v101),
                    v65 = (void *)objc_claimAutoreleasedReturnValue(),
                    v66 = objc_msgSend(v65, "BOOLValue"),
                    v65,
                    v64,
                    (v66 & 1) == 0))
              {
                v67 = (id *)(v118 + 5);
                obj = (id)v118[5];
                v68 = -[RTHealthKitManager _isWorkoutFiltered:currentLocation:distanceThreshold:error:](self, "_isWorkoutFiltered:currentLocation:distanceThreshold:error:", v58, v102, &obj, a7);
                objc_storeStrong(v67, obj);
                if (v118[5])
                {
                  objc_msgSend(v100, "addObject:");
                  v69 = (void *)v118[5];
                  v118[5] = 0;

                }
                else if (!v68)
                {
                  objc_msgSend(v106, "addObject:", v58);
                }
              }
            }
          }
          objc_autoreleasePoolPop(v59);
        }
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v109, v144, 16);
      }
      while (v55);
    }

    v70 = objc_msgSend((id)v124[5], "count");
    v71 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend((id)v124[5], "lastObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "startDate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "dateWithTimeInterval:sinceDate:", v73, 0.001);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      v78 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v79 = (id)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v106, "count");
      objc_msgSend(v74, "stringFromDate");
      v81 = (id)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v78;
      v134 = 2112;
      v135 = v79;
      v136 = 2048;
      v137 = v80;
      v138 = 2048;
      v139 = v70;
      v140 = 2112;
      v141 = (uint64_t)v81;
      v142 = 2048;
      v143 = v82;
      _os_log_debug_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_DEBUG, "%@, %@, workouts count, %lu, batchedWorkoutsCount, %lu, next startDate, %@, footprint, %.2f MB", buf, 0x3Eu);

    }
    v76 = (void *)v124[5];
    v124[5] = 0;

    _Block_object_dispose(&v117, 8);
    _Block_object_dispose(&v123, 8);

    objc_autoreleasePoolPop(context);
    if (!v70)
      break;
    v97 = v74;
  }
  while (objc_msgSend(v106, "count") < (unint64_t)a4);
  if (a11)
  {
    _RTSafeArray();
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a11 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_75:

  return v106;
}

void __171__RTHealthKitManager__getWorkoutsWithStartDate_limit_sortDescriptors_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_isWorkoutFiltered:(id)a3 currentLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  id v23;
  void *v24;
  unint64_t v25;
  BOOL v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  id v30;
  void *v31;
  objc_class *v32;
  id v33;
  id v34;
  void *v35;
  unint64_t v36;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD *v41;
  _BYTE *v42;
  double v43;
  SEL v44;
  _QWORD v45[5];
  id v46;
  _BYTE buf[24];
  void *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v11)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__146;
    v45[4] = __Block_byref_object_dispose__146;
    v46 = 0;
    -[RTHealthKitManager _getTotalDistanceForWorkout:](self, "_getTotalDistanceForWorkout:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    v16 = v15;

    -[RTHealthKitManager _getDurationForWorkout:](self, "_getDurationForWorkout:", v11);
    v18 = v17;
    if ((objc_msgSend(v11, "workoutActivityType") == 37 || objc_msgSend(v11, "workoutActivityType") == 71)
      && (v16 >= (double)-[RTHealthKitManager workoutMinDistance](self, "workoutMinDistance")
        ? (v19 = v18 < 60.0)
        : (v19 = 1),
          v19))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[RTHealthKitManager workoutMinDistance](self, "workoutMinDistance");
        *(_DWORD *)buf = 138413826;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2112;
        v48 = v24;
        v49 = 2048;
        v50 = v16;
        v51 = 2048;
        v52 = v25;
        v53 = 2048;
        v54 = (unint64_t)v18;
        v55 = 2048;
        v56 = 60;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, short workout, workout distance, %.4f, min distance threshold, %lu, workout duration, %lu, min duration threshold, %lu", buf, 0x48u);

      }
    }
    else if (objc_msgSend(v11, "workoutActivityType") == 13
           && (v16 < (double)-[RTHealthKitManager workoutMinDistanceCycling](self, "workoutMinDistanceCycling")
            || v18 < 60.0))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[RTHealthKitManager workoutMinDistanceCycling](self, "workoutMinDistanceCycling");
        *(_DWORD *)buf = 138413826;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v48 = v35;
        v49 = 2048;
        v50 = v16;
        v51 = 2048;
        v52 = v36;
        v53 = 2048;
        v54 = (unint64_t)v18;
        v55 = 2048;
        v56 = 60;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, short workout, workout distance, %.4f, min distance threshold, %lu, workout duration, %lu, min duration threshold, %lu", buf, 0x48u);

      }
    }
    else
    {
      if (v16 <= 250000.0 && v18 <= 72000.0)
      {
        v26 = 0;
        if (v12 && a5 != 1.79769313e308)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v48) = 0;
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __81__RTHealthKitManager__isWorkoutFiltered_currentLocation_distanceThreshold_error___block_invoke;
          v38[3] = &unk_1E92A4398;
          v41 = v45;
          v38[4] = self;
          v39 = v12;
          v43 = a5;
          v44 = a2;
          v40 = v11;
          v42 = buf;
          -[RTHealthKitManager _getRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:](self, "_getRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:", v40, 3, 1, 0, v38);
          v26 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

          _Block_object_dispose(buf, 8);
        }
        goto LABEL_31;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v48 = v31;
        v49 = 2048;
        v50 = v16;
        v51 = 2048;
        v52 = 250000;
        v53 = 2048;
        v54 = (unint64_t)v18;
        v55 = 2048;
        v56 = 72000;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, long workout, workout distance, %.4f, max distance threshold, %lu, workout duration, %lu, max duration threshold, %lu", buf, 0x48u);

      }
    }

    v26 = 1;
LABEL_31:
    _Block_object_dispose(v45, 8);

    goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 1;
LABEL_32:

  return v26;
}

void __81__RTHealthKitManager__isWorkoutFiltered_currentLocation_distanceThreshold_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8231EA8]();
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  }
  else if (a3)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocationCoordinate2D:", a2);
    objc_msgSend(*(id *)(a1 + 32), "distanceCalculator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v11, "distanceFromLocation:toLocation:error:", v10, v12, &obj);
    v15 = v14;
    objc_storeStrong((id *)(v13 + 40), obj);

    if (v15 > *(double *)(a1 + 72))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138413314;
        v24 = v18;
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v20;
        v29 = 2048;
        v30 = v15;
        v31 = 2048;
        v32 = v21;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, %@, UUID, %@, workout filtered, YES, reason, distance to the location exceeds distance threshold, distance, %.2f, distance threshold, %.2f,", buf, 0x34u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  objc_autoreleasePoolPop(v9);

}

- (int64_t)getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8
{
  id v14;
  id v15;
  NSObject *v16;
  int64_t v17;
  NSObject *v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint8_t *v24;
  double v25;
  BOOL v26;
  BOOL v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v14 = a3;
  v15 = a4;
  if (v14)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__146;
    v32 = __Block_byref_object_dispose__146;
    v33 = 0;
    -[RTNotifier queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __140__RTHealthKitManager_getWorkoutsCountWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_error___block_invoke;
    block[3] = &unk_1E92A43C0;
    v23 = &v34;
    block[4] = self;
    v21 = v14;
    v25 = a5;
    v26 = a6;
    v27 = a7;
    v22 = v15;
    v24 = buf;
    dispatch_sync(v16, block);

    if (a8)
      *a8 = objc_retainAutorelease(*((id *)v29 + 5));
    v17 = v35[3];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

void __140__RTHealthKitManager_getWorkoutsCountWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(double *)(a1 + 72);
  v6 = *(unsigned __int8 *)(a1 + 80);
  v7 = *(unsigned __int8 *)(a1 + 81);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v2, "_getWorkoutsCountWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:error:", v3, v4, v6, v7, &obj, v5);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
}

- (int64_t)_getWorkoutsCountWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 error:(id *)a8
{
  id v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  id v29;
  id v30;
  uint8_t buf[16];

  v27 = a6;
  v28 = a7;
  v12 = a3;
  v29 = a4;
  if (v12)
  {
    v26 = a8;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = v13;
      v16 = (void *)MEMORY[0x1D8231EA8]();
      -[RTHealthKitManager getWorkoutDefaultSortDescriptors](self, "getWorkoutDefaultSortDescriptors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTHealthKitManager _getRTWorkoutDefaultTypesForRaceRoute](self, "_getRTWorkoutDefaultTypesForRaceRoute");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      -[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:](self, "_getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v12, 50, v17, v29, v27, v28, a5, v18, &v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v30;

      if (v19)
        break;
      v14 += objc_msgSend(v13, "count");
      v20 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateWithTimeInterval:sinceDate:", v22, 0.001);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v16);
      v12 = v23;
      if (!objc_msgSend(v13, "count"))
        goto LABEL_11;
    }
    objc_autoreleasePoolPop(v16);
    v23 = v12;
LABEL_11:
    if (v26)
      *v26 = objc_retainAutorelease(v19);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v14 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t *v30;
  uint64_t *v31;
  double v32;
  BOOL v33;
  BOOL v34;
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

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = v18;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a9)
    {
      v23 = CFSTR("startDate");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a9)
    {
      v23 = CFSTR("workoutTypes");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  v42 = buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__146;
  v45 = __Block_byref_object_dispose__146;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__146;
  v39 = __Block_byref_object_dispose__146;
  v40 = 0;
  -[RTNotifier queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __153__RTHealthKitManager_getLatestWorkoutWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke;
  v26[3] = &unk_1E92A43E8;
  v30 = buf;
  v26[4] = self;
  v27 = v16;
  v28 = v17;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v29 = v19;
  v31 = &v35;
  dispatch_sync(v20, v26);

  if (a9)
    *a9 = objc_retainAutorelease((id)v36[5]);
  v21 = *((id *)v42 + 5);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v21;
}

void __153__RTHealthKitManager_getLatestWorkoutWithStartDate_nearLocation_distanceThreshold_onlySourcedFromFitnessApp_includePastureModeRoutes_workoutTypes_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(double *)(a1 + 80);
  v6 = *(unsigned __int8 *)(a1 + 88);
  v7 = *(unsigned __int8 *)(a1 + 89);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v2, "_getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v3, v4, v6, v7, v8, &obj, v5);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)_getLatestWorkoutWithStartDate:(id)a3 nearLocation:(id)a4 distanceThreshold:(double)a5 onlySourcedFromFitnessApp:(BOOL)a6 includePastureModeRoutes:(BOOL)a7 workoutTypes:(id)a8 error:(id *)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  id *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  objc_class *v43;
  void *v44;
  void *v45;
  const char *aSelector;
  id *v47;
  id v48;
  _BOOL4 v49;
  id v50;
  id v51;
  uint64_t v52;
  const __CFString *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v49 = a7;
  v11 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v50 = a4;
  v17 = a8;
  v18 = v17;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v16 = 0;
LABEL_24:
      v41 = 0;
      *a9 = v39;
      goto LABEL_32;
    }
    v16 = 0;
LABEL_29:
    v41 = 0;
    goto LABEL_32;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutTypes"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_29;
  }
  aSelector = a2;
  v47 = a9;
  v19 = 0;
  v20 = 0;
  v48 = v17;
  while (1)
  {
    v21 = v19;
    v22 = (void *)MEMORY[0x1D8231EA8]();
    -[RTHealthKitManager getWorkoutDefaultSortDescriptors](self, "getWorkoutDefaultSortDescriptors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    -[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:](self, "_getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v16, 50, v23, v50, v11, v49, a5, v18, &v51);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v51;

    if (v24)
      break;
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "lastObject");
      v25 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v25;
    }
    v26 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v19, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateWithTimeInterval:sinceDate:", v28, 0.001);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v22);
    v16 = (id)v29;
    v18 = v48;
    if (!objc_msgSend(v19, "count"))
    {
      v30 = v47 != 0;
      v16 = (id)v29;
      if (!v20)
        goto LABEL_9;
      goto LABEL_10;
    }
  }
  objc_autoreleasePoolPop(v22);
  v36 = v47;
  if (v47)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    goto LABEL_35;
  }
  v30 = 0;
  if (!v20)
  {
LABEL_9:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v52 = *MEMORY[0x1E0CB2D50];
    v53 = CFSTR("workouts count is zero");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 7, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v34;
  }
LABEL_10:
  if (v24)
    v35 = v30;
  else
    v35 = 0;
  v36 = v47;
  if (v35)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v37 = objc_claimAutoreleasedReturnValue();
    v18 = v48;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      v24 = objc_retainAutorelease(v24);
      v41 = 0;
      *v36 = v24;
      goto LABEL_31;
    }
LABEL_35:
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v55 = v44;
    v56 = 2112;
    v57 = v45;
    v58 = 2112;
    v59 = v24;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    v36 = v47;
    goto LABEL_27;
  }
  v20 = v20;
  v41 = v20;
  v18 = v48;
LABEL_31:

LABEL_32:
  return v41;
}

- (id)getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__146;
    v25 = __Block_byref_object_dispose__146;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__146;
    v19 = __Block_byref_object_dispose__146;
    v20 = 0;
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__RTHealthKitManager_getLatestWorkoutDateIntervalWithStartDate_error___block_invoke;
    v11[3] = &unk_1E92A4410;
    v13 = buf;
    v11[4] = self;
    v12 = v6;
    v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
    v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
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

void __70__RTHealthKitManager_getLatestWorkoutDateIntervalWithStartDate_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_getLatestWorkoutDateIntervalWithStartDate:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_getLatestWorkoutDateIntervalWithStartDate:(id)a3 error:(id *)a4
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
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id *v36;
  NSObject *v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v50;
  id v51;
  id obj;
  _QWORD v54[4];
  NSObject *v55;
  uint64_t *v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t v64[8];
  uint8_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE buf[12];
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    *(_QWORD *)v64 = 0;
    v65 = v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__146;
    v68 = __Block_byref_object_dispose__146;
    v69 = 0;
    v6 = dispatch_semaphore_create(0);
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__146;
    v62 = __Block_byref_object_dispose__146;
    v63 = 0;
    -[RTHealthKitManager workoutObserver](self, "workoutObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __71__RTHealthKitManager__getLatestWorkoutDateIntervalWithStartDate_error___block_invoke;
    v54[3] = &unk_1E92A4438;
    v56 = &v58;
    v57 = v64;
    v8 = v6;
    v55 = v8;
    objc_msgSend(v7, "currentWorkoutSnapshotWithCompletion:", v54);

    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v9, v11))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v77[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v77, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_retainAutorelease(v23);

      v25 = 0;
    }
    else
    {
LABEL_7:
      v24 = 0;
      v25 = 1;
    }

    v51 = v24;
    if ((v25 & 1) == 0)
    {
      objc_storeStrong((id *)v65 + 5, v24);
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "Current workout snapshot fetch timed out", buf, 2u);
      }

    }
    v27 = (void *)v59[5];
    if (v27)
    {
      objc_msgSend(v27, "builderStartDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v28, "stringFromDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "Current workout snapshot retrieved with builder start date, %@", buf, 0xCu);

      }
      if (v28)
      {
        if (a4)
          *a4 = objc_retainAutorelease(*((id *)v65 + 5));
        v31 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithStartDate:endDate:", v28, v32);

        goto LABEL_38;
      }
      if (a4)
      {
        v47 = objc_retainAutorelease(*((id *)v65 + 5));
LABEL_36:
        v28 = 0;
        v33 = 0;
        *a4 = v47;
LABEL_38:

        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(v64, 8);

        goto LABEL_39;
      }
    }
    else
    {
      -[RTHealthKitManager _getWorkoutAllTypes](self, "_getWorkoutAllTypes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (id *)(v65 + 40);
      obj = (id)*((_QWORD *)v65 + 5);
      -[RTHealthKitManager _getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:](self, "_getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v5, 0, 0, 1, v35, &obj, 1.79769313e308);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v36, obj);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v38)
        {
          objc_msgSend(v28, "startDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringFromDate");
          v39 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "endDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringFromDate");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v28, "workoutActivityType"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *((_QWORD *)v65 + 5);
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v39;
          v71 = 2112;
          v72 = v41;
          v73 = 2112;
          v74 = v42;
          v75 = 2112;
          v76 = v43;
          _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_DEFAULT, "recent workout retrieved, workout start, %@, workout end, %@, workout type, %@, error, %@", buf, 0x2Au);

        }
        if (a4)
          *a4 = objc_retainAutorelease(*((id *)v65 + 5));
        v44 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v28, "startDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "endDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v44, "initWithStartDate:endDate:", v45, v46);

        goto LABEL_38;
      }
      if (v38)
      {
        v48 = *((_QWORD *)v65 + 5);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_DEFAULT, "no recent workout retrieved, error, %@", buf, 0xCu);
      }

      if (a4)
      {
        v47 = objc_retainAutorelease(*((id *)v65 + 5));
        goto LABEL_36;
      }
    }
    v28 = 0;
    v33 = 0;
    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v64 = 0;
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v64, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
    v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_39:

  return v33;
}

void __71__RTHealthKitManager__getLatestWorkoutDateIntervalWithStartDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getWorkoutsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__146;
    v25 = __Block_byref_object_dispose__146;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__146;
    v19 = __Block_byref_object_dispose__146;
    v20 = 0;
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__RTHealthKitManager_getWorkoutsWithUUIDs_error___block_invoke;
    v11[3] = &unk_1E92A4410;
    v13 = buf;
    v11[4] = self;
    v12 = v6;
    v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
    v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __49__RTHealthKitManager_getWorkoutsWithUUIDs_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_getWorkoutsWithUUIDs:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_getWorkoutsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  id *v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  uint8_t buf[16];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v48 = a4;
    v46 = (void *)objc_opt_new();
    v44 = (void *)objc_opt_new();
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v49 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v55 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectWithUUID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v11);
    }

    -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __50__RTHealthKitManager__getWorkoutsWithUUIDs_error___block_invoke;
    v50[3] = &unk_1E92A4460;
    v19 = v46;
    v51 = v19;
    v20 = v44;
    v52 = v20;
    v21 = v7;
    v53 = v21;
    objc_msgSend(v17, "fetchWorkoutsWithPredicate:anchor:limit:completion:", v18, 0, 0, v50);

    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v22, v24))
    {
      v47 = v19;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceDate:", v23);
      v26 = v25;
      v27 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0D18598];
      v59 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v59, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 15, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v37 = objc_retainAutorelease(v36);

      }
      else
      {
        v37 = 0;
      }
      v19 = v47;
      v40 = v48;
    }
    else
    {
      v37 = 0;
      v40 = v48;
    }

    v41 = v37;
    if (v41)
      objc_msgSend(v20, "addObject:", v41);
    if (v40)
    {
      _RTSafeArray();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    v39 = v19;

    v6 = v49;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

void __50__RTHealthKitManager__getWorkoutsWithUUIDs_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D8231EA8](v11);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v15, (_QWORD)v20);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v12 = v11;
    }
    while (v11);
  }

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  v17 = objc_alloc(MEMORY[0x1E0CB3928]);
  v18 = (void *)objc_msgSend(v17, "initWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v24 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sortUsingDescriptors:", v19);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)_getWorkoutAllTypes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E93293C0, &unk_1E93293D8, &unk_1E93293F0, &unk_1E9329408, &unk_1E9329420, 0);
}

- (id)_getRTWorkoutDefaultTypesForRaceRoute
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E93293C0, &unk_1E93293D8, &unk_1E93293F0, 0);
}

- (id)_getRTWorkoutDefaultTypesForSMSuggestions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E93293C0, &unk_1E93293D8, &unk_1E9329408, &unk_1E9329420, 0);
}

- (id)_getPredicatesFromRTWorkoutDefaultTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v14));
          objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForWorkoutsWithWorkoutActivityType:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutTypes", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)isWorkoutActivityType:(unint64_t)a3 inTypes:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8](v6);
        v12 = objc_msgSend(v10, "unsignedIntValue", (_QWORD)v15);
        objc_autoreleasePoolPop(v11);
        if (v12 == a3)
        {
          v13 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_getWorkoutDefaultStartDateForRaceRoute
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 4, -10, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_getWorkoutDefaultEndDateForRaceRoute
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)getWorkoutDefaultSortDescriptors
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3928]);
  v3 = (void *)objc_msgSend(v2, "initWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__146;
    v25 = __Block_byref_object_dispose__146;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__146;
    v19 = __Block_byref_object_dispose__146;
    v20 = 0;
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__RTHealthKitManager_getWorkoutRouteUsingWorkout_error___block_invoke;
    v11[3] = &unk_1E92A4410;
    v13 = buf;
    v11[4] = self;
    v12 = v6;
    v14 = &v15;
    dispatch_sync(v7, v11);

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
    v8 = *((id *)v22 + 5);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __56__RTHealthKitManager_getWorkoutRouteUsingWorkout_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_getWorkoutRouteUsingWorkout:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_getWorkoutRouteUsingWorkout:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
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
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  uint8_t *v40;
  uint8_t v41[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint8_t buf[16];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    *(_QWORD *)v41 = 0;
    v42 = v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__146;
    v45 = __Block_byref_object_dispose__146;
    v46 = (id)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v7 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromWorkout:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB62C0]);
    objc_msgSend(MEMORY[0x1E0CB6B50], "workoutRouteType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __57__RTHealthKitManager__getWorkoutRouteUsingWorkout_error___block_invoke;
    v37[3] = &unk_1E92A4488;
    v40 = v41;
    v10 = v6;
    v38 = v10;
    v11 = v7;
    v39 = v11;
    v34 = (void *)objc_msgSend(v8, "initWithType:predicate:anchor:limit:resultsHandler:", v9, v35, 0, 0, v37);

    -[RTHealthKitManager healthStore](self, "healthStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executeQuery:", v34);

    v13 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v14);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
    v47 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v47, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_retainAutorelease(v27);

    }
    else
    {
LABEL_7:
      v28 = 0;
    }

    v29 = v28;
    if (v29)
      objc_msgSend(v10, "addObject:", v29);
    if (a4)
    {
      _RTSafeArray();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = *((id *)v42 + 5);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v41 = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", v41, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

void __57__RTHealthKitManager__getWorkoutRouteUsingWorkout_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v20);
        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  if (v14)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__RTHealthKitManager_fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke;
  block[3] = &unk_1E929E1B8;
  block[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v18 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

uint64_t __102__RTHealthKitManager_fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutRouteLocationsUsingWorkoutRoute:batchSize:fetchOnlyFirstFew:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutRouteLocationsUsingWorkoutRoute:(id)a3 batchSize:(unint64_t)a4 fetchOnlyFirstFew:(BOOL)a5 handler:(id)a6
{
  id v10;
  void (**v11)(id, void *, void *);
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  id v16;
  void (**v17)(id, void *, void *);
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  NSObject *v42;
  RTHealthKitManager *v43;
  id v44;
  void (**v45)(id, void *, void *);
  _QWORD *v46;
  unint64_t v47;
  BOOL v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  uint8_t buf[16];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *, void *))a6;
  v40 = v10;
  if (v10)
  {
    v39 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("workoutRoute cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14, v39);

  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__146;
  v49[4] = __Block_byref_object_dispose__146;
  v50 = (id)objc_opt_new();
  v15 = dispatch_semaphore_create(0);
  v16 = objc_alloc(MEMORY[0x1E0CB6E70]);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __103__RTHealthKitManager__fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke;
  v41[3] = &unk_1E92A44B0;
  v17 = v11;
  v45 = v17;
  v18 = v15;
  v48 = a5;
  v42 = v18;
  v43 = self;
  v46 = v49;
  v47 = a4;
  v44 = 0;
  v19 = (void *)objc_msgSend(v16, "initWithRoute:dataHandler:", v40, v41);
  -[RTHealthKitManager healthStore](self, "healthStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "executeQuery:", v19);

  v21 = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v21, v23))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:", v22);
  v26 = v25;
  v27 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v33 = (void *)MEMORY[0x1E0CB35C8];
  v53 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v53, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = objc_retainAutorelease(v35);

  }
  else
  {
LABEL_9:
    v36 = 0;
  }

  v37 = v36;
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v38, v37);

  }
  _Block_object_dispose(v49, 8);

}

void __103__RTHealthKitManager__fetchWorkoutRouteLocationsUsingWorkoutRoute_batchSize_fetchOnlyFirstFew_handler___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v11);
LABEL_3:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_4;
  }
  if (*(_BYTE *)(a1 + 80))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v51 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v19);
            objc_autoreleasePoolPop(v20);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v16);
      }

      objc_msgSend(*(id *)(a1 + 40), "healthStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stopQuery:", *(_QWORD *)(a1 + 48));

      v22 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

      v24 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v25, 0);

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
  else
  {
    v45 = v9;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = v10;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          v32 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v31);
          objc_autoreleasePoolPop(v32);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v28);
    }

    v9 = v45;
    while (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") < *(_QWORD *)(a1 + 72))
        break;
      v33 = (void *)MEMORY[0x1D8231EA8]();
      v34 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
      v35 = *(_QWORD *)(a1 + 72);
      if (v34 == v35 || v35 == 0)
      {
        v37 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v37 + 16))(v37, v38, 0);

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
      }
      else if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") > *(_QWORD *)(a1 + 72))
      {
        v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, *(_QWORD *)(a1 + 72));
        objc_msgSend(v39, "objectsAtIndexes:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObjectsInRange:", 0, *(_QWORD *)(a1 + 72));
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      objc_autoreleasePoolPop(v33);
    }
    if (!objc_msgSend(v26, "count") || a4)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
      {
        v42 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v42 + 16))(v42, v43, 0);

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
      }
      v44 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v44 + 16))(v44, v13, 0);
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)fetchRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTHealthKitManager fetchRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:]";
      v26 = 1024;
      v27 = 1940;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__RTHealthKitManager_fetchRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke;
  v18[3] = &unk_1E92A44D8;
  v18[4] = self;
  v19 = v12;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  dispatch_async(v15, v18);

}

uint64_t __90__RTHealthKitManager_fetchRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
}

- (void)_getRouteLocationsUsingWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(unint64_t)a5 shift:(BOOL)a6 handler:(id)a7
{
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
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
  void *v41;
  void *v42;
  uint64_t *v43;
  id v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  id v55;
  void *v56;
  const __CFString *v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  void *v61;
  uint64_t *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  objc_class *v67;
  id v68;
  id v69;
  id v70;
  const __CFString *v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  id v79;
  char *ptr;
  char v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t size;
  void *v87;
  unint64_t v88;
  void *v89;
  _QWORD v91[7];
  _QWORD v92[4];
  NSObject *v93;
  uint64_t *v94;
  uint64_t *v95;
  _QWORD v96[6];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE buf[12];
  __int16 v124;
  id v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  id v129;
  __int16 v130;
  const __CFString *v131;
  __int16 v132;
  unint64_t v133;
  __int16 v134;
  id v135;
  __int16 v136;
  uint64_t v137;
  uint64_t v138;
  const __CFString *v139;
  _QWORD v140[4];

  v76 = a6;
  v140[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v79 = a7;
  v10 = (uint64_t *)MEMORY[0x1E0D18598];
  v11 = (uint64_t *)MEMORY[0x1E0CB2D50];
  v89 = v9;
  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v138 = *MEMORY[0x1E0CB2D50];
    v139 = CFSTR("workout is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *v10, 7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v79 + 2))(v79, 0, 0, v14);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 7200;
  if (a5)
    v15 = a5;
  v88 = v15;
  size = 16 * v15;
  ptr = (char *)malloc_type_malloc(16 * v15, 0x1000040451B5BE8uLL);
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v113 = 0;
  v114 = &v113;
  v115 = 0x3032000000;
  v116 = __Block_byref_object_copy__146;
  v117 = __Block_byref_object_dispose__146;
  -[RTHealthKitManager _getStartDateForWorkout:](self, "_getStartDateForWorkout:", v89);
  v118 = (id)objc_claimAutoreleasedReturnValue();
  -[RTHealthKitManager _getEndDateForWorkout:](self, "_getEndDateForWorkout:", v89);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v107 = 0;
  v108 = &v107;
  v83 = 0;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__146;
  v111 = __Block_byref_object_dispose__146;
  v112 = 0;
  v84 = *v10;
  v85 = *v11;
  do
  {
    v16 = (void *)MEMORY[0x1D8231EA8]();
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__146;
    v105 = __Block_byref_object_dispose__146;
    v106 = 0;
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    v17 = malloc_type_malloc(size, 0x1000040451B5BE8uLL);
    v120[3] = (uint64_t)v17;
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    v19 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v114[5], v87);
    v20 = dispatch_semaphore_create(0);
    -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke;
    v96[3] = &unk_1E92A4500;
    v96[4] = &v119;
    v96[5] = &v97;
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_2;
    v92[3] = &unk_1E92A4528;
    v94 = &v113;
    v95 = &v101;
    v23 = v20;
    v93 = v23;
    objc_msgSend(v21, "fetchRouteCoordinatesForWorkoutUUID:dateInterval:limit:handler:completion:", v22, v19, v88, v96, v92);

    v24 = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v24, v26))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v25);
    v29 = v28;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v140[0] = v85;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v140, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v84, 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

    }
    else
    {
LABEL_11:
      v39 = 0;
    }

    v40 = v39;
    v41 = v40;
    v42 = v40;
    if (v40 || (v42 = (void *)v102[5]) != 0)
    {
      v43 = v108;
      v44 = v42;
      v45 = (void *)v43[5];
      v43[5] = (uint64_t)v44;

LABEL_15:
      v46 = 1;
      goto LABEL_16;
    }
    if (a4 - 1 <= 1)
    {
      v47 = v120[3];
      v48 = v98[3];
      -[RTHealthKitManager _getDurationForWorkout:](self, "_getDurationForWorkout:", v89);
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_3;
      v91[3] = &unk_1E92A36F8;
      v91[4] = &v119;
      v91[5] = &v97;
      v91[6] = &v107;
      v40 = (id)-[RTHealthKitManager _decimateLocations:locationsCount:totalDuration:decimationLevel:handler:](self, "_decimateLocations:locationsCount:totalDuration:decimationLevel:handler:", v47, v48, a4, v91);
      if (v108[5])
        goto LABEL_15;
    }
    if (v98[3])
    {
      v49 = 0;
      v50 = 0;
      do
      {
        v51 = (void *)MEMORY[0x1D8231EA8](v40);
        *(_OWORD *)&ptr[16 * (_QWORD)v83 + v49] = *(_OWORD *)(v120[3] + v49);
        objc_autoreleasePoolPop(v51);
        ++v50;
        v49 += 16;
      }
      while (v50 < v98[3]);
      v83 = (char *)v83 + v50;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "UUID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (const __CFString *)v98[3];
      objc_msgSend((id)v114[5], "stringFromDate");
      v58 = (id)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138414082;
      *(_QWORD *)&buf[4] = v54;
      v124 = 2112;
      v125 = v55;
      v126 = 2112;
      v127 = v56;
      v128 = 2048;
      v129 = v83;
      v130 = 2048;
      v131 = v57;
      v132 = 2048;
      v133 = v88;
      v134 = 2112;
      v135 = v58;
      v136 = 2048;
      v137 = v59;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, workout uuid, %@, total locations count, %lu, buffer locations count, %lu, limit, %lu, next startDate, %@, footprint, %.4f", buf, 0x52u);

    }
    v60 = v120;
    v61 = (void *)v120[3];
    if (v61)
    {
      free(v61);
      v60 = v120;
    }
    v60[3] = 0;
    if (v114[5])
    {
      v46 = 1;
      if (!v108[5] && (void *)v88 != v83 && (v82 & 1) == 0)
      {
        ptr = (char *)malloc_type_realloc(ptr, 16 * ((_QWORD)v83 + v88), 0x1000040451B5BE8uLL);
        v46 = 0;
        v82 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v46 = 1;
    }
    v82 = 1;
LABEL_16:

    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(&v101, 8);

    objc_autoreleasePoolPop(v16);
  }
  while (!v46);
  v62 = v120;
  v63 = (void *)v120[3];
  if (v108[5])
  {
    if (v63)
    {
      free(v63);
      v62 = v120;
    }
    v62[3] = 0;
    if (ptr)
      free(ptr);
    v64 = 0;
    v65 = 0;
  }
  else
  {
    if (v63)
    {
      free(v63);
      v62 = v120;
    }
    v62[3] = 0;
    if (v83)
    {
      v64 = malloc_type_realloc(ptr, 16 * (_QWORD)v83, 0x1000040451B5BE8uLL);
    }
    else
    {
      if (ptr)
        free(ptr);
      v64 = 0;
    }
    if (v76)
      -[RTHealthKitManager _shiftLocations:locationsCount:](self, "_shiftLocations:locationsCount:", v64, v83);
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v69 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stringFromHealthKitDecimationLevel:", a4);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if (v76)
        v71 = CFSTR("YES");
      else
        v71 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "timeIntervalSinceDate:", v77);
      v74 = v73;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413826;
      *(_QWORD *)&buf[4] = v68;
      v124 = 2112;
      v125 = v69;
      v126 = 2048;
      v127 = v83;
      v128 = 2112;
      v129 = v70;
      v130 = 2112;
      v131 = v71;
      v132 = 2048;
      v133 = v74;
      v134 = 2048;
      v135 = v75;
      _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "%@, %@, fetched locations count, %lu, decimation level, %@, shift, %@, latency, %.4f, footprint, %.4f", buf, 0x48u);

    }
    v65 = v83;
  }
  (*((void (**)(id, void *, void *, uint64_t))v79 + 2))(v79, v64, v65, v108[5]);
  _Block_object_dispose(&v107, 8);

  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v119, 8);

}

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5 + 1;
  *(CLLocationCoordinate2D *)(v3 + 16 * v5) = CLLocationCoordinate2DMake(a2, a3);
}

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __89__RTHealthKitManager__getRouteLocationsUsingWorkout_decimationLevel_limit_shift_handler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = *(_QWORD *)(a1[4] + 8);
  v9 = *(void **)(v8 + 24);
  if (v9)
  {
    free(v9);
    v8 = *(_QWORD *)(a1[4] + 8);
  }
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

- (void)_shiftLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  CLLocationDegrees *p_longitude;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *context;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[4];
  NSObject *v52;
  _BYTE *v53;
  _BYTE v54[12];
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  __int128 v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _shiftLocations:locationsCount:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2109;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D8231EA8]();
  v7 = (void *)objc_opt_new();
  if (a4)
  {
    p_longitude = &a3->longitude;
    do
    {
      v9 = (void *)MEMORY[0x1D8231EA8]();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", *(p_longitude - 1), *p_longitude);
      objc_msgSend(v7, "addObject:", v10);

      objc_autoreleasePoolPop(v9);
      p_longitude += 2;
      --a4;
    }
    while (a4);
  }
  if ((objc_msgSend(MEMORY[0x1E0CB6FC0], "isShiftRequiredForLocations:", v7) & 1) != 0)
  {
    v11 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__146;
    *(_QWORD *)&v63 = __Block_byref_object_dispose__146;
    *((_QWORD *)&v63 + 1) = 0;
    v12 = (void *)objc_opt_new();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke;
    v51[3] = &unk_1E92A4550;
    v53 = buf;
    v13 = v11;
    v52 = v13;
    objc_msgSend(v12, "shiftLocations:withCompletion:", v7, v51);

    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16))
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v54, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v64[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v54 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v64, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

    }
    else
    {
LABEL_16:
      v29 = 0;
    }

    v37 = v29;
    v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke_2;
    v50[3] = &__block_descriptor_40_e27_v32__0__CLLocation_8Q16_B24l;
    v50[4] = a3;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v50);
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v49);
      v45 = v44;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)v54 = 138413058;
      *(_QWORD *)&v54[4] = v41;
      v55 = 2112;
      v56 = v42;
      v57 = 2048;
      v58 = v45;
      v59 = 2048;
      v60 = v46;
      _os_log_debug_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEBUG, "%@, %@, shifting complete, latency, %.4f, footprint, %.4f", v54, 0x2Au);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v49);
      v35 = v34;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2048;
      v62 = v35;
      LOWORD(v63) = 2048;
      *(_QWORD *)((char *)&v63 + 2) = v36;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, shifting not required, latency, %.4f, footprint, %.4f", buf, 0x2Au);

    }
  }

  objc_autoreleasePoolPop(context);
}

void __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __53__RTHealthKitManager__shiftLocations_locationsCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 16 * a3);
  result = objc_msgSend(a2, "coordinate");
  *v3 = v5;
  v3[1] = v6;
  return result;
}

- (void)_decimateLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 totalDuration:(double)a5 decimationLevel:(unint64_t)a6 handler:(id)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  CLLocationDegrees *v23;
  void *v24;
  char *v25;
  void *v26;
  void *v27;
  CLLocationDegrees *p_longitude;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_class *v55;
  char *v56;
  id v57;
  void *v58;
  unint64_t v59;
  char *v61;
  char *v62;
  void *v63;
  void *v64;
  char *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  unint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v76 = "-[RTHealthKitManager _decimateLocations:locationsCount:totalDuration:decimationLevel:handler:]";
      v77 = 1024;
      LODWORD(v78) = 2165;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1D8231EA8]();
  v15 = (void *)v14;
  v59 = a6;
  if (a6 == 2)
  {
    v57 = v11;
    v26 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      p_longitude = &a3->longitude;
      v29 = a4;
      do
      {
        v30 = (void *)MEMORY[0x1D8231EA8]();
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", *(p_longitude - 1), *p_longitude);
        objc_msgSend(v26, "addObject:", v31);

        objc_autoreleasePoolPop(v30);
        p_longitude += 2;
        --v29;
      }
      while (v29);
    }
    v32 = (void *)MEMORY[0x1E0D183B8];
    -[RTHealthKitManager errorFunction](self, "errorFunction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "downsampleLocations:errorFunction:errorThreshold:outputSize:", v26, v33, 0, 10.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (char *)malloc_type_malloc(16 * objc_msgSend(v34, "count"), 0x1000040451B5BE8uLL);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v35 = v34;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    if (v36)
    {
      v37 = v36;
      v64 = v13;
      v67 = v15;
      v20 = 0;
      v38 = *(_QWORD *)v72;
      v62 = v25;
      v39 = v25 + 8;
      do
      {
        v40 = 0;
        v41 = &v39[16 * v20];
        do
        {
          if (*(_QWORD *)v72 != v38)
            objc_enumerationMutation(v35);
          v42 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v40);
          v43 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v42, "coordinate");
          *((_QWORD *)v41 - 1) = v44;
          *(_QWORD *)v41 = v45;
          objc_autoreleasePoolPop(v43);
          ++v40;
          v41 += 16;
        }
        while (v37 != v40);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
        v20 += v40;
      }
      while (v37);
      v13 = v64;
      v15 = v67;
      v25 = v62;
    }
    else
    {
      v20 = 0;
    }

    v17 = 1;
    v11 = v57;
  }
  else if (a6 == 1)
  {
    v63 = v13;
    v66 = (void *)v14;
    v16 = -[RTHealthKitManager _getDecimationSkipAheadFactorForDuration:](self, "_getDecimationSkipAheadFactorForDuration:", a5);
    v17 = v16;
    if (a4 % v16)
      v18 = a4 / v16 + 1;
    else
      v18 = a4 / v16;
    v19 = (char *)malloc_type_malloc(16 * v18, 0x1000040451B5BE8uLL);
    v61 = v19;
    v20 = 0;
    if (a4)
    {
      v21 = 0;
      v22 = v19 + 8;
      v23 = &a3->longitude;
      do
      {
        v24 = (void *)MEMORY[0x1D8231EA8]();
        ++v20;
        *(CLLocationCoordinate2D *)(v22 - 8) = CLLocationCoordinate2DMake(*(v23 - 1), *v23);
        objc_autoreleasePoolPop(v24);
        v21 += v17;
        v22 += 16;
        v23 += 2 * v17;
      }
      while (v21 < a4);
    }
    v13 = v63;
    v15 = v66;
    if (v18 == v20)
    {
      v20 = v18;
      v25 = v61;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v47 = objc_claimAutoreleasedReturnValue();
      v25 = v61;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v76 = v56;
        v77 = 2112;
        v78 = v58;
        v79 = 2048;
        v80 = v18;
        v81 = 2048;
        v82 = v20;
        _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, %@, outputLocationsCount, %lu, outputLocationsCount, %lu", buf, 0x2Au);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "invalid decimation level", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
    v20 = 0;
    v25 = 0;
    v17 = 1;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringFromHealthKitDecimationLevel:", v59);
    v68 = v15;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "timeIntervalSinceDate:", v13);
    v53 = v52;
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138414082;
    v76 = v65;
    v77 = 2112;
    v78 = v50;
    v79 = 2112;
    v80 = (unint64_t)v51;
    v81 = 2048;
    v82 = v17;
    v83 = 2048;
    v84 = a4;
    v85 = 2048;
    v86 = v20;
    v87 = 2048;
    v88 = v53;
    v89 = 2048;
    v90 = v54;
    _os_log_debug_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEBUG, "%@, %@, decimation, decimation level, %@, skip ahead factor, %lu, input locations count, %lu, actual outputLocations count, %lu, latency, %.4f, footprint, %.4f", buf, 0x52u);

    v15 = v68;
  }

  objc_autoreleasePoolPop(v15);
  (*((void (**)(id, char *, unint64_t, _QWORD))v11 + 2))(v11, v25, v20, 0);

}

- (unint64_t)_getDecimationSkipAheadFactorForDuration:(double)a3
{
  unint64_t v3;

  v3 = 6;
  if (a3 > 36000.0)
    v3 = 9;
  if (a3 <= 18000.0)
    return 3;
  else
    return v3;
}

- (id)getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a5)
      goto LABEL_15;
    v14 = CFSTR("workout");
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingIntervalComponents", buf, 2u);
    }

    if (!a5)
      goto LABEL_15;
    v14 = CFSTR("samplingIntervalComponents");
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__146;
  v32 = __Block_byref_object_dispose__146;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__146;
  v26 = __Block_byref_object_dispose__146;
  v27 = 0;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__RTHealthKitManager_getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke;
  block[3] = &unk_1E929E848;
  v20 = buf;
  block[4] = self;
  v18 = v8;
  v19 = v10;
  v21 = &v22;
  dispatch_sync(v11, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v12 = *((id *)v29 + 5);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v12;
}

void __86__RTHealthKitManager_getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getOdometerReadingUsingWorkout:samplingIntervalComponents:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_getOdometerReadingUsingWorkout:(id)a3 samplingIntervalComponents:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  dispatch_semaphore_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
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
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  uint8_t *v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  const __CFString *v64;
  _QWORD v65[2];
  uint64_t v66;
  uint8_t v67[16];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samplingIntervalComponents", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("samplingIntervalComponents"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  *(_QWORD *)buf = 0;
  v58 = buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__146;
  v61 = __Block_byref_object_dispose__146;
  v62 = (id)objc_opt_new();
  v52 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromWorkout:", v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v8, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForSamplesWithStartDate:endDate:options:", v12, v13, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  v65[0] = v51;
  v65[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "workoutActivityType") == 37)
  {
    v16 = (_QWORD *)MEMORY[0x1E0CB5C68];
  }
  else if (objc_msgSend(v8, "workoutActivityType") == 13)
  {
    v16 = (_QWORD *)MEMORY[0x1E0CB5C38];
  }
  else
  {
    if (objc_msgSend(v8, "workoutActivityType") != 71)
      goto LABEL_25;
    v16 = (_QWORD *)MEMORY[0x1E0CB5C70];
  }
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = dispatch_semaphore_create(0);
    v22 = objc_alloc(MEMORY[0x1E0CB6C80]);
    objc_msgSend(v8, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v22, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v20, v49, 16, v23, v10);

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __87__RTHealthKitManager__getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke;
    v53[3] = &unk_1E92A4578;
    v56 = buf;
    v45 = v52;
    v54 = v45;
    v24 = v21;
    v55 = v24;
    objc_msgSend(v48, "setInitialResultsHandler:", v53);
    -[RTHealthKitManager healthStore](self, "healthStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "executeQuery:", v48);

    v26 = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v26, v27))
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSinceDate:", v47);
    v29 = v28;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      *(_WORD *)v67 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v67, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v66 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v67 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

    }
    else
    {
LABEL_26:
      v39 = 0;
    }

    v42 = v39;
    if (v42)
      objc_msgSend(v45, "addObject:", v42);

    goto LABEL_30;
  }
LABEL_25:
  v40 = (void *)MEMORY[0x1E0CB35C8];
  v63 = *MEMORY[0x1E0CB2D50];
  v64 = CFSTR("Only workouts of type Running or Cycling is currently considered to get odometer readings.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v41);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "addObject:", v26);
  v20 = 0;
LABEL_30:

  if (a5)
  {
    _RTSafeArray();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v19 = *((id *)v58 + 5);

  _Block_object_dispose(buf, 8);
LABEL_33:

  return v19;
}

void __87__RTHealthKitManager__getOdometerReadingUsingWorkout_samplingIntervalComponents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "statistics");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  objc_class *v31;
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint8_t *v42;
  double v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint8_t v54[4];
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a9)
      goto LABEL_28;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastWorkoutUUID", buf, 2u);
    }

    if (!a9)
      goto LABEL_28;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("lastWorkoutUUID"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestWorkoutUUID", buf, 2u);
    }

    if (!a9)
      goto LABEL_28;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("bestWorkoutUUID"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v24 = 0;
    *a9 = v26;
    goto LABEL_29;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteSnapshot"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__146;
  v48 = __Block_byref_object_dispose__146;
  v49 = 0;
  -[RTNotifier queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __151__RTHealthKitManager_createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke;
  block[3] = &unk_1E92A45A0;
  v41 = &v50;
  block[4] = self;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v43 = a6;
  v39 = v20;
  v40 = v21;
  v42 = buf;
  dispatch_sync(v22, block);

  if (a9 && *((_QWORD *)v45 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *((_QWORD *)v45 + 5);
      *(_DWORD *)v54 = 138412802;
      v55 = v32;
      v56 = 2112;
      v57 = v33;
      v58 = 2112;
      v59 = v34;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v54, 0x20u);

    }
    *a9 = objc_retainAutorelease(*((id *)v45 + 5));
  }
  v24 = *((_BYTE *)v51 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v50, 8);
LABEL_29:

  return v24;
}

void __151__RTHealthKitManager_createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke(double *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v2 = (void *)*((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = *((_QWORD *)a1 + 6);
  v5 = *((_QWORD *)a1 + 7);
  v6 = *((_QWORD *)a1 + 8);
  v7 = a1[12];
  v8 = *((_QWORD *)a1 + 9);
  v9 = *(_QWORD *)(*((_QWORD *)a1 + 11) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v2, "_createWorkoutClusterWithWorkoutUUIDs:bestWorkoutUUID:lastWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:error:", v3, v4, v5, v6, v8, &obj, v7);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 10) + 8) + 24) = v10;
}

- (BOOL)_createWorkoutClusterWithWorkoutUUIDs:(id)a3 bestWorkoutUUID:(id)a4 lastWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8 error:(id *)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  id *v31;
  dispatch_time_t v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  NSObject *v53;
  NSObject *v54;
  objc_class *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const char *aSelector;
  void *v65;
  id obj;
  RTHealthKitManager *v67;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  void *v70;
  _QWORD v71[4];
  NSObject *v72;
  uint8_t *v73;
  uint64_t *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[8];
  uint8_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  _BYTE v89[12];
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  _QWORD v96[2];
  _BYTE v97[128];
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v22 = v21;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a9)
      goto LABEL_42;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastWorkoutUUID", buf, 2u);
    }

    if (!a9)
      goto LABEL_42;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("lastWorkoutUUID"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestWorkoutUUID", buf, 2u);
    }

    if (!a9)
      goto LABEL_42;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("bestWorkoutUUID"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (!a9)
      goto LABEL_42;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteSnapshot"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:
    v52 = 0;
    *a9 = v42;
    goto LABEL_52;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteLabel"));
      v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_42:
    v52 = 0;
    goto LABEL_52;
  }
  v67 = self;
  aSelector = a2;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  *(_QWORD *)buf = 0;
  v80 = buf;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__146;
  v83 = __Block_byref_object_dispose__146;
  v84 = 0;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v96[0] = v19;
  v96[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
  v70 = v22;
  if (v24)
  {
    v25 = *(_QWORD *)v76;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v76 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        if ((objc_msgSend(v17, "containsObject:", v27) & 1) == 0)
        {
          dsemaa = (dispatch_semaphore_t)MEMORY[0x1E0CB35C8];
          v94 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v27, "UUIDString");
          v22 = v70;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("UUID %@ not found in cluster list"), v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject errorWithDomain:code:userInfo:](dsemaa, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v49);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)*((_QWORD *)v80 + 5);
          *((_QWORD *)v80 + 5) = v50;

          v52 = 0;
          if (a9)
            *a9 = objc_retainAutorelease(*((id *)v80 + 5));
          goto LABEL_51;
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      v22 = v70;
      if (v24)
        continue;
      break;
    }
  }

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E08]), "initWithWorkoutUUIDs:lastWorkoutUUID:bestWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:", v17, v19, v18, v20, v22, a6);
  v28 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](v67, "workoutClusterStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __152__RTHealthKitManager__createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke;
  v71[3] = &unk_1E9298CF8;
  v73 = buf;
  v74 = &v85;
  v30 = v28;
  v72 = v30;
  objc_msgSend(v29, "createWorkoutCluster:completion:", v23, v71);

  v31 = (id *)(v80 + 40);
  obj = (id)*((_QWORD *)v80 + 5);
  dsema = v30;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v32))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "timeIntervalSinceDate:", v65);
    v34 = v33;
    v61 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "filteredArrayUsingPredicate:", v62);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "submitToCoreAnalytics:type:duration:", v60, 1, v34);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v89 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v89, 2u);
    }

    v38 = (void *)MEMORY[0x1E0CB35C8];
    v98[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v89 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v98, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v70;
    if (v40)
    {
      obj = objc_retainAutorelease(v40);

    }
  }
  else
  {
    v22 = v70;
  }

  objc_storeStrong(v31, obj);
  if (a9 && *((_QWORD *)v80 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *((_QWORD *)v80 + 5);
      *(_DWORD *)v89 = 138412802;
      *(_QWORD *)&v89[4] = v57;
      v90 = 2112;
      v91 = v58;
      v92 = 2112;
      v93 = v59;
      _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v89, 0x20u);

    }
    *a9 = objc_retainAutorelease(*((id *)v80 + 5));
  }
  v52 = *((_BYTE *)v86 + 24) != 0;

LABEL_51:
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v85, 8);
LABEL_52:

  return v52;
}

void __152__RTHealthKitManager__createWorkoutClusterWithWorkoutUUIDs_bestWorkoutUUID_lastWorkoutUUID_relevanceValue_workoutRouteSnapshot_workoutRouteLabel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  objc_class *v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint8_t *v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t v52[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = v21;
  if (v16)
  {
    v23 = v21;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    *(_QWORD *)buf = 0;
    v43 = buf;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__146;
    v46 = __Block_byref_object_dispose__146;
    v47 = 0;
    -[RTNotifier queue](self, "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __159__RTHealthKitManager_updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
    block[3] = &unk_1E92A45C8;
    v40 = &v48;
    block[4] = self;
    v34 = v16;
    v35 = v17;
    v36 = v18;
    v37 = v19;
    v38 = v20;
    v22 = v23;
    v39 = v23;
    v41 = buf;
    dispatch_sync(v24, block);

    if (a9 && *((_QWORD *)v43 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *((_QWORD *)v43 + 5);
        *(_DWORD *)v52 = 138412802;
        v53 = v30;
        v54 = 2112;
        v55 = v31;
        v56 = 2112;
        v57 = v32;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v52, 0x20u);

      }
      *a9 = objc_retainAutorelease(*((id *)v43 + 5));
    }
    v26 = *((_BYTE *)v49 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v48, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v26 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

void __159__RTHealthKitManager_updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a1[9];
  v8 = a1[10];
  v9 = *(_QWORD *)(a1[12] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v2, "_updateWorkoutClusterWithUUID:newBestWorkoutUUID:newLastWorkoutUUID:newRelevance:newWorkoutAssociations:workoutAssociationsToRemove:error:", v3, v4, v5, v6, v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = v10;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 newBestWorkoutUUID:(id)a4 newLastWorkoutUUID:(id)a5 newRelevance:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  id v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  NSObject *v38;
  objc_class *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  NSObject *v52;
  uint8_t *v53;
  uint64_t *v54;
  uint8_t v55[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _BYTE buf[12];
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v46 = a4;
  v47 = a5;
  v48 = a6;
  v49 = a7;
  v50 = a8;
  v45 = v15;
  if (v15)
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    *(_QWORD *)v55 = 0;
    v56 = v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__146;
    v59 = __Block_byref_object_dispose__146;
    v60 = 0;
    v16 = dispatch_semaphore_create(0);
    -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __160__RTHealthKitManager__updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
    v51[3] = &unk_1E9298CF8;
    v53 = v55;
    v54 = &v61;
    v18 = v16;
    v52 = v18;
    objc_msgSend(v17, "updateWorkoutClusterWithUUID:newRelevance:newLastWorkoutUUID:newBestWorkoutUUID:newWorkoutAssociations:workoutAssociationsToRemove:completion:", v15, v48, v47, v46, v49, v50, v51);

    v20 = (id *)(v56 + 40);
    v19 = (id)*((_QWORD *)v56 + 5);
    v21 = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v21, v23))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v22);
      v26 = v25;
      v27 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v33 = (void *)MEMORY[0x1E0CB35C8];
      v70[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v70, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v19 = objc_retainAutorelease(v35);

      }
    }

    objc_storeStrong(v20, v19);
    if (a9 && *((_QWORD *)v56 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = *((_QWORD *)v56 + 5);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v41;
        v66 = 2112;
        v67 = v42;
        v68 = 2112;
        v69 = v43;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a9 = objc_retainAutorelease(*((id *)v56 + 5));
    }
    v37 = *((_BYTE *)v62 + 24) != 0;

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", v55, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v37 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
  }

  return v37;
}

void __160__RTHealthKitManager__updateWorkoutClusterWithUUID_newBestWorkoutUUID_newLastWorkoutUUID_newRelevance_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  objc_class *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t v38[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v14 = 0;
      *a5 = v16;
      goto LABEL_19;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteSnapshot"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__146;
  v32 = __Block_byref_object_dispose__146;
  v33 = 0;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke;
  block[3] = &unk_1E929E848;
  v26 = &v34;
  block[4] = self;
  v24 = v9;
  v25 = v11;
  v27 = buf;
  dispatch_sync(v12, block);

  if (a5 && *((_QWORD *)v29 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((_QWORD *)v29 + 5);
      *(_DWORD *)v38 = 138412802;
      v39 = v20;
      v40 = 2112;
      v41 = v21;
      v42 = 2112;
      v43 = v22;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v38, 0x20u);

    }
    *a5 = objc_retainAutorelease(*((id *)v29 + 5));
  }
  v14 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v34, 8);
LABEL_19:

  return v14;
}

void __78__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_updateWorkoutClusterWithUUID:workoutRouteSnapshot:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteSnapshot:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  RTHealthKitManager *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  id *v17;
  NSObject *v18;
  dispatch_time_t v19;
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
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  objc_class *v37;
  id v38;
  void *v39;
  uint64_t v40;
  const char *aSelector;
  void *v42;
  void *v43;
  id obj;
  _QWORD v45[4];
  NSObject *v46;
  uint8_t *v47;
  uint64_t *v48;
  uint8_t buf[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE v59[12];
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v32 = 0;
      *a5 = v34;
      goto LABEL_24;
    }
LABEL_23:
    v32 = 0;
    goto LABEL_24;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteSnapshot", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteSnapshot"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  aSelector = a2;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  *(_QWORD *)buf = 0;
  v50 = buf;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__146;
  v53 = __Block_byref_object_dispose__146;
  v54 = 0;
  v12 = dispatch_semaphore_create(0);
  v13 = self;
  v14 = v12;
  -[RTHealthKitManager workoutClusterStore](v13, "workoutClusterStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __79__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke;
  v45[3] = &unk_1E9298CF8;
  v47 = buf;
  v48 = &v55;
  v16 = v14;
  v46 = v16;
  objc_msgSend(v15, "updateWorkoutRouteSnapshot:forClusterUUID:completion:", v11, v9, v45);

  v17 = (id *)(v50 + 40);
  obj = (id)*((_QWORD *)v50 + 5);
  v18 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSinceDate:", v43);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      *(_WORD *)v59 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v64[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v59 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v64, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      obj = objc_retainAutorelease(v30);

    }
  }

  objc_storeStrong(v17, obj);
  if (a5 && *((_QWORD *)v50 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *((_QWORD *)v50 + 5);
      *(_DWORD *)v59 = 138412802;
      *(_QWORD *)&v59[4] = v38;
      v60 = 2112;
      v61 = v39;
      v62 = 2112;
      v63 = v40;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v59, 0x20u);

    }
    *a5 = objc_retainAutorelease(*((id *)v50 + 5));
  }
  v32 = *((_BYTE *)v56 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v55, 8);
LABEL_24:

  return v32;
}

void __79__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteSnapshot_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  objc_class *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t v38[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v14 = 0;
      *a5 = v16;
      goto LABEL_19;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteLabel"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__146;
  v32 = __Block_byref_object_dispose__146;
  v33 = 0;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke;
  block[3] = &unk_1E929E848;
  v26 = &v34;
  block[4] = self;
  v24 = v9;
  v25 = v11;
  v27 = buf;
  dispatch_sync(v12, block);

  if (a5 && *((_QWORD *)v29 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((_QWORD *)v29 + 5);
      *(_DWORD *)v38 = 138412802;
      v39 = v20;
      v40 = 2112;
      v41 = v21;
      v42 = 2112;
      v43 = v22;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v38, 0x20u);

    }
    *a5 = objc_retainAutorelease(*((id *)v29 + 5));
  }
  v14 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v34, 8);
LABEL_19:

  return v14;
}

void __75__RTHealthKitManager_updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_updateWorkoutClusterWithUUID:workoutRouteLabel:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_updateWorkoutClusterWithUUID:(id)a3 workoutRouteLabel:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  RTHealthKitManager *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  id *v17;
  NSObject *v18;
  dispatch_time_t v19;
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
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  objc_class *v37;
  id v38;
  void *v39;
  uint64_t v40;
  const char *aSelector;
  void *v42;
  void *v43;
  id obj;
  _QWORD v45[4];
  NSObject *v46;
  uint8_t *v47;
  uint64_t *v48;
  uint8_t buf[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE v59[12];
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusterUUID"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v32 = 0;
      *a5 = v34;
      goto LABEL_24;
    }
LABEL_23:
    v32 = 0;
    goto LABEL_24;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutRouteLabel", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutRouteLabel"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  aSelector = a2;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  *(_QWORD *)buf = 0;
  v50 = buf;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__146;
  v53 = __Block_byref_object_dispose__146;
  v54 = 0;
  v12 = dispatch_semaphore_create(0);
  v13 = self;
  v14 = v12;
  -[RTHealthKitManager workoutClusterStore](v13, "workoutClusterStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __76__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke;
  v45[3] = &unk_1E9298CF8;
  v47 = buf;
  v48 = &v55;
  v16 = v14;
  v46 = v16;
  objc_msgSend(v15, "updateWorkoutRouteLabel:forClusterUUID:completion:", v11, v9, v45);

  v17 = (id *)(v50 + 40);
  obj = (id)*((_QWORD *)v50 + 5);
  v18 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSinceDate:", v43);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      *(_WORD *)v59 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v64[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v59 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v64, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      obj = objc_retainAutorelease(v30);

    }
  }

  objc_storeStrong(v17, obj);
  if (a5 && *((_QWORD *)v50 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *((_QWORD *)v50 + 5);
      *(_DWORD *)v59 = 138412802;
      *(_QWORD *)&v59[4] = v38;
      v60 = 2112;
      v61 = v39;
      v62 = 2112;
      v63 = v40;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v59, 0x20u);

    }
    *a5 = objc_retainAutorelease(*((id *)v50 + 5));
  }
  v32 = *((_BYTE *)v56 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v55, 8);
LABEL_24:

  return v32;
}

void __76__RTHealthKitManager__updateWorkoutClusterWithUUID_workoutRouteLabel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)fetchWorkoutClustersWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTHealthKitManager fetchWorkoutClustersWithHandler:]";
      v12 = 1024;
      v13 = 2618;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__RTHealthKitManager_fetchWorkoutClustersWithHandler___block_invoke;
  v8[3] = &unk_1E9297650;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __54__RTHealthKitManager_fetchWorkoutClustersWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutClustersWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchWorkoutClustersWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
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
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  intptr_t (*v31)(uint64_t);
  void *v32;
  NSObject *v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  int v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutClustersWithHandler:]";
      v36 = 1024;
      v37 = 2629;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v6 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __55__RTHealthKitManager__fetchWorkoutClustersWithHandler___block_invoke;
  v32 = &unk_1E9296F98;
  v8 = v4;
  v34 = v8;
  v9 = v6;
  v33 = v9;
  objc_msgSend(v7, "fetchWorkoutClustersWithCompletion:", &v29);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v29, v30, v31, v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *MEMORY[0x1E0D18598];
  v38[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v38, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

  }
  else
  {
LABEL_10:
    v26 = 0;
  }

  v27 = v26;
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, id))v8 + 2))(v8, v28, v27);

  }
}

intptr_t __55__RTHealthKitManager__fetchWorkoutClustersWithHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTHealthKitManager fetchWorkoutClusterContainingWorkoutUUID:handler:]";
    v19 = 1024;
    v20 = 2649;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTHealthKitManager fetchWorkoutClusterContainingWorkoutUUID:handler:]";
      v19 = 1024;
      v20 = 2650;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTHealthKitManager_fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __71__RTHealthKitManager_fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutClusterContainingWorkoutUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE buf[12];
  __int16 v43;
  int v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterContainingWorkoutUUID:handler:]";
      v43 = 1024;
      v44 = 2663;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6)
      goto LABEL_4;
LABEL_15:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("requires valid UUID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterContainingWorkoutUUID:handler:]";
    v43 = 1024;
    v44 = 2662;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
    goto LABEL_12;
LABEL_3:
  if (!v6)
    goto LABEL_15;
LABEL_4:
  v9 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __72__RTHealthKitManager__fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke;
  v37[3] = &unk_1E92A45F0;
  v11 = v8;
  v39 = v11;
  v12 = v9;
  v38 = v12;
  objc_msgSend(v10, "fetchWorkoutClusterContainingWorkoutUUID:completion:", v6, v37);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    objc_msgSend(v35, "timeIntervalSinceDate:", v14);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
    v25 = *MEMORY[0x1E0D18598];
    v45[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_retainAutorelease(v27);

    }
    else
    {
      v28 = 0;
    }
    v14 = v36;
  }
  else
  {
    v28 = 0;
  }

  v34 = v28;
  if (v34)
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v34);

  v33 = v39;
LABEL_22:

}

intptr_t __72__RTHealthKitManager__fetchWorkoutClusterContainingWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTHealthKitManager fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
    v19 = 1024;
    v20 = 2692;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTHealthKitManager fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
      v19 = 1024;
      v20 = 2693;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RTHealthKitManager_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __77__RTHealthKitManager_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE buf[12];
  __int16 v43;
  int v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_8:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
      v43 = 1024;
      v44 = 2706;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (!v6)
      goto LABEL_17;
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:]";
    v43 = 1024;
    v44 = 2705;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
    goto LABEL_8;
LABEL_3:
  if (!v6)
    goto LABEL_17;
LABEL_11:
  if (!objc_msgSend(v6, "count"))
  {
LABEL_17:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("requires valid UUID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v33);
    goto LABEL_24;
  }
  v11 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __78__RTHealthKitManager__fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke;
  v37[3] = &unk_1E9296F98;
  v13 = v8;
  v39 = v13;
  v14 = v11;
  v38 = v14;
  objc_msgSend(v12, "fetchWorkoutClustersContainingWorkoutUUIDs:completion:", v6, v37);

  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v15, v17))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v16;
    objc_msgSend(v35, "timeIntervalSinceDate:", v16);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v45[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 15, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_retainAutorelease(v29);

    }
    else
    {
      v30 = 0;
    }
    v16 = v36;
  }
  else
  {
    v30 = 0;
  }

  v34 = v30;
  if (v34)
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v34);

  v33 = v39;
LABEL_24:

}

intptr_t __78__RTHealthKitManager__fetchWorkoutClusterUUIDsContainingWorkoutUUIDs_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTHealthKitManager fetchWorkoutUUIDsForClusterUUID:handler:]";
    v19 = 1024;
    v20 = 2735;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTHealthKitManager fetchWorkoutUUIDsForClusterUUID:handler:]";
      v19 = 1024;
      v20 = 2736;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTHealthKitManager_fetchWorkoutUUIDsForClusterUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __62__RTHealthKitManager_fetchWorkoutUUIDsForClusterUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutUUIDsForClusterUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutUUIDsForClusterUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE buf[12];
  __int16 v43;
  int v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutUUIDsForClusterUUID:handler:]";
      v43 = 1024;
      v44 = 2749;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6)
      goto LABEL_4;
LABEL_15:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("requires valid UUID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutUUIDsForClusterUUID:handler:]";
    v43 = 1024;
    v44 = 2748;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
    goto LABEL_12;
LABEL_3:
  if (!v6)
    goto LABEL_15;
LABEL_4:
  v9 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __63__RTHealthKitManager__fetchWorkoutUUIDsForClusterUUID_handler___block_invoke;
  v37[3] = &unk_1E9296F98;
  v11 = v8;
  v39 = v11;
  v12 = v9;
  v38 = v12;
  objc_msgSend(v10, "fetchWorkoutUUIDsForClusterUUID:completion:", v6, v37);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    objc_msgSend(v35, "timeIntervalSinceDate:", v14);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
    v25 = *MEMORY[0x1E0D18598];
    v45[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_retainAutorelease(v27);

    }
    else
    {
      v28 = 0;
    }
    v14 = v36;
  }
  else
  {
    v28 = 0;
  }

  v34 = v28;
  if (v34)
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v34);

  v33 = v39;
LABEL_22:

}

intptr_t __63__RTHealthKitManager__fetchWorkoutUUIDsForClusterUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTHealthKitManager fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
    v19 = 1024;
    v20 = 2778;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTHealthKitManager fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
      v19 = 1024;
      v20 = 2779;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTHealthKitManager_fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __70__RTHealthKitManager_fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutRouteSnapshotForClusterUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE buf[12];
  __int16 v43;
  int v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
      v43 = 1024;
      v44 = 2792;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v6)
      goto LABEL_4;
LABEL_15:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("requires valid UUID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v33);
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[RTHealthKitManager _fetchWorkoutRouteSnapshotForClusterUUID:handler:]";
    v43 = 1024;
    v44 = 2791;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusterUUID (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
    goto LABEL_12;
LABEL_3:
  if (!v6)
    goto LABEL_15;
LABEL_4:
  v9 = dispatch_semaphore_create(0);
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __71__RTHealthKitManager__fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke;
  v37[3] = &unk_1E92A4618;
  v11 = v8;
  v39 = v11;
  v12 = v9;
  v38 = v12;
  objc_msgSend(v10, "fetchWorkoutRouteSnapshotForClusterUUID:completion:", v6, v37);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    objc_msgSend(v35, "timeIntervalSinceDate:", v14);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
    v25 = *MEMORY[0x1E0D18598];
    v45[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_retainAutorelease(v27);

    }
    else
    {
      v28 = 0;
    }
    v14 = v36;
  }
  else
  {
    v28 = 0;
  }

  v34 = v28;
  if (v34)
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v34);

  v33 = v39;
LABEL_22:

}

intptr_t __71__RTHealthKitManager__fetchWorkoutRouteSnapshotForClusterUUID_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)deleteWorkoutCluster:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__146;
    v19 = __Block_byref_object_dispose__146;
    v20 = 0;
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__RTHealthKitManager_deleteWorkoutCluster_error___block_invoke;
    v11[3] = &unk_1E92A4410;
    v13 = &v21;
    v11[4] = self;
    v12 = v6;
    v14 = buf;
    dispatch_sync(v7, v11);

    if (a4)
      *a4 = objc_retainAutorelease(*((id *)v16 + 5));
    v8 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterUUID", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutClusterUUID"));
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

void __49__RTHealthKitManager_deleteWorkoutCluster_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_deleteWorkoutCluster:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_deleteWorkoutCluster:(id)a3 error:(id *)a4
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
  void *v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  objc_class *v33;
  id v34;
  void *v35;
  const char *aSelector;
  _QWORD v37[4];
  NSObject *v38;
  uint8_t *v39;
  uint8_t v40[8];
  uint8_t *v41;
  uint64_t v42;
  char v43;
  _BYTE buf[12];
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    *(_QWORD *)v40 = 0;
    v41 = v40;
    v42 = 0x2020000000;
    v43 = 0;
    v8 = dispatch_semaphore_create(0);
    -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __50__RTHealthKitManager__deleteWorkoutCluster_error___block_invoke;
    v37[3] = &unk_1E929F3E8;
    v39 = v40;
    v10 = v8;
    v38 = v10;
    objc_msgSend(v9, "deleteWorkoutClusterWithUUID:completion:", v7, v37);

    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v49[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v49, 1);
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
    v28 = v27;
    if (a4 && v27)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v34;
        v45 = 2112;
        v46 = v35;
        v47 = 2112;
        v48 = v28;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a4 = objc_retainAutorelease(v28);
    }
    v30 = v41[24] != 0;

    _Block_object_dispose(v40, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v40 = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutClusterUUID", v40, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutClusterUUID"));
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

intptr_t __50__RTHealthKitManager__deleteWorkoutCluster_error___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTHealthKitManager generateRaceRouteClustersWithLimit:handler:]";
      v15 = 1024;
      v16 = 2863;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTHealthKitManager_generateRaceRouteClustersWithLimit_handler___block_invoke;
  block[3] = &unk_1E9298E88;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__RTHealthKitManager_generateRaceRouteClustersWithLimit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateRaceRouteClustersWithLimit:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_generateRaceRouteClustersWithLimit:(unint64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTHealthKitManager _generateRaceRouteClustersWithLimit:handler:]";
      v14 = 1024;
      v15 = 2875;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTHealthKitManager workoutClusterStore](self, "workoutClusterStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__RTHealthKitManager__generateRaceRouteClustersWithLimit_handler___block_invoke;
  v10[3] = &unk_1E929A448;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "generateRaceRouteClustersWithLimit:completion:", a3, v10);

}

uint64_t __66__RTHealthKitManager__generateRaceRouteClustersWithLimit_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  id v22;
  id v23;
  _BYTE *v24;
  uint64_t *v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  if (v14)
  {
    if (a4 < 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[RTHealthKitManager getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerRe"
                             "adings:odometerSamplingIntervalComponents:error:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2894;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__146;
    v37 = __Block_byref_object_dispose__146;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__146;
    v33 = __Block_byref_object_dispose__146;
    v34 = 0;
    -[RTNotifier queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __140__RTHealthKitManager_getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke;
    block[3] = &unk_1E92A43C0;
    v24 = buf;
    block[4] = self;
    v22 = v14;
    v26 = a4;
    v27 = a5;
    v28 = a6;
    v23 = v15;
    v25 = &v29;
    dispatch_sync(v17, block);

    if (a8)
      *a8 = objc_retainAutorelease((id)v30[5]);
    v18 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __140__RTHealthKitManager_getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 80);
  v6 = *(unsigned __int8 *)(a1 + 81);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v2, "_getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:error:", v3, v7, v5, v6, v4, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)_getHealthKitDataWithStartDate:(id)a3 limit:(int64_t)a4 includeLocations:(BOOL)a5 includeOdometerReadings:(BOOL)a6 odometerSamplingIntervalComponents:(id)a7 error:(id *)a8
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  RTHealthKitManager *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  dispatch_time_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  id v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v69;
  const __CFString *v70;
  const __CFString *v71;
  id obj;
  void *v73;
  NSObject *log;
  uint64_t v75;
  uint64_t v76;
  id v77;
  _BOOL4 v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t i;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  id v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v98;
  id v99;
  uint64_t v100;
  void *context;
  id contexta;
  uint64_t v103;
  id v104;
  _QWORD v105[5];
  NSObject *v106;
  id v107;
  uint64_t *v108;
  SEL v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  _BYTE buf[12];
  __int16 v128;
  id v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  id v135;
  __int16 v136;
  id v137;
  __int16 v138;
  id v139;
  __int16 v140;
  id v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  const __CFString *v149;
  __int16 v150;
  const __CFString *v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  _BYTE v156[128];
  _BYTE v157[128];
  _QWORD v158[4];

  v78 = a6;
  v93 = a5;
  v158[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v79 = a7;
  v69 = v10;
  if (v10)
  {
    if (a4 < 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[RTHealthKitManager _getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerR"
                             "eadings:odometerSamplingIntervalComponents:error:]";
        v128 = 1024;
        LODWORD(v129) = 2920;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "limit value cannot be less than 0 (in %s:%d)", buf, 0x12u);
      }

    }
    v77 = (id)objc_opt_new();
    v121 = 0;
    v122 = &v121;
    v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__146;
    v125 = __Block_byref_object_dispose__146;
    v126 = (id)objc_opt_new();
    -[RTHealthKitManager getWorkoutDefaultSortDescriptors](self, "getWorkoutDefaultSortDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTHealthKitManager _getRTWorkoutDefaultTypesForRaceRoute](self, "_getRTWorkoutDefaultTypesForRaceRoute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = 0;
    -[RTHealthKitManager _getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:](self, "_getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v69, a4, v12, 0, 1, 0, 1.79769313e308, v13, &v120);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v120;

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v14;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v157, 16);
    if (v76)
    {
      v15 = CFSTR("NO");
      if (v93)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v75 = *(_QWORD *)v117;
      if (v78)
        v15 = CFSTR("YES");
      v70 = v15;
      v71 = v16;
      v87 = *MEMORY[0x1E0D18598];
      v88 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v117 != v75)
            objc_enumerationMutation(obj);
          v86 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          v82 = (void *)MEMORY[0x1D8231EA8]();
          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v86, CFSTR("Workout"));
          v85 = v17;
          v18 = self;
          v19 = v83;
          if (v78)
          {
            v115 = v83;
            -[RTHealthKitManager _getOdometerReadingUsingWorkout:samplingIntervalComponents:error:](self, "_getOdometerReadingUsingWorkout:samplingIntervalComponents:error:", v86, v79, &v115);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v115;

            if (v20 && objc_msgSend(v20, "count"))
              objc_msgSend(v85, "setObject:forKeyedSubscript:", v20, CFSTR("Odometer"));

            v18 = self;
          }
          v114 = v19;
          -[RTHealthKitManager _getWorkoutRouteUsingWorkout:error:](v18, "_getWorkoutRouteUsingWorkout:error:", v86, &v114);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v114;

          v96 = (void *)objc_opt_new();
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          v90 = v21;
          v22 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v110, v156, 16);
          if (v22)
          {
            v100 = 0;
            v94 = *(_QWORD *)v111;
            do
            {
              v98 = v22;
              for (j = 0; j != v98; ++j)
              {
                if (*(_QWORD *)v111 != v94)
                  objc_enumerationMutation(v90);
                v103 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
                context = (void *)MEMORY[0x1D8231EA8]();
                v24 = (void *)objc_opt_new();
                v25 = (void *)objc_opt_new();
                if (v93)
                {
                  v26 = dispatch_semaphore_create(0);
                  v105[0] = MEMORY[0x1E0C809B0];
                  v105[1] = 3221225472;
                  v105[2] = __141__RTHealthKitManager__getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke;
                  v105[3] = &unk_1E92A4640;
                  v108 = &v121;
                  v105[4] = self;
                  v109 = a2;
                  v27 = v26;
                  v106 = v27;
                  v107 = v25;
                  -[RTHealthKitManager _fetchWorkoutRouteLocationsUsingWorkoutRoute:batchSize:fetchOnlyFirstFew:handler:](self, "_fetchWorkoutRouteLocationsUsingWorkoutRoute:batchSize:fetchOnlyFirstFew:handler:", v103, 0, 0, v105);
                  v28 = v27;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v28, v30))
                    goto LABEL_32;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "timeIntervalSinceDate:", v29);
                  v32 = v31;
                  v33 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "filteredArrayUsingPredicate:", v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "firstObject");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v33, "submitToCoreAnalytics:type:duration:", v37, 1, v32);
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                  }

                  v39 = (void *)MEMORY[0x1E0CB35C8];
                  v158[0] = v88;
                  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v158, 1);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "errorWithDomain:code:userInfo:", v87, 15, v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v41)
                  {
                    v42 = objc_retainAutorelease(v41);

                  }
                  else
                  {
LABEL_32:
                    v42 = 0;
                  }

                  v43 = v42;
                  v44 = v43;
                  if (v122[5] && v43)
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
                      v46 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v46);
                      v47 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v47;
                      v128 = 2112;
                      v129 = v48;
                      v130 = 2112;
                      v131 = v44;
                      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

                    }
                    objc_msgSend((id)v122[5], "addObject:", v44);

                    v44 = 0;
                  }

                }
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v103, CFSTR("WorkoutRoute"));
                if (objc_msgSend(v25, "count"))
                {
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("WorkoutRouteLocations"));
                  v100 += objc_msgSend(v25, "count");
                }
                objc_msgSend(v96, "addObject:", v24);

                objc_autoreleasePoolPop(context);
              }
              v22 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v110, v156, 16);
            }
            while (v22);
          }
          else
          {
            v100 = 0;
          }

          if (objc_msgSend(v96, "count"))
            objc_msgSend(v85, "setObject:forKeyedSubscript:", v96, CFSTR("WorkoutRoutes"));
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            log = v49;
            v50 = (objc_class *)objc_opt_class();
            NSStringFromClass(v50);
            v99 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v104 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "UUID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "device");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "name");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v86, "workoutActivityType"));
            contexta = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "startDate");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "stringFromDate");
            v51 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "endDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "stringFromDate");
            v53 = (id)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_opt_class();
            -[RTHealthKitManager _getDurationForWorkout:](self, "_getDurationForWorkout:", v86);
            objc_msgSend(v54, "stringFromTimeInterval:");
            v55 = (id)objc_claimAutoreleasedReturnValue();
            -[RTHealthKitManager _getTotalDistanceForWorkout:](self, "_getTotalDistanceForWorkout:", v86);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "doubleValueForUnit:", v57);
            v59 = v58;
            objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("Odometer"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "count");
            if (v61)
            {
              objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("Odometer"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v73;
            }
            else
            {
              v62 = 0;
            }
            if (v79)
              v63 = objc_msgSend(v79, "second");
            else
              v63 = 0;
            +[RTRuntime footprint](RTRuntime, "footprint");
            *(_DWORD *)buf = 138415874;
            *(_QWORD *)&buf[4] = v99;
            v128 = 2112;
            v129 = v104;
            v130 = 2112;
            v131 = v81;
            v132 = 2112;
            v133 = v80;
            v134 = 2112;
            v135 = contexta;
            v136 = 2112;
            v137 = v51;
            v138 = 2112;
            v139 = v53;
            v140 = 2112;
            v141 = v55;
            v142 = 2048;
            v143 = v59;
            v144 = 2048;
            v145 = v100;
            v146 = 2048;
            v147 = v62;
            v148 = 2112;
            v149 = v71;
            v150 = 2112;
            v151 = v70;
            v152 = 2048;
            v153 = v63;
            v154 = 2048;
            v155 = v64;
            v49 = log;
            _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, %@, workout UUID, %@, device, %@, workoutType, %@, startDate, %@, endDate, %@, duration, %@, totalDistance, %.3f meters, number of locations, %lu, number of odometer readings, %lu, include locations, %@, include Odometer Readings, %@, odometer sampling rate in seconds, %lu, footprint, %.2f MB", buf, 0x98u);
            if (v61)

          }
          objc_msgSend(v77, "addObject:", v85);

          objc_autoreleasePoolPop(v82);
        }
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v157, 16);
      }
      while (v76);
    }

    if (a8)
    {
      _RTSafeArray();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v121, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a8)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v77 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v77;
}

void __141__RTHealthKitManager__getHealthKitDataWithStartDate_limit_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (v7 = objc_msgSend(v5, "count"), !v6) && v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);
  }
  else
  {
    if (v6 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        v16 = 2112;
        v17 = v6;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", (uint8_t *)&v12, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);

      v6 = 0;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  }
}

- (BOOL)saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10
{
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t *v30;
  uint8_t *v31;
  uint64_t *v32;
  SEL v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;

  v17 = a3;
  v18 = a8;
  v19 = v18;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a10)
    {
      v23 = CFSTR("url");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      v21 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAbsoluteURL", buf, 2u);
    }

    if (a10)
    {
      v23 = CFSTR("outAbsoluteURL");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v26 = v18;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__146;
  v48 = __Block_byref_object_dispose__146;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__146;
  v42 = __Block_byref_object_dispose__146;
  v43 = 0;
  -[RTNotifier queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __187__RTHealthKitManager_saveEntireHealthKitDataToURL_outAbsoluteURL_includeWorkoutData_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_includeClustersData_error___block_invoke;
  block[3] = &unk_1E92A4668;
  v33 = a2;
  block[4] = self;
  v30 = &v50;
  v28 = v17;
  v31 = buf;
  v34 = a5;
  v35 = a6;
  v36 = a7;
  v37 = a9;
  v29 = v26;
  v32 = &v38;
  dispatch_sync(v20, block);

  *a4 = objc_retainAutorelease(*((id *)v45 + 5));
  if (a10)
    *a10 = objc_retainAutorelease((id)v39[5]);
  v21 = *((_BYTE *)v51 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v50, 8);
  v19 = v26;
LABEL_16:

  return v21;
}

void __187__RTHealthKitManager_saveEntireHealthKitDataToURL_outAbsoluteURL_includeWorkoutData_includeLocations_includeOdometerReadings_odometerSamplingIntervalComponents_includeClustersData_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id obj;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    v35 = 2048;
    v36 = v7;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "---------> %@, %@, start _saveEntireHealthKitDataToURL, footprint, %.2f MB <---------", buf, 0x20u);

  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  v12 = *(unsigned __int8 *)(a1 + 88);
  v13 = *(unsigned __int8 *)(a1 + 89);
  v14 = *(unsigned __int8 *)(a1 + 90);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(_BYTE *)(a1 + 91);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v29 = *(id *)(v17 + 40);
  obj = v11;
  LOBYTE(v28) = v16;
  v18 = objc_msgSend(v8, "_saveEntireHealthKitDataToURL:outAbsoluteURL:includeWorkoutData:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:includeClustersData:error:", v9, &obj, v12, v13, v14, v15, v28, &v29);
  objc_storeStrong((id *)(v10 + 40), obj);
  objc_storeStrong((id *)(v17 + 40), v29);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v24 = v23;
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v2);
    *(_DWORD *)buf = 138413314;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    v35 = 2048;
    v36 = v24;
    v37 = 2112;
    v38 = v25;
    v39 = 2048;
    v40 = v27;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "---------> %@, %@, finished _saveEntireHealthKitDataToURL, footprint, %.2f MB, error, %@, latency, %.2f <---------", buf, 0x34u);

  }
}

- (BOOL)_saveEntireHealthKitDataToURL:(id)a3 outAbsoluteURL:(id *)a4 includeWorkoutData:(BOOL)a5 includeLocations:(BOOL)a6 includeOdometerReadings:(BOOL)a7 odometerSamplingIntervalComponents:(id)a8 includeClustersData:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  RTHealthKitManager *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  uint64_t v53;
  void *v54;
  objc_class *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  const __CFString *v59;
  NSObject *v60;
  char v61;
  _BOOL4 v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  RTArchiver *v78;
  RTArchiver *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  NSObject *v91;
  objc_class *v93;
  void *v94;
  void *v95;
  objc_class *v96;
  void *v97;
  void *v98;
  objc_class *v99;
  void *v100;
  void *v101;
  objc_class *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  id *v112;
  const char *aSelector;
  _BOOL4 v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _BOOL4 v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint8_t buf[4];
  id v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  uint64_t v157;

  v127 = a7;
  v11 = a6;
  v12 = a5;
  v157 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = v16;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a10)
    {
      v59 = CFSTR("url");
LABEL_52:
      _RTErrorInvalidParameterCreate((uint64_t)v59);
      v61 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_88;
    }
LABEL_53:
    v61 = 0;
    goto LABEL_88;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAbsoluteURL", buf, 2u);
    }

    if (a10)
    {
      v59 = CFSTR("outAbsoluteURL");
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  v114 = v11;
  v112 = a4;
  v119 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:dateFormat:", v22, CFSTR("yyyy-MM-dd-HH-mm-ss-SSS"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("RaceRoute-%@"), v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v116 = (void *)v24;
  objc_msgSend(v15, "URLByAppendingPathComponent:", v24);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v19;
  LOBYTE(v23) = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v25, 0);

  v26 = 0;
  if ((v23 & 1) == 0)
  {
    v138 = 0;
    objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v122, 1, 0, &v138);
    v27 = v138;
    v26 = v27;
    if (v18)
    {
      if (v27)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v99 = (objc_class *)objc_opt_class();
          NSStringFromClass(v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v142 = v100;
          v143 = 2112;
          v144 = (uint64_t)v101;
          v145 = 2112;
          v146 = (uint64_t)v26;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v18, "addObject:", v26);

        v26 = 0;
      }
    }
  }
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("Workout"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("WorkoutRoute"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("WorkoutRouteLocations"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("Odometer"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalWorkoutRouteLocations"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalOdometer"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalClusters"));
  v120 = v29;
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalWorkoutsInClusters"));
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v117 = v15;
  aSelector = a2;
  if (!v12 || (v32 = v119, !v30))
  {
    v36 = v26;
    v123 = 0;
    v33 = self;
    goto LABEL_56;
  }
  v31 = 0;
  v123 = 0;
  v33 = self;
  while (1)
  {
    v34 = v31;
    v35 = (void *)MEMORY[0x1D8231EA8]();
    v137 = v26;
    -[RTHealthKitManager _getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:error:](v33, "_getHealthKitDataWithStartDate:limit:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:error:", v30, 1, 0, v127, v32, &v137);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v137;

    if (v18 && v36)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v142 = v50;
        v143 = 2112;
        v144 = (uint64_t)v51;
        v145 = 2112;
        v146 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        v32 = v119;
      }

      objc_msgSend(v18, "addObject:", v36);
      v26 = 0;
      goto LABEL_41;
    }
    if (!v31 || !objc_msgSend(v31, "count"))
      break;
    v136 = v30;
    v135 = v124;
    -[RTHealthKitManager _updateHealthKitStartDatesUsingData:currentStartDate:nextStartDate:](v33, "_updateHealthKitStartDatesUsingData:currentStartDate:nextStartDate:", v31, &v136, &v135);
    v38 = v136;

    v39 = v135;
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringFromDate:dateFormat:", v38, CFSTR("yyyy-MM-dd-HH-mm-ss-SSS"));
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Workouts-StartDate-%@"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "URLByAppendingPathComponent:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = objc_msgSend(v118, "fileExistsAtPath:isDirectory:", v44, 0);

    if ((v41 & 1) != 0)
      goto LABEL_20;
    v134 = v36;
    objc_msgSend(v118, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v43, 1, 0, &v134);
    v47 = v134;

    if (!v18)
    {
      v36 = v47;
LABEL_20:
      v33 = self;
      goto LABEL_21;
    }
    v33 = self;
    if (v47)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      goto LABEL_34;
    }
    v36 = 0;
LABEL_21:
    v45 = v36;
    v133 = v36;
    -[RTHealthKitManager _dumpHealthKitMetaData:dir:stats:error:](v33, "_dumpHealthKitMetaData:dir:stats:error:", v31, v43, v120, &v133);
    v36 = v133;

    if (v18 && v36)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v53 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v142 = v125;
        v143 = 2112;
        v144 = v53;
        v54 = (void *)v53;
        v145 = 2112;
        v146 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(v18, "addObject:", v36);
      v26 = 0;
      goto LABEL_35;
    }
    if (!v114)
      goto LABEL_39;
    v132 = v36;
    -[RTHealthKitManager _dumpWorkoutLocationsUsingData:dir:stats:error:](v33, "_dumpWorkoutLocationsUsingData:dir:stats:error:", v31, v43, v120, &v132);
    v47 = v132;

    if (!v18 || !v47)
    {
      v36 = v47;
LABEL_39:
      v26 = v36;
      v30 = v39;
      v36 = v38;
      v124 = v30;
      goto LABEL_40;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
LABEL_43:
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v56 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v142 = v126;
      v143 = 2112;
      v144 = v56;
      v57 = (void *)v56;
      v145 = 2112;
      v146 = (uint64_t)v47;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

    }
LABEL_34:

    objc_msgSend(v18, "addObject:", v47);
    v26 = 0;
    v36 = v47;
LABEL_35:
    v124 = v39;
    v30 = v38;
LABEL_40:
    v123 = v43;
    v32 = v119;
LABEL_41:

    objc_autoreleasePoolPop(v35);
    if (!v30)
    {
      v36 = v26;
      goto LABEL_56;
    }
  }
  objc_autoreleasePoolPop(v35);
LABEL_56:
  v62 = a9;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = (objc_class *)objc_opt_class();
    NSStringFromClass(v64);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("Workout"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v115, "integerValue");
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("WorkoutRoute"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v111, "integerValue");
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("WorkoutRouteLocations"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v110, "integerValue");
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("TotalWorkoutRouteLocations"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v109, "integerValue");
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("Odometer"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "integerValue");
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("TotalOdometer"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "integerValue");
    *(_DWORD *)buf = 138414082;
    v142 = v128;
    v143 = 2112;
    v144 = (uint64_t)v65;
    v145 = 2048;
    v146 = v108;
    v147 = 2048;
    v148 = v107;
    v149 = 2048;
    v150 = v106;
    v151 = 2048;
    v152 = v105;
    v153 = 2048;
    v154 = v67;
    v62 = a9;
    v155 = 2048;
    v156 = v69;
    _os_log_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_INFO, "%@, %@, For running or cycling, workouts count, %lu, workout routes count, %lu, workout route locations count, %lu, total workout route locations count, %lu, odometer readings count, %lu, total odometer readings count, %lu", buf, 0x52u);

  }
  if (v62)
  {
    objc_msgSend(v122, "URLByAppendingPathComponent:", CFSTR("1_Clusters"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v36;
    -[RTHealthKitManager _dumpWorkoutClusterAtDir:stats:error:](v33, "_dumpWorkoutClusterAtDir:stats:error:", v70, v120, &v131);
    v71 = v131;

    if (v18 && v71)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v102 = (objc_class *)objc_opt_class();
        NSStringFromClass(v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v142 = v103;
        v143 = 2112;
        v144 = (uint64_t)v104;
        v145 = 2112;
        v146 = (uint64_t)v71;
        _os_log_error_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(v18, "addObject:", v71);

      v36 = 0;
    }
    else
    {
      v36 = v71;
    }
  }
  objc_msgSend(v122, "URLByAppendingPathComponent:", CFSTR("2_Summary.json"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v36;
  -[RTHealthKitManager _writeToJSONAtURL:data:error:](v33, "_writeToJSONAtURL:data:error:", v73, v120, &v130);
  v74 = v130;

  if (v18 && v74)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v93 = (objc_class *)objc_opt_class();
      NSStringFromClass(v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v142 = v94;
      v143 = 2112;
      v144 = (uint64_t)v95;
      v145 = 2112;
      v146 = (uint64_t)v74;
      _os_log_error_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

    }
    objc_msgSend(v18, "addObject:", v74);

    v74 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.tar.gz"), v116);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "URLByAppendingPathComponent:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = -[RTArchiver initWithOutputURL:compress:]([RTArchiver alloc], "initWithOutputURL:compress:", v77, 1);
  v79 = v78;
  if (v78)
  {
    -[RTArchiver addDirectoryToArchive:](v78, "addDirectoryToArchive:", v122);
    -[RTArchiver closeArchive](v79, "closeArchive");
    v80 = objc_retainAutorelease(v77);
    *v112 = v80;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v80, "absoluteString");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v142 = v82;
      _os_log_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_INFO, "Archive created at, %@", buf, 0xCu);

    }
    v129 = v74;
    v83 = v118;
    objc_msgSend(v118, "removeItemAtURL:error:", v122, &v129);
    v84 = v129;

    if (v18 && v84)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v96 = (objc_class *)objc_opt_class();
        NSStringFromClass(v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v142 = v97;
        v143 = 2112;
        v144 = (uint64_t)v98;
        v145 = 2112;
        v146 = (uint64_t)v84;
        _os_log_error_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

        v83 = v118;
      }

      objc_msgSend(v18, "addObject:", v84);
      v84 = 0;
    }
    if (objc_msgSend(v18, "count"))
    {
      v61 = (char)a10;
      if (a10)
      {
        _RTSafeArray();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        *a10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_85;
      }
    }
    else
    {
      v61 = 1;
    }
  }
  else
  {
    v87 = (void *)MEMORY[0x1E0CB35C8];
    v88 = *MEMORY[0x1E0D18598];
    v139 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error while creating archive at destination url, %@"), v77);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v89;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "errorWithDomain:code:userInfo:", v88, 7, v90);
    v84 = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v142 = v84;
      _os_log_error_impl(&dword_1D1A22000, v91, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
    }

    v83 = v118;
    if (a10)
    {
      v84 = objc_retainAutorelease(v84);
      v61 = 0;
      *a10 = v84;
    }
    else
    {
LABEL_85:
      v61 = 0;
    }
  }

  v15 = v117;
  v17 = v119;
LABEL_88:

  return v61;
}

- (void)_updateHealthKitStartDatesUsingData:(id)a3 currentStartDate:(id *)a4 nextStartDate:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("Workout"), (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = *a5;
          objc_msgSend(v13, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "compare:", v16);

          if (v17 == -1)
          {
            objc_msgSend(v13, "startDate");
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = *a4;
          objc_msgSend(v13, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "compare:", v19);

          if (v20 == 1)
          {
            objc_msgSend(v13, "startDate");
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v21 = *a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v21, "isEqualToDate:", v22);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", *a5, 0.001);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (id)_convertHealthKitDataToJSONCompatibleType:(id)a3 stats:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
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
  uint64_t i;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t k;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  NSObject *v140;
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
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id obj;
  uint64_t v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  id v187;
  id v188;
  id v189;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *context;
  void *contexta;
  uint64_t v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint8_t buf[16];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  uint64_t v233;

  v233 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v166 = v6;
    v177 = (id)objc_opt_new();
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v167 = v5;
    obj = v5;
    v178 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
    if (v178)
    {
      v186 = 0;
      v182 = 0;
      v202 = 0;
      v198 = 0;
      v199 = 0;
      v179 = 0;
      v173 = *MEMORY[0x1E0CB7308];
      v172 = *MEMORY[0x1E0CB7310];
      v170 = *MEMORY[0x1E0CB72E8];
      v171 = *MEMORY[0x1E0CB7318];
      v168 = *MEMORY[0x1E0CB72F8];
      v169 = *MEMORY[0x1E0CB72F0];
      v8 = CFSTR("WorkoutRoute");
      v9 = CFSTR("WorkoutRouteLocations");
      v175 = *MEMORY[0x1E0CB7300];
      v176 = *(_QWORD *)v225;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v225 != v176)
          {
            v11 = v10;
            objc_enumerationMutation(obj);
            v10 = v11;
          }
          v181 = v10;
          v12 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * v10);
          v180 = (void *)MEMORY[0x1D8231EA8]();
          v13 = (void *)objc_opt_new();
          v183 = v12;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Workout"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = v13;
          v185 = v14;
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v14, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("UUID"));

            objc_msgSend(v15, "device");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("Device"));

            objc_msgSend(v15, "sourceRevision");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v15, "sourceRevision");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "source");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("SourceName"));

              objc_msgSend(v185, "sourceRevision");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "source");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "bundleIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("SourceBundleIdentifier"));

              objc_msgSend(v185, "sourceRevision");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "version");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("Version"));

              objc_msgSend(v185, "sourceRevision");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "productType");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("ProductType"));

              v31 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v185, "sourceRevision");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
              {
                objc_msgSend(v32, "operatingSystemVersion");
                v34 = v221;
              }
              else
              {
                v34 = 0;
                v222 = 0;
                v221 = 0;
                v223 = 0;
              }
              objc_msgSend(v185, "sourceRevision");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v35;
              if (v35)
              {
                objc_msgSend(v35, "operatingSystemVersion");
                v37 = v219;
              }
              else
              {
                v37 = 0;
                v219 = 0;
                v218 = 0;
                v220 = 0;
              }
              objc_msgSend(v185, "sourceRevision");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (v38)
              {
                objc_msgSend(v38, "operatingSystemVersion");
                v40 = v217;
              }
              else
              {
                v40 = 0;
                v215 = 0;
                v216 = 0;
                v217 = 0;
              }
              objc_msgSend(v31, "stringWithFormat:", CFSTR("%lu.%lu.%lu"), v34, v37, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("OperatingSystemVersion"));

              v15 = v185;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "workoutActivityType"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, CFSTR("WorkoutEnum"));

            objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v43, CFSTR("WorkoutType"));

            v44 = (void *)objc_opt_class();
            objc_msgSend(v15, "startDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringFromDate:dateFormat:", v45, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v46, CFSTR("StartDate"));

            v47 = (void *)objc_opt_class();
            objc_msgSend(v185, "endDate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringFromDate:dateFormat:", v48, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v49, CFSTR("EndDate"));

            v50 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v185, "duration");
            objc_msgSend(v50, "numberWithDouble:");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v51, CFSTR("TotalDuration"));

            v52 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v185, "totalDistance");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "doubleValueForUnit:", v54);
            objc_msgSend(v52, "numberWithDouble:");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v55, CFSTR("TotalDistance"));

            v56 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v185, "totalEnergyBurned");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6CD0], "largeCalorieUnit");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "doubleValueForUnit:", v58);
            objc_msgSend(v56, "numberWithDouble:");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v59, CFSTR("TotalEnergyBurned"));

            v60 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v185, "totalFlightsClimbed");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "doubleValueForUnit:", v62);
            objc_msgSend(v60, "numberWithDouble:");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v63, CFSTR("TotalFlightsClimbed"));

            v64 = v185;
            if (-[RTHealthKitManager _doesWorkoutHaveSubsetRoute:](self, "_doesWorkoutHaveSubsetRoute:", v185))
            {
              v65 = (void *)objc_opt_class();
              objc_msgSend(v185, "metadata");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "objectForKeyedSubscript:", v173);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "stringFromDate:dateFormat:", v67, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v68, v173);

              objc_msgSend(v185, "metadata");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKeyedSubscript:", v172);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v70, v172);

              objc_msgSend(v185, "metadata");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "objectForKeyedSubscript:", v171);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v72, v171);

              v73 = (void *)objc_opt_class();
              objc_msgSend(v185, "metadata");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "objectForKeyedSubscript:", v170);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "stringFromDate:dateFormat:", v75, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v76, v170);

              objc_msgSend(v185, "metadata");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "objectForKeyedSubscript:", v169);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v78, v169);

              objc_msgSend(v185, "metadata");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "objectForKeyedSubscript:", v168);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v185;
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v80, v168);

            }
            ++v179;
            objc_msgSend(v64, "metadata");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectForKeyedSubscript:", v175);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
            {
              objc_msgSend(v64, "metadata");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "objectForKeyedSubscript:", v175);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v84, v175);

            }
            v9 = CFSTR("WorkoutRouteLocations");
          }
          v85 = (void *)objc_opt_new();
          v211 = 0u;
          v212 = 0u;
          v213 = 0u;
          v214 = 0u;
          objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("WorkoutRoutes"));
          v187 = (id)objc_claimAutoreleasedReturnValue();
          v191 = v85;
          v192 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v211, v231, 16);
          if (v192)
          {
            v188 = *(id *)v212;
            do
            {
              for (i = 0; i != v192; ++i)
              {
                if (*(id *)v212 != v188)
                  objc_enumerationMutation(v187);
                v87 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * i);
                v88 = (void *)MEMORY[0x1D8231EA8]();
                v89 = (void *)objc_opt_new();
                objc_msgSend(v87, "objectForKeyedSubscript:", v8);
                v90 = (void *)objc_claimAutoreleasedReturnValue();

                context = v89;
                if (v90)
                {
                  ++v198;
                  v91 = v8;
                  objc_msgSend(v87, "objectForKeyedSubscript:", v8);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "UUID");
                  v93 = v9;
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "UUIDString");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "setObject:forKeyedSubscript:", v95, CFSTR("UUID"));

                  v9 = v93;
                }
                else
                {
                  v91 = v8;
                }
                objc_msgSend(v87, "objectForKeyedSubscript:", v9);
                v96 = (void *)objc_claimAutoreleasedReturnValue();

                if (v96)
                {
                  v194 = v88;
                  v196 = i;
                  objc_msgSend(v87, "objectForKeyedSubscript:", v9);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = (void *)objc_opt_new();
                  v99 = objc_msgSend(v97, "count");
                  v100 = v199;
                  if (v99)
                    v100 = v199 + 1;
                  v199 = v100;
                  v207 = 0u;
                  v208 = 0u;
                  v209 = 0u;
                  v210 = 0u;
                  v101 = v97;
                  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v207, v230, 16);
                  if (v102)
                  {
                    v103 = v102;
                    v104 = *(_QWORD *)v208;
                    do
                    {
                      for (j = 0; j != v103; ++j)
                      {
                        if (*(_QWORD *)v208 != v104)
                          objc_enumerationMutation(v101);
                        v106 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * j);
                        v107 = (void *)MEMORY[0x1D8231EA8]();
                        objc_msgSend(v106, "jsonObject");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        v109 = (void *)objc_msgSend(v108, "mutableCopy");

                        v110 = (void *)MEMORY[0x1E0CB37E8];
                        objc_msgSend(v106, "timestamp");
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v111, "timeIntervalSince1970");
                        objc_msgSend(v110, "numberWithDouble:");
                        v112 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v109, "setObject:forKeyedSubscript:", v112, CFSTR("timestamp"));

                        objc_msgSend(v98, "addObject:", v109);
                        objc_autoreleasePoolPop(v107);
                      }
                      v202 += v103;
                      v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v207, v230, 16);
                    }
                    while (v103);
                  }

                  v113 = context;
                  objc_msgSend(context, "setObject:forKeyedSubscript:", v98, CFSTR("Locations"));
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v98, "count"));
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(context, "setObject:forKeyedSubscript:", v114, CFSTR("LocationsCount"));

                  v8 = CFSTR("WorkoutRoute");
                  v9 = CFSTR("WorkoutRouteLocations");
                  v85 = v191;
                  v88 = v194;
                  i = v196;
                }
                else
                {
                  v113 = v89;
                  v8 = v91;
                  v85 = v191;
                }
                if (objc_msgSend(v113, "count"))
                  objc_msgSend(v85, "addObject:", v113);

                objc_autoreleasePoolPop(v88);
              }
              v192 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v211, v231, 16);
            }
            while (v192);
          }

          if (objc_msgSend(v85, "count"))
            objc_msgSend(v184, "setObject:forKeyedSubscript:", v85, CFSTR("WorkoutRoutes"));
          v115 = (void *)objc_opt_new();
          objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("Odometer"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          v117 = v182;
          if (v116)
            v117 = v182 + 1;
          v182 = v117;
          v205 = 0u;
          v206 = 0u;
          v203 = 0u;
          v204 = 0u;
          objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("Odometer"));
          v189 = (id)objc_claimAutoreleasedReturnValue();
          v197 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v203, v229, 16);
          if (v197)
          {
            v193 = *(_QWORD *)v204;
            v195 = v115;
            do
            {
              for (k = 0; k != v197; ++k)
              {
                if (*(_QWORD *)v204 != v193)
                  objc_enumerationMutation(v189);
                v119 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * k);
                contexta = (void *)MEMORY[0x1D8231EA8]();
                v120 = (void *)objc_opt_new();
                v121 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v119, "startDate");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "timeIntervalSince1970");
                objc_msgSend(v121, "numberWithDouble:");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "setObject:forKeyedSubscript:", v123, CFSTR("StartDate"));

                v124 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v119, "endDate");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "timeIntervalSince1970");
                objc_msgSend(v124, "numberWithDouble:");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "setObject:forKeyedSubscript:", v126, CFSTR("EndDate"));

                v127 = (void *)objc_opt_class();
                objc_msgSend(v119, "startDate");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "stringFromDate:dateFormat:", v128, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "setObject:forKeyedSubscript:", v129, CFSTR("StartDate"));

                v130 = (void *)objc_opt_class();
                objc_msgSend(v119, "endDate");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "stringFromDate:dateFormat:", v131, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "setObject:forKeyedSubscript:", v132, CFSTR("EndDate"));

                v133 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v119, "sumQuantity");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "doubleValueForUnit:", v135);
                objc_msgSend(v133, "numberWithDouble:");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "setObject:forKeyedSubscript:", v136, CFSTR("SumQuantity"));

                v115 = v195;
                objc_msgSend(v195, "addObject:", v120);

                objc_autoreleasePoolPop(contexta);
              }
              v186 += v197;
              v197 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v203, v229, 16);
            }
            while (v197);
          }

          if (objc_msgSend(v115, "count"))
          {
            objc_msgSend(v184, "setObject:forKeyedSubscript:", v115, CFSTR("Odometer"));
            v137 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("Odometer"));
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "numberWithUnsignedInteger:", objc_msgSend(v138, "count"));
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "setObject:forKeyedSubscript:", v139, CFSTR("OdometerCount"));

          }
          objc_msgSend(v177, "addObject:", v184);

          objc_autoreleasePoolPop(v180);
          v10 = v181 + 1;
          v8 = CFSTR("WorkoutRoute");
          v9 = CFSTR("WorkoutRouteLocations");
        }
        while (v181 + 1 != v178);
        v178 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
      }
      while (v178);
    }
    else
    {
      v186 = 0;
      v182 = 0;
      v202 = 0;
      v198 = 0;
      v199 = 0;
      v179 = 0;
    }

    v7 = v166;
    if (v166)
    {
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("Workout"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v167;
      if (v141)
      {
        v142 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("Workout"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "numberWithInteger:", objc_msgSend(v143, "integerValue") + v179);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v144, CFSTR("Workout"));

      }
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("WorkoutRoute"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (v145)
      {
        v146 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("WorkoutRoute"));
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "numberWithInteger:", objc_msgSend(v147, "integerValue") + v198);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v148, CFSTR("WorkoutRoute"));

      }
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("WorkoutRouteLocations"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (v149)
      {
        v150 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("WorkoutRouteLocations"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v151, "integerValue") + v199);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v152, CFSTR("WorkoutRouteLocations"));

      }
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("Odometer"));
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      if (v153)
      {
        v154 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("Odometer"));
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "numberWithInteger:", objc_msgSend(v155, "integerValue") + v182);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v156, CFSTR("Odometer"));

      }
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("TotalWorkoutRouteLocations"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      if (v157)
      {
        v158 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("TotalWorkoutRouteLocations"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "numberWithInteger:", objc_msgSend(v159, "integerValue") + v202);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v160, CFSTR("TotalWorkoutRouteLocations"));

      }
      objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("TotalOdometer"));
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      if (v161)
      {
        v162 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("TotalOdometer"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "numberWithInteger:", objc_msgSend(v163, "integerValue") + v186);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setObject:forKeyedSubscript:", v164, CFSTR("TotalOdometer"));

      }
    }
    else
    {
      v5 = v167;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v140 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v140, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v177 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v177;
}

- (BOOL)_dumpHealthKitMetaData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a6)
    {
      v29 = CFSTR("data");
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v29);
      v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_16:
    v26 = 0;
    goto LABEL_23;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", buf, 2u);
    }

    if (a6)
    {
      v29 = CFSTR("srcDir");
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v38 = v13;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v16, 0);

  v18 = 0;
  if ((v17 & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v42 = 0,
        objc_msgSend(v31, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v42),
        v18 = v42,
        v31,
        a6)
    && v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v44 = v35;
      v45 = 2112;
      v46 = v36;
      v47 = 2112;
      v48 = v18;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease(v18);
    v26 = 0;
    *a6 = v27;
  }
  else
  {
    v40 = 0;
    v41 = 0;
    -[RTHealthKitManager _updateHealthKitStartDatesUsingData:currentStartDate:nextStartDate:](self, "_updateHealthKitStartDatesUsingData:currentStartDate:nextStartDate:", v11, &v41, &v40);
    v19 = v41;
    v37 = v40;
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_msgSend(v11, "count");
    objc_msgSend((id)objc_opt_class(), "stringFromDate:dateFormat:", v19, CFSTR("yyyy-MM-dd-HH-mm-ss-SSS"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Metadata-count-%lu-StartDate-%@.json"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "URLByAppendingPathComponent:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTHealthKitManager _convertHealthKitDataToJSONCompatibleType:stats:](self, "_convertHealthKitDataToJSONCompatibleType:stats:", v11, v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v18;
    v26 = -[RTHealthKitManager _writeToJSONAtURL:data:error:](self, "_writeToJSONAtURL:data:error:", v24, v25, &v39);
    v27 = v39;

    if (a6)
      *a6 = objc_retainAutorelease(v27);

  }
  v14 = v38;

LABEL_23:
  return v26;
}

- (BOOL)_dumpWorkoutLocationsUsingData:(id)a3 dir:(id)a4 stats:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_semaphore_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  dispatch_time_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  objc_class *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  objc_class *v71;
  id v72;
  void *v73;
  NSObject *v74;
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
  objc_class *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *context;
  _QWORD v109[5];
  NSObject *v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  SEL v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id obj;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  _BYTE buf[12];
  __int16 v148;
  id v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  void *v153;
  __int16 v154;
  uint64_t v155;
  _BYTE v156[128];
  _BYTE v157[128];
  _QWORD v158[4];

  v158[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v90 = v8;
  v91 = a5;
  v101 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:
      v16 = 0;
      *a6 = v18;
      goto LABEL_70;
    }
LABEL_55:
    v16 = 0;
    goto LABEL_70;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("srcDir"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    goto LABEL_55;
  }
  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__146;
  v145 = __Block_byref_object_dispose__146;
  v146 = (id)objc_opt_new();
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__146;
  v139 = __Block_byref_object_dispose__146;
  v140 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, 0);

  if ((v12 & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = (id *)(v136 + 5),
        obj = (id)v136[5],
        objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v101, 1, 0, &obj),
        objc_storeStrong(v14, obj),
        v13,
        a6)
    && v136[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v86 = (objc_class *)objc_opt_class();
      NSStringFromClass(v86);
      v87 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = (void *)v136[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v87;
      v148 = 2112;
      v149 = v88;
      v150 = 2112;
      v151 = v89;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v16 = 0;
    *a6 = objc_retainAutorelease((id)v136[5]);
  }
  else
  {
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v93 = v90;
    v19 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v130, v157, 16);
    if (v19)
    {
      v106 = 0;
      v107 = 0;
      v94 = *(_QWORD *)v131;
      v98 = *MEMORY[0x1E0D18598];
      v99 = *MEMORY[0x1E0CB2D50];
      do
      {
        v97 = 0;
        v95 = v19;
        do
        {
          if (*(_QWORD *)v131 != v94)
            objc_enumerationMutation(v93);
          v20 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v97);
          v96 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Workout"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("WorkoutRoutes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (v23)
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Workout"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                v26 = (objc_class *)objc_opt_class();
                NSStringFromClass(v26);
                v27 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v28 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "UUID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "UUIDString");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v27;
                v148 = 2112;
                v149 = v28;
                v150 = 2112;
                v151 = v30;
                _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, No workoutRoutes found for Workout %@", buf, 0x20u);

              }
            }
          }
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("WorkoutRoutes"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
          if (v32)
          {
            v104 = *(_QWORD *)v127;
            v100 = v31;
            do
            {
              v105 = v32;
              for (i = 0; i != v105; ++i)
              {
                if (*(_QWORD *)v127 != v104)
                  objc_enumerationMutation(v100);
                v34 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
                context = (void *)MEMORY[0x1D8231EA8]();
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("WorkoutRoute"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("WorkoutRoute"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v122 = 0;
                  v123 = &v122;
                  v124 = 0x2020000000;
                  v125 = 0;
                  v116 = 0;
                  v117 = &v116;
                  v118 = 0x3032000000;
                  v119 = __Block_byref_object_copy__146;
                  v120 = __Block_byref_object_dispose__146;
                  v37 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v36, "UUID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "UUIDString");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringWithFormat:", CFSTR("Locations-WorkoutRouteID-%@.csv"), v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "URLByAppendingPathComponent:", v40);
                  v121 = (id)objc_claimAutoreleasedReturnValue();

                  v41 = dispatch_semaphore_create(0);
                  v109[0] = MEMORY[0x1E0C809B0];
                  v109[1] = 3221225472;
                  v109[2] = __69__RTHealthKitManager__dumpWorkoutLocationsUsingData_dir_stats_error___block_invoke;
                  v109[3] = &unk_1E92A4690;
                  v111 = &v141;
                  v109[4] = self;
                  v115 = a2;
                  v42 = v41;
                  v110 = v42;
                  v112 = &v116;
                  v113 = &v135;
                  v114 = &v122;
                  -[RTHealthKitManager _fetchWorkoutRouteLocationsUsingWorkoutRoute:batchSize:fetchOnlyFirstFew:handler:](self, "_fetchWorkoutRouteLocationsUsingWorkoutRoute:batchSize:fetchOnlyFirstFew:handler:", v36, 0, 0, v109);
                  v43 = v42;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v43, v45))
                    goto LABEL_34;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "timeIntervalSinceDate:", v44);
                  v48 = v47;
                  v49 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "filteredArrayUsingPredicate:", v50);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "firstObject");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v49, "submitToCoreAnalytics:type:duration:", v53, 1, v48);
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                  }

                  v55 = (void *)MEMORY[0x1E0CB35C8];
                  v158[0] = v99;
                  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v158, 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "errorWithDomain:code:userInfo:", v98, 15, v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v57)
                  {
                    v58 = objc_retainAutorelease(v57);

                  }
                  else
                  {
LABEL_34:
                    v58 = 0;
                  }

                  v59 = v58;
                  v60 = v59;
                  if (v142[5] && v59)
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    v61 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      v71 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v71);
                      v72 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v72;
                      v148 = 2112;
                      v149 = v73;
                      v150 = 2112;
                      v151 = v60;
                      _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

                    }
                    objc_msgSend((id)v142[5], "addObject:", v60);

                    v60 = 0;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v62 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    v63 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v63);
                    v64 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v65 = (id)objc_claimAutoreleasedReturnValue();
                    v66 = (void *)v123[3];
                    objc_msgSend((id)v117[5], "relativeString");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    +[RTRuntime footprint](RTRuntime, "footprint");
                    *(_DWORD *)buf = 138413314;
                    *(_QWORD *)&buf[4] = v64;
                    v148 = 2112;
                    v149 = v65;
                    v150 = 2048;
                    v151 = v66;
                    v152 = 2112;
                    v153 = v67;
                    v154 = 2048;
                    v155 = v68;
                    _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, %@, Saved CSV of %lu locations, %@ file, current footprint, %.2f MB", buf, 0x34u);

                  }
                  v69 = v123[3];
                  v70 = v107;
                  if (v69 > 0)
                    v70 = v107 + 1;
                  v107 = v70;

                  _Block_object_dispose(&v116, 8);
                  _Block_object_dispose(&v122, 8);

                  v106 += v69 & ~(v69 >> 63);
                }
                objc_autoreleasePoolPop(context);
              }
              v31 = v100;
              v32 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
            }
            while (v32);
          }

          objc_autoreleasePoolPop(v96);
          ++v97;
        }
        while (v97 != v95);
        v19 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v130, v157, 16);
      }
      while (v19);
    }
    else
    {
      v106 = 0;
      v107 = 0;
    }

    if (v91)
    {
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("WorkoutRouteLocations"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        v76 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("WorkoutRouteLocations"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "numberWithInteger:", objc_msgSend(v77, "integerValue") + v107);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setObject:forKeyedSubscript:", v78, CFSTR("WorkoutRouteLocations"));

      }
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("TotalWorkoutRouteLocations"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        v80 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("TotalWorkoutRouteLocations"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "numberWithInteger:", objc_msgSend(v81, "integerValue") + v106);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setObject:forKeyedSubscript:", v82, CFSTR("TotalWorkoutRouteLocations"));

      }
    }
    if (objc_msgSend((id)v142[5], "count"))
    {
      if (a6)
      {
        _RTSafeArray();
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
    }
    else
    {
      if (a6)
      {
        _RTSafeArray();
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 1;
    }
  }
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
LABEL_70:

  return v16;
}

void __69__RTHealthKitManager__dumpWorkoutLocationsUsingData_dir_stats_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (v7 = objc_msgSend(v5, "count"), !v6) && v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    objc_msgSend(v8, "_writeLocations:csvFileURL:error:", v5, v9, &obj);
    objc_storeStrong((id *)(v10 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        v25 = 2112;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = 0;

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v5, "count");
  }
  else
  {
    if (v6 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v6;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);

      v6 = 0;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  }
}

- (BOOL)_dumpWorkoutClusterAtDir:(id)a3 stats:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  id *v21;
  id v22;
  NSObject *v23;
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
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  dispatch_semaphore_t v53;
  void *v54;
  id *v55;
  void *v56;
  dispatch_time_t v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  int v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id *v83;
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
  void *v94;
  dispatch_semaphore_t v95;
  void *v96;
  id *v97;
  NSObject *v98;
  dispatch_time_t v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  NSObject *v126;
  NSObject *v127;
  objc_class *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  objc_class *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  id *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  objc_class *v154;
  id v155;
  void *v156;
  uint64_t (*v157)(uint64_t, uint64_t);
  objc_class *v158;
  id v159;
  void *v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  objc_class *v162;
  id v163;
  void *v164;
  uint64_t (*v165)(uint64_t, uint64_t);
  objc_class *v166;
  id v167;
  void *v168;
  uint64_t (*v169)(uint64_t, uint64_t);
  objc_class *v170;
  id v171;
  void *v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  id v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  void *v186;
  void *context;
  uint64_t v188;
  dispatch_semaphore_t dsema;
  id v192;
  _QWORD v193[4];
  dispatch_semaphore_t v194;
  uint8_t *v195;
  uint8_t *v196;
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[4];
  dispatch_semaphore_t v203;
  _BYTE *v204;
  uint8_t *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[4];
  dispatch_semaphore_t v211;
  _BYTE *v212;
  uint8_t *v213;
  id v214;
  id obj;
  uint8_t v216[8];
  uint8_t *v217;
  uint64_t v218;
  uint64_t (*v219)(uint64_t, uint64_t);
  void (*v220)(uint64_t);
  id v221;
  _QWORD v222[5];
  uint8_t buf[8];
  uint8_t *v224;
  uint64_t v225;
  uint64_t (*v226)(uint64_t, uint64_t);
  void (*v227)(uint64_t);
  id v228;
  void *v229;
  uint8_t v230[128];
  _BYTE v231[24];
  uint64_t (*v232)(uint64_t, uint64_t);
  void (*v233)(uint64_t);
  id v234;
  uint8_t v235[128];
  _BYTE v236[24];
  uint64_t (*v237)(uint64_t, uint64_t);
  void (*v238)(uint64_t);
  id v239;
  uint64_t v240;
  uint8_t v241[8];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v185 = a4;
  v186 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v216 = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: srcDir", v216, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("srcDir"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_104;
  }
  *(_QWORD *)v216 = 0;
  v217 = v216;
  v218 = 0x3032000000;
  v219 = __Block_byref_object_copy__146;
  v220 = __Block_byref_object_dispose__146;
  v221 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)(v217 + 40);
    obj = (id)*((_QWORD *)v217 + 5);
    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v186, 1, 0, &obj);
    objc_storeStrong(v11, obj);

    if (a5)
    {
      if (*((_QWORD *)v217 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v158 = (objc_class *)objc_opt_class();
          NSStringFromClass(v158);
          v159 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v217 + 5);
          *(_DWORD *)v236 = 138412802;
          *(_QWORD *)&v236[4] = v159;
          *(_WORD *)&v236[12] = 2112;
          *(_QWORD *)&v236[14] = v160;
          *(_WORD *)&v236[22] = 2112;
          v237 = v161;
          _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v236, 0x20u);

        }
        v13 = 0;
        *a5 = objc_retainAutorelease(*((id *)v217 + 5));
        goto LABEL_103;
      }
    }
  }
  objc_msgSend(v186, "URLByAppendingPathComponent:", CFSTR("Cluster_Snapshots"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, 0);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id *)(v217 + 40);
    v214 = (id)*((_QWORD *)v217 + 5);
    objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v182, 1, 0, &v214);
    objc_storeStrong(v18, v214);

    if (a5)
    {
      if (*((_QWORD *)v217 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v162 = (objc_class *)objc_opt_class();
          NSStringFromClass(v162);
          v163 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v217 + 5);
          *(_DWORD *)v236 = 138412802;
          *(_QWORD *)&v236[4] = v163;
          *(_WORD *)&v236[12] = 2112;
          *(_QWORD *)&v236[14] = v164;
          *(_WORD *)&v236[22] = 2112;
          v237 = v165;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v236, 0x20u);

        }
        v13 = 0;
        *a5 = objc_retainAutorelease(*((id *)v217 + 5));
        goto LABEL_102;
      }
    }
  }
  *(_QWORD *)v236 = 0;
  *(_QWORD *)&v236[8] = v236;
  *(_QWORD *)&v236[16] = 0x3032000000;
  v237 = __Block_byref_object_copy__146;
  v238 = __Block_byref_object_dispose__146;
  v239 = 0;
  v20 = dispatch_semaphore_create(0);
  v210[0] = MEMORY[0x1E0C809B0];
  v210[1] = 3221225472;
  v210[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke;
  v210[3] = &unk_1E9296EE0;
  v212 = v236;
  v213 = v216;
  dsema = v20;
  v211 = dsema;
  -[RTHealthKitManager _fetchWorkoutClustersWithHandler:](self, "_fetchWorkoutClustersWithHandler:", v210);
  v21 = (id *)(v217 + 40);
  v22 = (id)*((_QWORD *)v217 + 5);
  if (a5 && v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v154 = (objc_class *)objc_opt_class();
      NSStringFromClass(v154);
      v155 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(_QWORD *)&v231[4] = v155;
      *(_WORD *)&v231[12] = 2112;
      *(_QWORD *)&v231[14] = v156;
      *(_WORD *)&v231[22] = 2112;
      v232 = v157;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);

    }
LABEL_32:

    v39 = objc_retainAutorelease(*((id *)v217 + 5));
    v13 = 0;
LABEL_100:
    *a5 = v39;
    goto LABEL_101;
  }
  dsema = dsema;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v26))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v25);
    v29 = v28;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      *(_WORD *)v231 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v231, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v231 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v231, buf, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v22 = objc_retainAutorelease(v38);

    }
  }

  objc_storeStrong(v21, v22);
  if (a5 && *((_QWORD *)v217 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v166 = (objc_class *)objc_opt_class();
      NSStringFromClass(v166);
      v167 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(_QWORD *)&v231[4] = v167;
      *(_WORD *)&v231[12] = 2112;
      *(_QWORD *)&v231[14] = v168;
      *(_WORD *)&v231[22] = 2112;
      v232 = v169;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);

    }
    goto LABEL_32;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)&v236[8] + 40), "count"))
  {
    v176 = 0;
    v13 = 1;
    goto LABEL_93;
  }
  v177 = (void *)objc_opt_new();
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v181 = *(id *)(*(_QWORD *)&v236[8] + 40);
  v40 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v206, v235, 16);
  if (!v40)
  {
    v176 = 0;
    goto LABEL_83;
  }
  v176 = 0;
  v184 = *(_QWORD *)v207;
  v178 = *MEMORY[0x1E0D18598];
  v179 = *MEMORY[0x1E0CB2D50];
  do
  {
    v41 = 0;
    v183 = v40;
    do
    {
      if (*(_QWORD *)v207 != v184)
        objc_enumerationMutation(v181);
      v188 = v41;
      v42 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * v41);
      context = (void *)MEMORY[0x1D8231EA8]();
      v43 = (void *)objc_opt_new();
      objc_msgSend(v42, "clusterUUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "UUIDString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("ClusterUUID"));

      objc_msgSend(v42, "bestWorkoutUUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "UUIDString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, CFSTR("BestWorkoutUUID"));

      objc_msgSend(v42, "lastWorkoutUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "UUIDString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("LastWorkoutUUID"));

      objc_msgSend(v42, "workoutRouteLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v50, CFSTR("Label"));

      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v42, "relevanceValue");
      objc_msgSend(v51, "numberWithDouble:");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v52, CFSTR("RelevanceScore"));

      *(_QWORD *)v231 = 0;
      *(_QWORD *)&v231[8] = v231;
      *(_QWORD *)&v231[16] = 0x3032000000;
      v232 = __Block_byref_object_copy__146;
      v233 = __Block_byref_object_dispose__146;
      v234 = 0;
      v53 = dispatch_semaphore_create(0);

      objc_msgSend(v42, "clusterUUID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v202[0] = MEMORY[0x1E0C809B0];
      v202[1] = 3221225472;
      v202[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_555;
      v202[3] = &unk_1E9296EE0;
      v204 = v231;
      v205 = v216;
      dsema = v53;
      v203 = dsema;
      -[RTHealthKitManager _fetchWorkoutUUIDsForClusterUUID:handler:](self, "_fetchWorkoutUUIDsForClusterUUID:handler:", v54, v202);

      v55 = (id *)(v217 + 40);
      if (*((_QWORD *)v217 + 5))
        goto LABEL_47;
      dsema = dsema;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v57))
        goto LABEL_45;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeIntervalSinceDate:", v56);
      v60 = v59;
      v61 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "filteredArrayUsingPredicate:", v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "submitToCoreAnalytics:type:duration:", v65, 1, v60);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v67 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v241 = v179;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v241, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "errorWithDomain:code:userInfo:", v178, 15, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        v70 = objc_retainAutorelease(v69);

      }
      else
      {
LABEL_45:
        v70 = 0;
      }

      objc_storeStrong(v55, v70);
      if (*((_QWORD *)v217 + 5))
      {
LABEL_47:
        v71 = 6;
        goto LABEL_48;
      }
      v72 = (void *)objc_opt_new();
      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      v73 = *(id *)(*(_QWORD *)&v231[8] + 40);
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v198, v230, 16);
      if (v74)
      {
        v75 = *(_QWORD *)v199;
        do
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v199 != v75)
              objc_enumerationMutation(v73);
            v77 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * i);
            v78 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v77, "UUIDString");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "addObject:", v79);

            objc_autoreleasePoolPop(v78);
          }
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v198, v230, 16);
        }
        while (v74);
      }

      objc_msgSend(v43, "setObject:forKeyedSubscript:", v72, CFSTR("WorkoutUUIDs"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v72, "count"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v80, CFSTR("WorkoutUUIDsCount"));

      objc_msgSend(v43, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalDistance"));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", &unk_1E9329438, CFSTR("TotalDuration"));
      if (!objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count"))
        goto LABEL_64;
      objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = v81;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v229, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (id *)(v217 + 40);
      v197 = (id)*((_QWORD *)v217 + 5);
      -[RTHealthKitManager _getWorkoutsWithUUIDs:error:](self, "_getWorkoutsWithUUIDs:error:", v82, &v197);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v83, v197);

      if (!*((_QWORD *)v217 + 5))
      {
        if (objc_msgSend(v84, "count"))
        {
          v85 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v84, "firstObject");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "totalDistance");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "doubleValueForUnit:", v88);
          objc_msgSend(v85, "numberWithDouble:");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v89, CFSTR("TotalDistance"));

          v90 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v84, "firstObject");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "duration");
          objc_msgSend(v90, "numberWithDouble:");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v92, CFSTR("TotalDuration"));

          objc_msgSend(v84, "firstObject");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v93, "workoutActivityType"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v94, CFSTR("WorkoutType"));

        }
LABEL_64:
        *(_QWORD *)buf = 0;
        v224 = buf;
        v225 = 0x3032000000;
        v226 = __Block_byref_object_copy__146;
        v227 = __Block_byref_object_dispose__146;
        v228 = 0;
        v95 = dispatch_semaphore_create(0);

        objc_msgSend(v42, "clusterUUID");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v193[0] = MEMORY[0x1E0C809B0];
        v193[1] = 3221225472;
        v193[2] = __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_2;
        v193[3] = &unk_1E92A46B8;
        v195 = buf;
        v196 = v216;
        dsema = v95;
        v194 = dsema;
        -[RTHealthKitManager _fetchWorkoutRouteSnapshotForClusterUUID:handler:](self, "_fetchWorkoutRouteSnapshotForClusterUUID:handler:", v96, v193);

        v97 = (id *)(v217 + 40);
        if (*((_QWORD *)v217 + 5))
          goto LABEL_72;
        v98 = dsema;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v98, v99))
          goto LABEL_70;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "timeIntervalSinceDate:", v175);
        v101 = v100;
        v102 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "filteredArrayUsingPredicate:", v103);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "firstObject");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v102, "submitToCoreAnalytics:type:duration:", v106, 1, v101);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v241 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v107, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v241, 2u);
        }

        v108 = (void *)MEMORY[0x1E0CB35C8];
        v240 = v179;
        *(_QWORD *)v241 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v241, &v240, 1);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "errorWithDomain:code:userInfo:", v178, 15, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        if (v110)
        {
          v111 = objc_retainAutorelease(v110);

        }
        else
        {
LABEL_70:
          v111 = 0;
        }

        objc_storeStrong(v97, v111);
        if (*((_QWORD *)v217 + 5))
        {
LABEL_72:
          v71 = 6;
        }
        else
        {
          if (*((_QWORD *)v224 + 5))
          {
            v112 = (void *)MEMORY[0x1E0CB3940];
            v113 = objc_msgSend(v72, "count");
            objc_msgSend(v42, "relevanceValue");
            v115 = v114;
            objc_msgSend(v42, "workoutRouteLabel");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("TotalDistance"));
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "doubleValue");
            v119 = v118;
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("TotalDuration"));
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v120, "integerValue");
            objc_msgSend(v42, "clusterUUID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "stringWithFormat:", CFSTR("Count-%lu-score-[%.3f]-label-%@-dist-%.3f-dur-%lu-%@.png"), v113, v115, v116, v119, v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v182, "URLByAppendingPathComponent:", v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v224 + 5), "writeToURL:atomically:", v124, 1);

          }
          v125 = objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count");
          objc_msgSend(v177, "addObject:", v43);
          v71 = 0;
          v176 += v125;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_74;
      }

      v71 = 6;
LABEL_74:

LABEL_48:
      _Block_object_dispose(v231, 8);

      objc_autoreleasePoolPop(context);
      if (v71)
        goto LABEL_83;
      v41 = v188 + 1;
    }
    while (v188 + 1 != v183);
    v40 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v206, v235, 16);
  }
  while (v40);
LABEL_83:

  if (a5 && *((_QWORD *)v217 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
    {
      v170 = (objc_class *)objc_opt_class();
      NSStringFromClass(v170);
      v171 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v217 + 5);
      *(_DWORD *)v231 = 138412802;
      *(_QWORD *)&v231[4] = v171;
      *(_WORD *)&v231[12] = 2112;
      *(_QWORD *)&v231[14] = v172;
      *(_WORD *)&v231[22] = 2112;
      v232 = v173;
      _os_log_error_impl(&dword_1D1A22000, v126, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v231, 0x20u);

    }
    *a5 = objc_retainAutorelease(*((id *)v217 + 5));

    v13 = 0;
    goto LABEL_101;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v127 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
  {
    v128 = (objc_class *)objc_opt_class();
    NSStringFromClass(v128);
    v129 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v231 = 138412546;
    *(_QWORD *)&v231[4] = v129;
    *(_WORD *)&v231[12] = 2112;
    *(_QWORD *)&v231[14] = v130;
    _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_INFO, "%@, %@, sorting the clusters", v231, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("RelevanceScore"), 1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v222[0] = v131;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("TotalDistance"), 1);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = v132;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("TotalDuration"), 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v222[2] = v133;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("Label"), 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v222[3] = v134;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("BestWorkoutUUID"), 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v222[4] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v222, 5);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "sortUsingDescriptors:", v136);

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v137 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
  {
    v138 = (objc_class *)objc_opt_class();
    NSStringFromClass(v138);
    v139 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v231 = 138412546;
    *(_QWORD *)&v231[4] = v139;
    *(_WORD *)&v231[12] = 2112;
    *(_QWORD *)&v231[14] = v140;
    _os_log_impl(&dword_1D1A22000, v137, OS_LOG_TYPE_INFO, "%@, %@, ready to save data", v231, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WorkoutClusters-Count-%lu.json"), objc_msgSend(*(id *)(*(_QWORD *)&v236[8] + 40), "count"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "URLByAppendingPathComponent:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (id *)(v217 + 40);
  v192 = (id)*((_QWORD *)v217 + 5);
  v13 = -[RTHealthKitManager _writeToJSONAtURL:data:error:](self, "_writeToJSONAtURL:data:error:", v142, v177, &v192);
  objc_storeStrong(v143, v192);

LABEL_93:
  if (v185)
  {
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("TotalClusters"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    if (v144)
    {
      v145 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("TotalClusters"));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v146, "integerValue");
      objc_msgSend(v145, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)&v236[8] + 40), "count") + v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKeyedSubscript:", v148, CFSTR("TotalClusters"));

    }
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("TotalWorkoutsInClusters"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (v149)
    {
      v150 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("TotalWorkoutsInClusters"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v151, "integerValue") + v176);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKeyedSubscript:", v152, CFSTR("TotalWorkoutsInClusters"));

    }
  }
  if (a5)
  {
    v39 = objc_retainAutorelease(*((id *)v217 + 5));
    goto LABEL_100;
  }
LABEL_101:

  _Block_object_dispose(v236, 8);
LABEL_102:

LABEL_103:
  _Block_object_dispose(v216, 8);

LABEL_104:
  return v13;
}

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_555(uint64_t a1, void *a2, void *a3)
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

void __59__RTHealthKitManager__dumpWorkoutClusterAtDir_stats_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_writeLocations:(id)a3 csvFileURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id *v47;
  void *v48;
  id v49;
  id obj;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *context;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

      if ((v13 & 1) != 0)
      {
        v46 = v11;
        v47 = a5;
        v48 = v10;
        v45 = 0;
      }
      else
      {
        v72 = 0;
        v17 = -[RTHealthKitManager _writeToFileAtURL:contentString:error:](self, "_writeToFileAtURL:contentString:error:", v10, CFSTR("latitude, longitude, altitude, horizontalAccuracy, verticalAccuracy, course, speed, signalEnvironmentType, timestamp, \n"), &v72);
        v18 = v72;
        v19 = v18;
        if (a5 && v18)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v75 = v43;
            v76 = 2112;
            v77 = v44;
            v78 = 2112;
            v79 = v19;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v21 = objc_retainAutorelease(v19);
          *a5 = v21;
          goto LABEL_31;
        }
        v45 = v18;
        v46 = v11;
        v47 = a5;
        v48 = v10;
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v49 = v8;
      obj = v8;
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v54)
      {
        v51 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v69 != v51)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            context = (void *)MEMORY[0x1D8231EA8]();
            v61 = (void *)MEMORY[0x1E0CB3940];
            v24 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "coordinate");
            objc_msgSend(v24, "numberWithDouble:");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "stringValue");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "coordinate");
            objc_msgSend(v25, "numberWithDouble:", v26);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringValue");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "altitude");
            objc_msgSend(v27, "numberWithDouble:");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "stringValue");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "horizontalAccuracy");
            objc_msgSend(v28, "numberWithDouble:");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringValue");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "verticalAccuracy");
            objc_msgSend(v29, "numberWithDouble:");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "stringValue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "course");
            objc_msgSend(v31, "numberWithDouble:");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "speed");
            objc_msgSend(v33, "numberWithDouble:");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v23, "signalEnvironmentType");
            v37 = (void *)objc_opt_class();
            objc_msgSend(v23, "timestamp");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringFromDate:dateFormat:", v38, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringWithFormat:", CFSTR("%@, %@, %@, %@, %@, %@, %@, %lu, %@ \n"), v59, v66, v57, v55, v30, v32, v35, v36, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "appendString:", v40);

            objc_autoreleasePoolPop(context);
          }
          v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        }
        while (v54);
      }

      v67 = v45;
      v10 = v48;
      v17 = -[RTHealthKitManager _writeToFileAtURL:contentString:error:](self, "_writeToFileAtURL:contentString:error:", v48, v52, &v67);
      v21 = v67;

      if (v47)
        *v47 = objc_retainAutorelease(v21);

      v8 = v49;
      v11 = v46;
LABEL_31:

      goto LABEL_32;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: csvFileURL", buf, 2u);
    }

    if (a5)
    {
      v15 = CFSTR("csvFileURL");
      goto LABEL_13;
    }
LABEL_14:
    v17 = 0;
    goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  if (!a5)
    goto LABEL_14;
  v15 = CFSTR("locations");
LABEL_13:
  _RTErrorInvalidParameterCreate((uint64_t)v15);
  v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v17;
}

- (BOOL)_writeToFileAtURL:(id)a3 contentString:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v8, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v14, 0, 0);

        if ((v15 & 1) == 0)
        {
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v33 = *MEMORY[0x1E0D18598];
          v56 = *MEMORY[0x1E0CB2D50];
          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("Could not create file at %@"), v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 0, v37);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (a5)
          {
            v20 = objc_retainAutorelease(v20);
            v28 = 0;
            *a5 = v20;
          }
          else
          {
            v28 = 0;
          }
          goto LABEL_36;
        }
      }
      v16 = (void *)MEMORY[0x1E0CB3608];
      objc_msgSend(v8, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fileHandleForWritingAtPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0D18598];
        v54 = *MEMORY[0x1E0CB2D50];
        v55 = CFSTR("Could not open file descriptor to write diagnostics.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 0, v31);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (!a5)
        {
          v28 = 0;
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
LABEL_34:
        v20 = objc_retainAutorelease(v20);
        v28 = 0;
        *a5 = v20;
        goto LABEL_35;
      }
      v47 = 0;
      objc_msgSend(v18, "truncateAtOffset:error:", objc_msgSend(v18, "seekToEndOfFile"), &v47);
      v19 = v47;
      v20 = v19;
      if (a5 && v19)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
LABEL_33:

          goto LABEL_34;
        }
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v23;
        v50 = 2112;
        v51 = v24;
        v52 = 2112;
        v53 = v20;
      }
      else
      {
        objc_msgSend(v10, "dataUsingEncoding:", 4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        objc_msgSend(v18, "writeData:error:", v38, &v46);
        v39 = v46;

        if (a5 && v39)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v49 = v42;
            v50 = 2112;
            v51 = v43;
            v52 = 2112;
            v53 = v39;
            _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v20 = v39;
          goto LABEL_33;
        }
        v45 = 0;
        objc_msgSend(v18, "closeAndReturnError:", &v45);
        v20 = v45;

        v28 = 1;
        if (!a5 || !v20)
          goto LABEL_35;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v23;
        v50 = 2112;
        v51 = v24;
        v52 = 2112;
        v53 = v20;
      }
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      goto LABEL_33;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contentString", buf, 2u);
    }

    if (a5)
    {
      v26 = CFSTR("contentString");
      goto LABEL_19;
    }
LABEL_20:
    v28 = 0;
    goto LABEL_37;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
  }

  if (!a5)
    goto LABEL_20;
  v26 = CFSTR("url");
LABEL_19:
  _RTErrorInvalidParameterCreate((uint64_t)v26);
  v28 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v28;
}

- (BOOL)_writeToJSONAtURL:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a4, 3, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v9)
  {
    v10 = v9;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    v12 = "Encountered error in creating labelled JSON file, %@";
    goto LABEL_8;
  }
  v13 = 1;
  if ((objc_msgSend(v8, "writeToURL:atomically:", v7, 1) & 1) != 0)
  {
    v10 = 0;
    goto LABEL_12;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v15 = *MEMORY[0x1E0D18598];
  v20 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("JSON file couldn't be created, %@"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v17);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    v12 = "error, %@";
LABEL_8:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
  }
LABEL_9:

  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    v13 = 0;
    *a5 = v10;
  }
  else
  {
    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)fetchMostRecentWorkoutLocationTypeWithHandler:(id)a3
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
  v7[2] = __68__RTHealthKitManager_fetchMostRecentWorkoutLocationTypeWithHandler___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__RTHealthKitManager_fetchMostRecentWorkoutLocationTypeWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsMostRecentWorkoutLocationType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, (int)objc_msgSend(v2, "intValue"));

}

- (void)fetchMostRecentWorkoutActivityTypeWithHandler:(id)a3
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
  v7[2] = __68__RTHealthKitManager_fetchMostRecentWorkoutActivityTypeWithHandler___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__RTHealthKitManager_fetchMostRecentWorkoutActivityTypeWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsMostRecentWorkoutActivityType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, (int)objc_msgSend(v2, "intValue"));

}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  if (a3)
  {
    objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Location_Workout_Study"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v18);
    v8 = v18;

    if (v8)
    {
      v9 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }
    else
    {
      v16 = 0;
      v17 = 0;
      LOBYTE(v15) = 1;
      v9 = -[RTHealthKitManager _saveEntireHealthKitDataToURL:outAbsoluteURL:includeWorkoutData:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:includeClustersData:error:](self, "_saveEntireHealthKitDataToURL:outAbsoluteURL:includeWorkoutData:includeLocations:includeOdometerReadings:odometerSamplingIntervalComponents:includeClustersData:error:", v6, &v17, 1, 1, 0, 0, v15, &v16);
      v11 = v17;
      v12 = v16;
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("url"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(a4, "hasMask:", 2) & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__RTHealthKitManager_sendDiagnosticsToURL_options_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v9;
    v14 = v10;
    dispatch_async(v11, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __59__RTHealthKitManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2048;
    v27 = v7;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "---------> %@, %@, start _generateDiagnosticFilesAtURL, footprint, %.2f MB <---------", buf, 0x20u);

  }
  v8 = (void *)MEMORY[0x1D8231EA8]();
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  objc_msgSend(v9, "_generateDiagnosticFilesAtURL:error:", v10, &v21);
  v11 = v21;
  objc_autoreleasePoolPop(v8);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v2);
    *(_DWORD *)buf = 138413314;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    v26 = 2048;
    v27 = v17;
    v28 = 2112;
    v29 = v11;
    v30 = 2048;
    v31 = v19;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "---------> %@, %@, finished _generateDiagnosticFilesAtURL, footprint, %.2f MB, error, %@, latency, %.2f <---------", buf, 0x34u);

  }
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v11);

}

- (void)fetchEmergencyContactsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
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
    v7[2] = __56__RTHealthKitManager_fetchEmergencyContactsWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTHealthKitManager fetchEmergencyContactsWithHandler:]";
      v11 = 1024;
      v12 = 3995;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __56__RTHealthKitManager_fetchEmergencyContactsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEmergencyContactsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchEmergencyContactsWithHandler:(id)a3
{
  void (**v5)(id, _QWORD, id);
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
  id v27;
  NSObject *v28;
  NSObject *v29;
  objc_class *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  id v39;
  id v40;
  uint64_t v41;
  const char *aSelector;
  id obj;
  _QWORD v44[4];
  NSObject *v45;
  _BYTE *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE buf[12];
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, id))a3;
  if (v5)
  {
    aSelector = a2;
    *(_QWORD *)v59 = 0;
    *(_QWORD *)&v59[8] = v59;
    *(_QWORD *)&v59[16] = 0x3032000000;
    v60 = __Block_byref_object_copy__146;
    v61 = __Block_byref_object_dispose__146;
    v62 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__146;
    v52 = __Block_byref_object_dispose__146;
    v53 = 0;
    v6 = dispatch_semaphore_create(0);
    -[RTHealthKitManager medicalIDStore](self, "medicalIDStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __57__RTHealthKitManager__fetchEmergencyContactsWithHandler___block_invoke;
    v44[3] = &unk_1E9296EE0;
    v46 = v59;
    v47 = &v48;
    v8 = v6;
    v45 = v8;
    objc_msgSend(v7, "fetchMedicalIDEmergencyContactsWithCompletion:", v44);

    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v9, v11))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
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
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v63[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v63, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_retainAutorelease(v23);

    }
    else
    {
LABEL_7:
      v24 = 0;
    }

    v25 = v24;
    v26 = v25;
    v27 = (id)v49[5];
    if (v27 || (v27 = v25) != 0)
    {
      v5[2](v5, 0, v27);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(*(id *)(*(_QWORD *)&v59[8] + 40), "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v31;
        v55 = 2112;
        v56 = v32;
        v57 = 2048;
        v58 = v33;
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, fetched emergency contacts count, %lu", buf, 0x20u);

      }
      v34 = *(_QWORD *)(*(_QWORD *)&v59[8] + 40);
      v35 = (id *)(v49 + 5);
      obj = (id)v49[5];
      -[RTHealthKitManager _getRTContactsFromHKEmergencyContacts:error:](self, "_getRTContactsFromHKEmergencyContacts:error:", v34, &obj);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v35, obj);
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v36, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v39;
        v55 = 2112;
        v56 = v40;
        v57 = 2048;
        v58 = v41;
        _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, %@, RTContact count, %lu", buf, 0x20u);

      }
      ((void (**)(id, void *, id))v5)[2](v5, v36, (id)v49[5]);

    }
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v59, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v59 = 136315394;
      *(_QWORD *)&v59[4] = "-[RTHealthKitManager _fetchEmergencyContactsWithHandler:]";
      *(_WORD *)&v59[12] = 1024;
      *(_DWORD *)&v59[14] = 4009;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v59, 0x12u);
    }

  }
}

void __57__RTHealthKitManager__fetchEmergencyContactsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getRTContactsFromHKEmergencyContacts:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  dispatch_time_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  int v39;
  objc_class *v41;
  id v42;
  void *v43;
  void *v44;
  objc_class *v45;
  id v46;
  void *v47;
  const char *aSelector;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint64_t *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE buf[12];
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _QWORD v77[4];

  aSelector = a2;
  v77[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__146;
  v69 = __Block_byref_object_dispose__146;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__146;
  v63 = __Block_byref_object_dispose__146;
  v64 = 0;
  v5 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v56;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D8231EA8](v7);
        objc_msgSend(v11, "nameContactIdentifier", aSelector);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "nameContactIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
      v8 = v7;
    }
    while (v7);
  }

  if (!objc_msgSend(v5, "count"))
    goto LABEL_29;
  v15 = dispatch_semaphore_create(0);
  -[RTHealthKitManager contactsManager](self, "contactsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __66__RTHealthKitManager__getRTContactsFromHKEmergencyContacts_error___block_invoke;
  v51[3] = &unk_1E9296EE0;
  v53 = &v65;
  v54 = &v59;
  v17 = v15;
  v52 = v17;
  objc_msgSend(v16, "fetchContactsUsingContactIdentifiers:handler:", v5, v51);

  v18 = v17;
  v19 = (id)0x1E0C99000;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v18, v21))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v20);
  v24 = v23;
  v25 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_902);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "filteredArrayUsingPredicate:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "submitToCoreAnalytics:type:duration:", v29, 1, v24);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v31 = (void *)MEMORY[0x1E0CB35C8];
  v77[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v77, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v32);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v33 = objc_retainAutorelease(v19);

  }
  else
  {
LABEL_16:
    v33 = 0;
  }

  v34 = v33;
  v35 = v34;
  if (a4)
  {
    if (v60[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)v60[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v42;
        v72 = 2112;
        v73 = v43;
        v74 = 2112;
        v75 = v44;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v37 = (void *)v60[5];
LABEL_26:
      *a4 = objc_retainAutorelease(v37);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      goto LABEL_28;
    }
    if (v34)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v46;
        v72 = 2112;
        v73 = v47;
        v74 = 2112;
        v75 = v35;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v37 = v35;
      goto LABEL_26;
    }
  }
  v39 = 1;
LABEL_28:

  if (v39)
LABEL_29:
    v19 = (id)v66[5];

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v19;
}

void __66__RTHealthKitManager__getRTContactsFromHKEmergencyContacts_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_setupEvalMode
{
  void *v3;
  int v4;
  const char *v5;
  NSObject *v6;
  _QWORD v7[5];
  int out_token;

  -[RTHealthKitManager platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalInstall");

  if (v4)
  {
    out_token = 0;
    v5 = (const char *)objc_msgSend(CFSTR("RTDefaultsHealthKitManagerSpoofNotification"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__RTHealthKitManager__setupEvalMode__block_invoke;
    v7[3] = &unk_1E92A17A8;
    v7[4] = self;
    notify_register_dispatch(v5, &out_token, v6, v7);

  }
}

void __36__RTHealthKitManager__setupEvalMode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsHealthKitManagerSpoofNotification"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[RTNotification notificationName](RTHealthKitManagerWorkoutEndReminderShowAlertNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v14, "isEqualToString:", v3);

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
LABEL_9:
    v8 = (RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification *)objc_opt_new();
    goto LABEL_10;
  }
  +[RTNotification notificationName](RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v14, "isEqualToString:", v6);

  if (v7)
  {
    v5 = *(void **)(a1 + 32);
    v8 = -[RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification initWithAlertDimissedReason:]([RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification alloc], "initWithAlertDimissedReason:", 5);
LABEL_10:
    v13 = v8;
    objc_msgSend(v5, "postNotification:", v8);

    goto LABEL_11;
  }
  +[RTNotification notificationName](RTHealthKitManagerWorkoutSuggestedStopWorkoutNotification, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v14, "isEqualToString:", v9);

  if (v10)
  {
    v5 = *(void **)(a1 + 32);
    goto LABEL_9;
  }
  +[RTNotification notificationName](RTHealthKitManagerWorkoutResumedNotification, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "isEqualToString:", v11);

  if (v12)
  {
    v5 = *(void **)(a1 + 32);
    goto LABEL_9;
  }
LABEL_11:

}

- (NSUUID)currentWorkoutSessionIdentifier
{
  return self->_currentWorkoutSessionIdentifier;
}

- (void)setCurrentWorkoutSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentWorkoutSessionIdentifier, a3);
}

- (BOOL)currentWorkoutIsFirstPartyWorkout
{
  return self->_currentWorkoutIsFirstPartyWorkout;
}

- (void)setCurrentWorkoutIsFirstPartyWorkout:(BOOL)a3
{
  self->_currentWorkoutIsFirstPartyWorkout = a3;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (_HKWorkoutObserver)workoutObserver
{
  return self->_workoutObserver;
}

- (void)setWorkoutObserver:(id)a3
{
  objc_storeStrong((id *)&self->_workoutObserver, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDStore, a3);
}

- (id)errorFunction
{
  return self->_errorFunction;
}

- (void)setErrorFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (HKWorkoutClusterStore)workoutClusterStore
{
  return self->_workoutClusterStore;
}

- (void)setWorkoutClusterStore:(id)a3
{
  objc_storeStrong((id *)&self->_workoutClusterStore, a3);
}

- (HKObserverQuery)theNewWorkoutsForRaceRouteQuery
{
  return self->_theNewWorkoutsForRaceRouteQuery;
}

- (void)setTheNewWorkoutsForRaceRouteQuery:(id)a3
{
  objc_storeStrong((id *)&self->_theNewWorkoutsForRaceRouteQuery, a3);
}

- (HKObserverQuery)theNewWorkoutsForSMSuggestionsQuery
{
  return self->_theNewWorkoutsForSMSuggestionsQuery;
}

- (void)setTheNewWorkoutsForSMSuggestionsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_theNewWorkoutsForSMSuggestionsQuery, a3);
}

- (BOOL)receivedInitialNewWorkoutsQueryResponse
{
  return self->_receivedInitialNewWorkoutsQueryResponse;
}

- (void)setReceivedInitialNewWorkoutsQueryResponse:(BOOL)a3
{
  self->_receivedInitialNewWorkoutsQueryResponse = a3;
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

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (BOOL)listenForNewWorkoutsForRaceRouteEnabled
{
  return self->_listenForNewWorkoutsForRaceRouteEnabled;
}

- (BOOL)listenForNewWorkoutsForSMSuggestionsEnabled
{
  return self->_listenForNewWorkoutsForSMSuggestionsEnabled;
}

- (void)setListenForNewWorkoutsForSMSuggestionsEnabled:(BOOL)a3
{
  self->_listenForNewWorkoutsForSMSuggestionsEnabled = a3;
}

- (BOOL)listenForWorkoutSnapshotUpdatesEnabled
{
  return self->_listenForWorkoutSnapshotUpdatesEnabled;
}

- (void)setListenForWorkoutSnapshotUpdatesEnabled:(BOOL)a3
{
  self->_listenForWorkoutSnapshotUpdatesEnabled = a3;
}

- (BOOL)listenForWorkoutOngoingChangedEnabled
{
  return self->_listenForWorkoutOngoingChangedEnabled;
}

- (void)setListenForWorkoutOngoingChangedEnabled:(BOOL)a3
{
  self->_listenForWorkoutOngoingChangedEnabled = a3;
}

- (unint64_t)workoutMinDistance
{
  return self->_workoutMinDistance;
}

- (void)setWorkoutMinDistance:(unint64_t)a3
{
  self->_workoutMinDistance = a3;
}

- (unint64_t)workoutMinDistanceCycling
{
  return self->_workoutMinDistanceCycling;
}

- (void)setWorkoutMinDistanceCycling:(unint64_t)a3
{
  self->_workoutMinDistanceCycling = a3;
}

- (NSDate)mostRecentWorkoutStartDate
{
  return self->_mostRecentWorkoutStartDate;
}

- (void)setMostRecentWorkoutStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentWorkoutStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentWorkoutStartDate, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_theNewWorkoutsForSMSuggestionsQuery, 0);
  objc_storeStrong((id *)&self->_theNewWorkoutsForRaceRouteQuery, 0);
  objc_storeStrong((id *)&self->_workoutClusterStore, 0);
  objc_storeStrong(&self->_errorFunction, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_workoutObserver, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_currentWorkoutSessionIdentifier, 0);
}

@end
