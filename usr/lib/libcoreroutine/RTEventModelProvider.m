@implementation RTEventModelProvider

- (RTEventModelProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager_);
}

- (RTEventModelProvider)initWithDefaultsManager:(id)a3 eventManager:(id)a4 learnedLocationManager:(id)a5 managedObjectContext:(id)a6 metricManager:(id)a7 persistenceManager:(id)a8
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  RTEventModelProvider *v20;
  RTEventModelProvider *v21;
  uint64_t v22;
  NSManagedObjectContext *v23;
  NSManagedObjectContext *managedObjectContext;
  NSObject *v25;
  const char *v26;
  RTEventModelProvider *v27;
  void *v28;
  NSObject *v30;
  RTPersistenceManager *persistenceManager;
  RTInvocationDispatcher *v32;
  void *v33;
  uint64_t v34;
  RTInvocationDispatcher *dispatcher;
  NSObject *v36;
  id v37;
  id v38;
  _QWORD block[4];
  RTEventModelProvider *v40;
  _QWORD v41[4];
  RTEventModelProvider *v42;
  objc_super v43;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v38 = a5;
  v17 = (unint64_t)a6;
  v37 = a7;
  v18 = (unint64_t)a8;
  v19 = (void *)v18;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_15;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: eventManager";
    goto LABEL_14;
  }
  if (!v38)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: learnedLocationManager";
      goto LABEL_14;
    }
LABEL_15:

    v27 = 0;
LABEL_16:
    v28 = v37;
    goto LABEL_17;
  }
  if (v17 | v18)
  {
    v43.receiver = self;
    v43.super_class = (Class)RTEventModelProvider;
    v20 = -[RTNotifier init](&v43, sel_init);
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_learnedLocationManager, a5);
      objc_storeStrong((id *)&v21->_eventManager, a4);
      objc_storeStrong((id *)&v21->_metricManager, a7);
      objc_storeStrong((id *)&v21->_persistenceManager, a8);
      v22 = MEMORY[0x1E0C809B0];
      if (v17)
      {
        v23 = (NSManagedObjectContext *)(id)v17;
        managedObjectContext = v21->_managedObjectContext;
        v21->_managedObjectContext = v23;
      }
      else
      {
        persistenceManager = v21->_persistenceManager;
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke;
        v41[3] = &unk_1E929CF08;
        v42 = v21;
        -[RTPersistenceManager createManagedObjectContext:](persistenceManager, "createManagedObjectContext:", v41);
        managedObjectContext = (NSManagedObjectContext *)v42;
      }

      objc_storeStrong((id *)&v21->_defaultsManager, a3);
      v32 = [RTInvocationDispatcher alloc];
      -[RTNotifier queue](v21, "queue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[RTInvocationDispatcher initWithQueue:](v32, "initWithQueue:", v33);
      dispatcher = v21->_dispatcher;
      v21->_dispatcher = (RTInvocationDispatcher *)v34;

      v21->_highProbabilityItemMinProbability = 0.8;
      v21->_relativeHighProbabilityItemMinDifference = 0.65;
      v21->_highProbabilityItemMinNumOfEvents = 3;
      -[RTNotifier queue](v21, "queue");
      v36 = objc_claimAutoreleasedReturnValue();
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_3;
      block[3] = &unk_1E92977B8;
      v40 = v21;
      dispatch_async(v36, block);

    }
    self = v21;
    v27 = self;
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  v28 = v37;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager", buf, 2u);
  }

  v27 = 0;
LABEL_17:

  return v27;
}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_2;
  v6[3] = &unk_1E9297540;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onManagedObjectContextCreated:", *(_QWORD *)(a1 + 40));
}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", v2, sel_onLearnedLocationManagerNotification_, v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:", v5, sel_onLearnedLocationManagerNotification_, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_onDailyMetricNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_4;
  v10[3] = &unk_1E92977B8;
  v11 = v9;
  objc_msgSend(v11, "_updateRegisteredDefaults:", v10);

}

void __138__RTEventModelProvider_initWithDefaultsManager_eventManager_learnedLocationManager_managedObjectContext_metricManager_persistenceManager___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "highProbabilityItemMinProbability");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "relativeHighProbabilityItemMinDifference");
    v6 = v5;
    v7 = objc_msgSend(*(id *)(a1 + 32), "highProbabilityItemMinNumOfEvents");
    v8 = 134218496;
    v9 = v4;
    v10 = 2048;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Updated defaults, highProbabilityItemMinProbability, %f, relativeHighProbabilityItemMinDifference, %f, highProbabilityItemMinNumOfEvents, %d", (uint8_t *)&v8, 0x1Cu);
  }

}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Shutdown RTEventModelProvider", v8, 2u);
  }

  -[RTNotifier removeObserver:](self->_learnedLocationManager, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTEventModelProvider dispatcher](self, "dispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shutdown");

  if (v4)
    v4[2](v4, 0);

}

- (RTLocationShifter)locationShifter
{
  RTLocationShifter *locationShifter;
  RTLocationShifter *v4;
  RTLocationShifter *v5;

  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (RTLocationShifter *)objc_opt_new();
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (void)_updateRegisteredDefaults:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  NSObject *v18;
  _QWORD v19[5];
  NSObject *v20;
  _QWORD v21[5];
  NSObject *v22;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke;
  v21[3] = &unk_1E92A0AF8;
  v21[4] = self;
  v8 = v5;
  v22 = v8;
  -[RTEventModelProvider updateValueForKey:expectedClass:handler:](self, "updateValueForKey:expectedClass:handler:", CFSTR("RTDefaultsEventModelProviderHighProbabilityItemMinProbability"), v6, v21);
  dispatch_group_enter(v8);
  v9 = objc_opt_class();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_2;
  v19[3] = &unk_1E92A0AF8;
  v19[4] = self;
  v10 = v8;
  v20 = v10;
  -[RTEventModelProvider updateValueForKey:expectedClass:handler:](self, "updateValueForKey:expectedClass:handler:", CFSTR("RTDefaultsEventModelProviderRelativeHighProbabilityItemMinDifference"), v9, v19);
  dispatch_group_enter(v10);
  v11 = objc_opt_class();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_3;
  v17[3] = &unk_1E92A0AF8;
  v17[4] = self;
  v18 = v10;
  v12 = v10;
  -[RTEventModelProvider updateValueForKey:expectedClass:handler:](self, "updateValueForKey:expectedClass:handler:", CFSTR("RTDefaultsEventModelProviderHighProbabilityItemMinNumOfEvents"), v11, v17);
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_4;
  block[3] = &unk_1E9297178;
  v16 = v4;
  v14 = v4;
  dispatch_group_notify(v12, v13, block);

}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setHighProbabilityItemMinProbability:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setRelativeHighProbabilityItemMinDifference:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighProbabilityItemMinNumOfEvents:", objc_msgSend(a3, "intValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__RTEventModelProvider__updateRegisteredDefaults___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateValueForKey:(id)a3 expectedClass:(Class)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  Class v14;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__RTEventModelProvider_updateValueForKey_expectedClass_handler___block_invoke;
    v11[3] = &unk_1E92A0B20;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    dispatch_async(v10, v11);

  }
}

void __64__RTEventModelProvider_updateValueForKey_expectedClass_handler___block_invoke(uint64_t a1)
{
  void *v2;
  char *v3;
  NSObject *v4;
  void (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "onDefaultsUpdate, %@ = %@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RTDefaultsEventModelProviderHighProbabilityItemMinProbability")))
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RTDefaultsEventModelProviderRelativeHighProbabilityItemMinDifference")))
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RTDefaultsEventModelProviderHighProbabilityItemMinNumOfEvents")))
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = 138412802;
        v10 = v8;
        v11 = 2080;
        v12 = "-[RTEventModelProvider updateValueForKey:expectedClass:handler:]_block_invoke";
        v13 = 1024;
        v14 = 331;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unhandled update for key, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
      }

      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v5();
  }

}

- (double)getOverlapTimeForIntervalStart1:(id)a3 intervalEnd1:(id)a4 intervalStart2:(id)a5 intervalEnd2:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v9 = a6;
  v10 = a4;
  objc_msgSend(a3, "laterDate:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "earlierDate:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceDate:", v11);
  v14 = fmax(v13, 0.0);

  return v14;
}

- (id)getLOIHistogramForEvents:(id)a3 andLocationsOfInterest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  id v23;
  RTEventModelProvider *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke;
  v22[3] = &unk_1E92A0B98;
  v11 = v7;
  v23 = v11;
  v24 = self;
  v12 = v9;
  v25 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v22);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_4;
  v18[3] = &unk_1E92A0BC0;
  v20 = v21;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_5;
  v17[3] = &unk_1E92A0BE8;
  v17[4] = v21;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_77);
  v14 = v19;
  v15 = v13;

  _Block_object_dispose(v21, 8);
  return v15;
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_2;
  v6[3] = &unk_1E92A0B70;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "visits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_3;
  v7[3] = &unk_1E92A0B48;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  RTLOIHistogramItem *v16;
  void *v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "getOverlapTimeForIntervalStart1:intervalEnd1:intervalStart2:intervalEnd2:", v6, v7, v8, v9);
  v11 = v10;

  if (v11 > 0.0)
  {
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "timeOfStay");
      objc_msgSend(v18, "setTimeOfStay:", v11 + v14);
      objc_msgSend(v18, "setNumOfEvents:", objc_msgSend(v18, "numOfEvents") + 1);
    }
    else
    {
      v15 = *(void **)(a1 + 48);
      v16 = -[RTLOIHistogramItem initWithLocationOfInterest:timeOfStay:andNumOfEvents:]([RTLOIHistogramItem alloc], "initWithLocationOfInterest:timeOfStay:andNumOfEvents:", *(_QWORD *)(a1 + 56), 1, v11);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, v17);

    }
  }
}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "timeOfStay");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_5(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "timeOfStay");
  objc_msgSend(v4, "setProbability:", v3 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

uint64_t __72__RTEventModelProvider_getLOIHistogramForEvents_andLocationsOfInterest___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "probability");
  v7 = v6;
  objc_msgSend(v5, "probability");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "probability");
    v11 = v10;
    objc_msgSend(v5, "probability");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4
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
  block[2] = __70__RTEventModelProvider_fetchLOIHistogramForEventLocation_withHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTEventModelProvider_fetchLOIHistogramForEventLocation_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLOIHistogramForEventLocation:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLOIHistogramForEventLocation:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v10, 1, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v10, 2, 0, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6[2](v6, v8, 0);

}

- (void)fetchAllLOIHistogramsWithHandler:(id)a3
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
  v7[2] = __57__RTEventModelProvider_fetchAllLOIHistogramsWithHandler___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__RTEventModelProvider_fetchAllLOIHistogramsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "locationOfInterestHistograms");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)getObjectWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5 fromDictionary:(id)a6
{
  RTEventLocationIdentifier *reusableLookupIdentifier;
  id v12;
  RTEventLocationIdentifier *v13;
  id v14;
  RTEventLocationIdentifier *v15;
  id v16;
  void *v17;

  reusableLookupIdentifier = self->_reusableLookupIdentifier;
  v12 = a6;
  v13 = (RTEventLocationIdentifier *)a5;
  v14 = a3;
  if (reusableLookupIdentifier)
  {
    -[RTEventLocationIdentifier setName:](reusableLookupIdentifier, "setName:", v14);

    -[RTEventLocationIdentifier setSource:](self->_reusableLookupIdentifier, "setSource:", a4);
    -[RTEventLocationIdentifier setCalendarIdentifier:](self->_reusableLookupIdentifier, "setCalendarIdentifier:", v13);
  }
  else
  {
    v15 = -[RTEventLocationIdentifier initWithName:source:calendarIdentifier:]([RTEventLocationIdentifier alloc], "initWithName:source:calendarIdentifier:", v14, a4, v13);

    v13 = self->_reusableLookupIdentifier;
    self->_reusableLookupIdentifier = v15;
  }

  v16 = -[RTEventLocationIdentifier normalize](self->_reusableLookupIdentifier, "normalize");
  objc_msgSend(a6, "objectForKey:", self->_reusableLookupIdentifier);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTEventLocationIdentifier setName:](self->_reusableLookupIdentifier, "setName:", 0);
  -[RTEventLocationIdentifier setSource:](self->_reusableLookupIdentifier, "setSource:", 0);
  -[RTEventLocationIdentifier setCalendarIdentifier:](self->_reusableLookupIdentifier, "setCalendarIdentifier:", 0);
  return v17;
}

- (void)addEvent:(id)a3 toIdentifierDict:(id)a4 useCalendarIdentifier:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  RTEventLocationIdentifier *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  RTEventLocationIdentifier *v22;
  void *v23;
  id v24;

  v5 = a5;
  v24 = a3;
  v8 = a4;
  if (v5)
  {
    objc_msgSend(v24, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v24, "locationWithoutPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v24, "locationsWithoutPrediction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = v24;
    if (v13 > 1)
      goto LABEL_10;
    objc_msgSend(v24, "locationWithoutPrediction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v15, 1, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v16 = -[RTEventLocationIdentifier initWithEvent:source:useCalendarIdentifier:]([RTEventLocationIdentifier alloc], "initWithEvent:source:useCalendarIdentifier:", v24, 1, v5);
      -[RTEventLocationIdentifier normalize](v16, "normalize");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_opt_new();
      objc_msgSend(v8, "setObject:forKey:", v11, v17);

    }
    objc_msgSend(v11, "addObject:", v24);
  }

  v14 = v24;
LABEL_10:
  objc_msgSend(v14, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(v24, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v20, 2, v10, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = -[RTEventLocationIdentifier initWithEvent:source:useCalendarIdentifier:]([RTEventLocationIdentifier alloc], "initWithEvent:source:useCalendarIdentifier:", v24, 2, v5);
      -[RTEventLocationIdentifier normalize](v22, "normalize");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_opt_new();
      objc_msgSend(v8, "setObject:forKey:", v21, v23);

    }
    objc_msgSend(v21, "addObject:", v24);

  }
}

- (BOOL)highProbabilityHistogramItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "probability");
  v6 = v5;
  -[RTEventModelProvider highProbabilityItemMinProbability](self, "highProbabilityItemMinProbability");
  if (v6 >= v7)
  {
    v9 = objc_msgSend(v4, "numOfEvents");
    v8 = v9 >= -[RTEventModelProvider highProbabilityItemMinNumOfEvents](self, "highProbabilityItemMinNumOfEvents");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)relativeHighProbabilityHistogramItem:(id)a3 toItem:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "probability");
  v9 = v8;
  objc_msgSend(v7, "probability");
  v11 = v10;

  -[RTEventModelProvider relativeHighProbabilityItemMinDifference](self, "relativeHighProbabilityItemMinDifference");
  if (v9 - v11 >= v12)
  {
    v14 = objc_msgSend(v6, "numOfEvents");
    v13 = v14 >= -[RTEventModelProvider highProbabilityItemMinNumOfEvents](self, "highProbabilityItemMinNumOfEvents");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getAllLOIHistogramsForEvents:(id)a3 andLocationsOfInterest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke;
  v19[3] = &unk_1E92973B8;
  v19[4] = self;
  v20 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke_2;
  v16[3] = &unk_1E92A0C50;
  v16[4] = self;
  v17 = v6;
  v11 = (id)objc_opt_new();
  v18 = v11;
  v12 = v6;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

void __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "participationStatus");
  if ((objc_msgSend(v10, "isAllDay") & 1) == 0 && v3 == 2)
  {
    objc_msgSend(v10, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    if (v7 > 600.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addEvent:toIdentifierDict:useCalendarIdentifier:", v10, *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v10, "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendarIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "addEvent:toIdentifierDict:useCalendarIdentifier:", v10, *(_QWORD *)(a1 + 40), 1);
    }
  }

}

void __76__RTEventModelProvider_getAllLOIHistogramsForEvents_andLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getLOIHistogramForEvents:andLocationsOfInterest:", a3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);

}

- (id)_fetchCalendarEvents
{
  int v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
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
  BOOL v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  dispatch_semaphore_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *context;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint8_t buf[8];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v32 = dispatch_semaphore_create(0);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__96;
  v49 = __Block_byref_object_dispose__96;
  v50 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v2 = -1;
  v3 = 1;
  v29 = *MEMORY[0x1E0D18598];
  v30 = *MEMORY[0x1E0CB2D50];
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v37 = *((_DWORD *)v52 + 6);
    if (v37 < 1501)
    {
      objc_msgSend(v33, "dateByAddingTimeInterval:", (double)v2 * 604800.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateByAddingTimeInterval:", (double)(v2 + 1) * 604800.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTEventModelProvider eventManager](self, "eventManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __44__RTEventModelProvider__fetchCalendarEvents__block_invoke;
      v39[3] = &unk_1E92A0C78;
      v4 = v5;
      v40 = v4;
      v8 = v6;
      v41 = v8;
      v43 = &v45;
      v44 = &v51;
      v9 = v32;
      v42 = v9;
      v35 = v8;
      objc_msgSend(v7, "fetchEventsBetweenStartDate:andEndDate:withHandler:", v4, v8, v39);

      v10 = v9;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = dispatch_time(0, 3600000000000);
      v13 = v36;
      if (dispatch_semaphore_wait(v10, v12))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceDate:", v11);
        v15 = v14;
        v16 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_417);
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
        v55 = v30;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v55, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v29, 15, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v36;
        if (v24)
        {
          v13 = objc_retainAutorelease(v24);

        }
      }

      v25 = v13;
      v36 = v25;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Fetched max number of events, stopped week %d", buf, 8u);
      }
    }

    objc_autoreleasePoolPop(context);
    v26 = v37 > 1500 || v2-- == -7;
    ++v3;
  }
  while (!v26);
  v27 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v27;
}

void __44__RTEventModelProvider__fetchCalendarEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v6, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = (uint64_t)v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Error fetching events: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      v10 = objc_msgSend(v5, "count");
      objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218498;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Fetched %lu events, startDate, %@, endDate, %@", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "arrayByAddingObjectsFromArray:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v5, "count");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_buildLocationOfInterestHistogramWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  -[RTEventModelProvider _fetchCalendarEvents](self, "_fetchCalendarEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__96;
  v20[4] = __Block_byref_object_dispose__96;
  v21 = 0;
  dispatch_group_enter(v6);
  -[RTEventModelProvider learnedLocationManager](self, "learnedLocationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke;
  v17[3] = &unk_1E9297010;
  v19 = v20;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "fetchRecentLocationsOfInterestWithHandler:", v17);

  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_150;
  v13[3] = &unk_1E92A0DE0;
  v13[4] = self;
  v14 = v5;
  v15 = v4;
  v16 = v20;
  v11 = v4;
  v12 = v5;
  dispatch_group_notify(v9, v10, v13);

  _Block_object_dispose(v20, 8);
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v6, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (uint64_t)v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Error fetching LOIs: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      v12 = 134217984;
      v13 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Fetched %lu LOIs.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(NSObject **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_150(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getAllLOIHistogramsForEvents:andLocationsOfInterest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocationOfInterestHistograms:", v2);

  v3 = objc_msgSend(*(id *)(a1 + 32), "_persistEventModel");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 134217984;
      v20 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Start logging %lu fetched events.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_153);
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
      *(_DWORD *)buf = 134217984;
      v20 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Start logging %lu fetched LOIs.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_155);
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "locationOfInterestHistograms");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v20 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "associated %lu events with LOIs", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "locationOfInterestHistograms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_159_0);

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = CFSTR("persist event model was unsuccessful");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);

    }
  }
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_151(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_msgSend(v4, "participationStatus");
  if ((objc_msgSend(v4, "isAllDay") & 1) == 0 && v5 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationWithoutPrediction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "calendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "calendarIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v16 = a3;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Event %lu, %@, %@, %@, %@, %@", buf, 0x3Eu);

    }
  }

}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_154(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = a3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "LOI %lu, %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v4, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_157);

}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_156(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "entryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "exitDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "entry, %@, exit, %@", (uint8_t *)&v8, 0x16u);

  }
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, possible LOIs, %lu", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_161_1);
}

void __69__RTEventModelProvider__buildLocationOfInterestHistogramWithHandler___block_invoke_160(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "possible LOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)refreshAllLOIHistogramsWithHandler:(id)a3
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
  v7[2] = __59__RTEventModelProvider_refreshAllLOIHistogramsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__RTEventModelProvider_refreshAllLOIHistogramsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildLocationOfInterestHistogramWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTEventModelProvider *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__RTEventModelProvider_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__RTEventModelProvider_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "received %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_buildLocationOfInterestHistogramWithHandler:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "available");
      v11 = *(void **)(a1 + 40);
      if (v10)
      {
        objc_msgSend(v11, "setLocationsOfInterestsAvailable:", 1);
        objc_msgSend(*(id *)(a1 + 40), "restoreEventModelIfAppropriate");
      }
      else
      {
        objc_msgSend(v11, "setLocationsOfInterestsAvailable:", 0);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "unhandled notification, %@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke;
  v10[3] = &unk_1E9297F30;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RTEventModelProvider fetchLOIHistogramForEventLocation:withHandler:](self, "fetchLOIHistogramForEventLocation:withHandler:", v9, v10);

}

void __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2;
  v13 = &unk_1E92973B8;
  v14 = a1[4];
  v6 = v5;
  v15 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v10);

  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v6, "count", v10, v11, v12, v13, v14);
    v9 = a1[5];
    *(_DWORD *)buf = 134218242;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "found %lu locations of interest associated with identifer, %@", buf, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __83__RTEventModelProvider_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "highProbabilityHistogramItem:"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v5, "locationOfInterest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)fetchLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[RTNotifier queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__RTEventModelProvider_fetchLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
    block[3] = &unk_1E9297F08;
    block[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    dispatch_async(v14, block);

  }
}

void __106__RTEventModelProvider_fetchLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_predictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("locationOfInterest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  RTEventModelProvider *v20;
  id v21;
  SEL v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    -[RTNotifier queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __115__RTEventModelProvider_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
    v16[3] = &unk_1E9298128;
    v22 = a2;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    v20 = self;
    v21 = v14;
    dispatch_async(v15, v16);

  }
}

void __115__RTEventModelProvider_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %@, location, %@, calendarIdentifier, %@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 56), "_predictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (id)_predictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  RTEventModelProvider *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  void *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  RTEventModelProvider *v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "length");
  -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v9, 1, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    v16 = v9;
    v17 = 1;
  }
  else
  {
    -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](self, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v8, 2, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    v16 = v8;
    v17 = 2;
  }
  -[RTEventModelProvider getObjectWithName:source:calendarIdentifier:fromDictionary:](v15, "getObjectWithName:source:calendarIdentifier:fromDictionary:", v16, v17, 0, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke;
  v35[3] = &unk_1E92A0E08;
  v36 = v9;
  v37 = self;
  v38 = v19;
  v21 = v19;
  v22 = v9;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232094](v35);
  ((void (**)(_QWORD, void *))v23)[2](v23, v13);
  ((void (**)(_QWORD, void *))v23)[2](v23, v18);
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_2;
  v33[3] = &unk_1E92A0E30;
  v34 = (id)objc_opt_new();
  v24 = v34;
  v25 = (void *)MEMORY[0x1D8232094](v33);
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v25);
  v28 = v20;
  v29 = 3221225472;
  v30 = __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_3;
  v31 = &unk_1E92A0E58;
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  v32 = v26;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", &v28);
  objc_msgSend(v26, "sortUsingComparator:", &__block_literal_global_172, v28, v29, v30, v31);

  return v26;
}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(v17, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationOfInterest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "length")
          || (objc_msgSend(v17, "objectAtIndexedSubscript:", v3),
              v7 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "locationOfInterest"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              v9 = objc_msgSend(v8, "type"),
              v8,
              v7,
              v9))
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v17, "objectAtIndexedSubscript:", v3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = objc_msgSend(v10, "highProbabilityHistogramItem:", v11);

          if ((_DWORD)v10)
            goto LABEL_7;
          if (objc_msgSend(v17, "count") > v3 + 1)
          {
            v14 = *(void **)(a1 + 40);
            objc_msgSend(v17, "objectAtIndexedSubscript:", v3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v3 + 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = objc_msgSend(v14, "relativeHighProbabilityHistogramItem:toItem:", v15, v16);

            if ((_DWORD)v14)
            {
LABEL_7:
              v12 = *(void **)(a1 + 48);
              objc_msgSend(v17, "objectAtIndexedSubscript:", v3);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v13);

            }
          }
        }
      }
      ++v3;
    }
    while (objc_msgSend(v17, "count") > v3);
  }

}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend(v3, "locationOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "doubleValue"), v8 = v7, objc_msgSend(v14, "probability"), v8 < v9))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "probability");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v14, "locationOfInterest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
}

void __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0D18450];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  v11 = (id)objc_msgSend(v8, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v7, 0, 0, 0, v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

uint64_t __99__RTEventModelProvider__predictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)onManagedObjectContextCreated:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (a3)
  {
    -[RTEventModelProvider setManagedObjectContext:](self, "setManagedObjectContext:");
    -[RTEventModelProvider dispatcher](self, "dispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "invocationsPending");

    if (v5)
    {
      -[RTEventModelProvider dispatcher](self, "dispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dispatchPendingInvocations");

    }
    -[RTEventModelProvider restoreEventModelIfAppropriate](self, "restoreEventModelIfAppropriate");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Failed to create managed object context.", v8, 2u);
    }

  }
}

- (BOOL)deleteEventModel
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t v18[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__96;
    v16 = __Block_byref_object_dispose__96;
    v17 = 0;
    -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__RTEventModelProvider_deleteEventModel__block_invoke;
    v11[3] = &unk_1E92977E0;
    v11[4] = self;
    v11[5] = buf;
    objc_msgSend(v4, "performBlockAndWait:", v11);

    v5 = *((_QWORD *)v13 + 5);
    v6 = v5 == 0;
    if (v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*((id *)v13 + 5), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v18 = 138412290;
        v19 = v10;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Error deleting event model, %@", v18, 0xCu);

      }
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "No managed object context, not purging.", buf, 2u);
    }

    return 0;
  }
  return v6;
}

void __40__RTEventModelProvider_deleteEventModel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTEventLocationIdentifierMO, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "deleteAllWithEntityName:predicate:error:", v3, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSManagedObject entityName](RTLOIHistogramItemMO, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "deleteAllWithEntityName:predicate:error:", v6, 0, &v11);
    objc_storeStrong((id *)(v7 + 40), v11);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(id *)(v9 + 40);
      objc_msgSend(v8, "save:", &v10);
      objc_storeStrong((id *)(v9 + 40), v10);

    }
  }
}

- (BOOL)_persistEventModel
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  uint8_t v16[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[RTEventModelProvider deleteEventModel](self, "deleteEventModel"))
  {
    -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      *(_QWORD *)v16 = 0;
      v17 = v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__96;
      v20 = __Block_byref_object_dispose__96;
      v21 = 0;
      -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __42__RTEventModelProvider__persistEventModel__block_invoke;
      v15[3] = &unk_1E92977E0;
      v15[4] = self;
      v15[5] = v16;
      objc_msgSend(v4, "performBlockAndWait:", v15);

      v5 = *((_QWORD *)v17 + 5);
      v6 = v5 == 0;
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v5)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*((id *)v17 + 5), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = (uint64_t)v9;
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Error persisting event model, %@", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        *(_DWORD *)buf = 134217984;
        v23 = v13;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Persisted event model for %lu identifiers.", buf, 0xCu);

      }
      _Block_object_dispose(v16, 8);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "Nothing to save.", v16, 2u);
      }

      return 1;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "Can't delete previous event model, not saving.", v16, 2u);
    }

    return 0;
  }
  return v6;
}

void __42__RTEventModelProvider__persistEventModel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id obj;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "locationOfInterestHistograms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__RTEventModelProvider__persistEventModel__block_invoke_2;
  v7[3] = &unk_1E92A0EE8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "save:", &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

}

void __42__RTEventModelProvider__persistEventModel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTEventLocationIdentifierMO managedObjectWithEventLocationIdentifier:inManagedObjectContext:](RTEventLocationIdentifierMO, "managedObjectWithEventLocationIdentifier:inManagedObjectContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__RTEventModelProvider__persistEventModel__block_invoke_3;
  v11[3] = &unk_1E92A0EC0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v10 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

}

void __42__RTEventModelProvider__persistEventModel__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLOIHistogramItemMO managedObjectWithLOIHistogramItem:inManagedObjectContext:](RTLOIHistogramItemMO, "managedObjectWithLOIHistogramItem:inManagedObjectContext:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEventLocationIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_restoreEventModelWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTEventLocationIdentifierMO, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v2, "fetchAllWithEntityName:predicate:sortDescriptors:error:", v3, 0, 0, &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;

  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v24 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Retrieved %lu identifiers from disk.", buf, 0xCu);
  }

  if (v5)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSManagedObject entityName](RTLOIHistogramItemMO, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v9, "fetchAllWithEntityName:predicate:sortDescriptors:error:", v10, 0, 0, &v21);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v21;

    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v12;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Retrieved %lu histogram items from disk.", buf, 0xCu);
    }

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "learnedLocationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_176;
      v17[3] = &unk_1E92A0F38;
      v15 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v20 = v15;
      v18 = v4;
      v8 = v8;
      v19 = v8;
      objc_msgSend(v14, "fetchRecentLocationsOfInterestWithHandler:", v17);

      v5 = 0;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = (uint64_t)v16;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Error restoring event model, %@", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_176(uint64_t a1, void *a2, void *a3)
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
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_2;
  v12[3] = &unk_1E92A0F10;
  v13 = v6;
  v18 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __54__RTEventModelProvider__restoreEventModelWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "count");
      v8 = 134217984;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Fetched %lu LOIs during restore.", (uint8_t *)&v8, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_finishRestoreEventModelWithIdentifiers:histoItems:locationsOfInterest:handler:", v4, v5, v7, *(_QWORD *)(a1 + 72));

  }
}

- (id)_getLocationOfInterestWithIdentifier:(id)a3 fromArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__96;
  v17 = __Block_byref_object_dispose__96;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__RTEventModelProvider__getLocationOfInterestWithIdentifier_fromArray___block_invoke;
  v10[3] = &unk_1E92A0F60;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __71__RTEventModelProvider__getLocationOfInterestWithIdentifier_fromArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_finishRestoreEventModelWithIdentifiers:(id)a3 histoItems:(id)a4 locationsOfInterest:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  RTEventModelProvider *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = (void *)objc_opt_new();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__96;
  v32 = __Block_byref_object_dispose__96;
  v33 = 0;
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke;
  v22[3] = &unk_1E92A0FF8;
  v16 = v10;
  v23 = v16;
  v24 = self;
  v17 = v12;
  v25 = v17;
  v27 = &v28;
  v18 = v14;
  v26 = v18;
  objc_msgSend(v15, "performBlockAndWait:", v22);

  if (v29[5])
  {
    v13[2](v13);
  }
  else
  {
    -[RTEventModelProvider setLocationOfInterestHistograms:](self, "setLocationOfInterestHistograms:", v18);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134217984;
        v35 = v20;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Finished restoring event model with %lu identifiers.", buf, 0xCu);
      }

      -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_181_0);

    }
    ((void (*)(void (**)(_QWORD), _QWORD))v13[2])(v13, 0);
  }

  _Block_object_dispose(&v28, 8);
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  __int128 v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_2;
  v6[3] = &unk_1E92A0FD0;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 56);
  v3 = (id)v5;
  v8 = v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  RTEventLocationIdentifier *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  RTEventLocationIdentifier *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;

  v6 = a2;
  v7 = [RTEventLocationIdentifier alloc];
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v6, "calendarIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RTEventLocationIdentifier initWithName:source:calendarIdentifier:](v7, "initWithName:source:calendarIdentifier:", v8, v10, v11);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v6, "loiHistogramItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_3;
  v19[3] = &unk_1E92A0F88;
  v14 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 56);
  v20 = v15;
  v22 = v16;
  v17 = v12;
  v21 = v17;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    *a4 = 1;
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_178);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v17, v18);

}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  RTLOIHistogramItem *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  RTLOIHistogramItem *v16;
  void *v17;
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "locationOfInterestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_getLocationOfInterestWithIdentifier:fromArray:", v7, *(_QWORD *)(a1 + 40));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a3 = 1;
  }
  v11 = [RTLOIHistogramItem alloc];
  objc_msgSend(v6, "timeOfStay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v6, "numOfEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[RTLOIHistogramItem initWithLocationOfInterest:timeOfStay:andNumOfEvents:](v11, "initWithLocationOfInterest:timeOfStay:andNumOfEvents:", v18, objc_msgSend(v15, "integerValue"), v14);

  objc_msgSend(v6, "probability");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "doubleValue");
  -[RTLOIHistogramItem setProbability:](v16, "setProbability:");

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
}

uint64_t __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "probability");
  v7 = v6;
  objc_msgSend(v5, "probability");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "probability");
    v11 = v10;
    objc_msgSend(v5, "probability");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v5, "count");
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, possible LOIs, %lu", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_183);
}

void __103__RTEventModelProvider__finishRestoreEventModelWithIdentifiers_histoItems_locationsOfInterest_handler___block_invoke_182(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "possible LOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)restoreEventModelIfAppropriate
{
  void *v3;
  BOOL v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v6 = v3,
        v4 = -[RTEventModelProvider locationsOfInterestsAvailable](self, "locationsOfInterestsAvailable"),
        v3 = v6,
        v4))
  {
    -[RTEventModelProvider locationOfInterestHistograms](self, "locationOfInterestHistograms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__RTEventModelProvider_restoreEventModelIfAppropriate__block_invoke;
      v7[3] = &unk_1E9297150;
      v7[4] = self;
      -[RTEventModelProvider _restoreEventModelWithHandler:](self, "_restoreEventModelWithHandler:", v7);
    }
  }
  else
  {

  }
}

void __54__RTEventModelProvider_restoreEventModelIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Error restoring the event model, %@. Compute from scratch.", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_buildLocationOfInterestHistogramWithHandler:", 0);
  }

}

- (void)persistEventModel
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RTEventModelProvider_persistEventModel__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__RTEventModelProvider_persistEventModel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistEventModel");
}

- (void)restoreEventModelWithHandler:(id)a3
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
  v7[2] = __53__RTEventModelProvider_restoreEventModelWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__RTEventModelProvider_restoreEventModelWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreEventModelWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 mapItem:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  RTEventModelProvider *v25;
  id v26;
  unint64_t v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[RTNotifier queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke;
  v21[3] = &unk_1E9298128;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = self;
  v26 = v15;
  v27 = a4;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, v21);

}

void __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v15 = v3;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "userInteraction, %lu, PLOI, %@, feedback, %@, mapItem, %@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 56), "_persistUserInteractionWithPredictedLocationOfInterest:interaction:feedback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "learnedLocationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "locationOfInterest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke_185;
    v12[3] = &unk_1E9299018;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v7, "updateLocationOfInterestWithIdentifier:mapItem:mapItemSource:handler:", v9, v10, 264, v12);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
}

uint64_t __108__RTEventModelProvider_userInteractionWithPredictedLocationOfInterest_interaction_feedback_mapItem_handler___block_invoke_185(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (BOOL)_persistUserInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  RTEventModelProvider *v24;
  uint8_t *v25;
  unint64_t v26;
  uint8_t v27[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "managedObjectContext is nil, not persisting user interaction.", v27, 2u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v8, "locationOfInterest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "No LOI identifier, not persisting user interaction.", v27, 2u);
    }
LABEL_11:

    v15 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)v27 = 0;
  v28 = v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__96;
  v31 = __Block_byref_object_dispose__96;
  v32 = 0;
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__RTEventModelProvider__persistUserInteractionWithPredictedLocationOfInterest_interaction_feedback___block_invoke;
  v21[3] = &unk_1E929DA50;
  v22 = v9;
  v26 = a4;
  v23 = v8;
  v24 = self;
  v25 = v27;
  objc_msgSend(v13, "performBlockAndWait:", v21);

  v14 = *((_QWORD *)v28 + 5);
  v15 = v14 == 0;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*((id *)v28 + 5), "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Error persisting user interaction, %@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "Persisted a user interaction.", buf, 2u);
  }

  _Block_object_dispose(v27, 8);
LABEL_15:

  return v15;
}

void __100__RTEventModelProvider__persistUserInteractionWithPredictedLocationOfInterest_interaction_feedback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "locationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RTEventModelUserInteractionMO managedObjectWithFeedback:interaction:locationOfInterestIdentifier:date:inManagedObjectContext:](RTEventModelUserInteractionMO, "managedObjectWithFeedback:interaction:locationOfInterestIdentifier:date:inManagedObjectContext:", v2, v3, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "save:", &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

}

- (BOOL)_deleteUserInteractionsBeforeDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  RTEventModelProvider *v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  uint8_t v32[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__96;
    v27 = __Block_byref_object_dispose__96;
    v28 = 0;
    -[RTEventModelProvider managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_191;
    v19[3] = &unk_1E9297AD0;
    v20 = v5;
    v21 = self;
    v22 = buf;
    objc_msgSend(v7, "performBlockAndWait:", v19);

    v8 = *((_QWORD *)v24 + 5);
    v9 = v8 == 0;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityEventModel);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = *((_QWORD *)v24 + 5);
        *(_DWORD *)v32 = 138412290;
        v33 = v18;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Error deleting user interactions, %@", v32, 0xCu);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "No managed object context, queuing purge operation.", buf, 2u);
    }

    -[RTEventModelProvider dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke;
    v30[3] = &unk_1E9297540;
    v30[4] = self;
    v31 = v5;
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_2;
    v29[3] = &__block_descriptor_40_e5_v8__0l;
    v29[4] = a2;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueBlock:failureBlock:description:", v30, v29, CFSTR("%@-%@"), v15, v16);

    v9 = 0;
  }

  return v9;
}

uint64_t __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteUserInteractionsBeforeDate:", *(_QWORD *)(a1 + 40));
}

void __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "failure block invoked for %@", (uint8_t *)&v4, 0xCu);

  }
}

void __58__RTEventModelProvider__deleteUserInteractionsBeforeDate___block_invoke_191(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id obj;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(date < %@)"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTEventModelUserInteractionMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "deleteAllWithEntityName:predicate:error:", v4, v2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(id *)(v7 + 40);
    objc_msgSend(v6, "save:", &v8);
    objc_storeStrong((id *)(v7 + 40), v8);

  }
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTEventModelProvider *v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__RTEventModelProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __68__RTEventModelProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 56) <= 2uLL && (v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "_deleteUserInteractionsBeforeDate:", v2);
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)locationsOfInterestsAvailable
{
  return self->_locationsOfInterestsAvailable;
}

- (void)setLocationsOfInterestsAvailable:(BOOL)a3
{
  self->_locationsOfInterestsAvailable = a3;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
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

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (double)highProbabilityItemMinProbability
{
  return self->_highProbabilityItemMinProbability;
}

- (void)setHighProbabilityItemMinProbability:(double)a3
{
  self->_highProbabilityItemMinProbability = a3;
}

- (double)relativeHighProbabilityItemMinDifference
{
  return self->_relativeHighProbabilityItemMinDifference;
}

- (void)setRelativeHighProbabilityItemMinDifference:(double)a3
{
  self->_relativeHighProbabilityItemMinDifference = a3;
}

- (int)highProbabilityItemMinNumOfEvents
{
  return self->_highProbabilityItemMinNumOfEvents;
}

- (void)setHighProbabilityItemMinNumOfEvents:(int)a3
{
  self->_highProbabilityItemMinNumOfEvents = a3;
}

- (NSDictionary)locationOfInterestHistograms
{
  return self->_locationOfInterestHistograms;
}

- (void)setLocationOfInterestHistograms:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterestHistograms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterestHistograms, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_reusableLookupIdentifier, 0);
}

- (unint64_t)_locationStateOfEvent:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "hasConfirmedSuggestedLocation") & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "hasUserSpecifiedLocation") & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = (objc_msgSend(v4, "hasRejectedSuggestion") & 1) == 0
      && -[RTEventModelProvider _hasSuggestedLocationForEvent:](self, "_hasSuggestedLocationForEvent:", v4);
  }

  return v5;
}

- (id)_geoLocationOfEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "preferredLocationWithoutPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "preferredLocationWithoutPrediction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "geoLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "hasRejectedSuggestion") & 1) != 0
      || (-[RTEventModelProvider _suggestedLocationForEvent:](self, "_suggestedLocationForEvent:", v4),
          (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v7 = (void *)v9;
    v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v7, "locationOfInterest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "initWithRTLocationOfInterest:", v11);

  }
LABEL_8:

  return v8;
}

- (BOOL)_hasSuggestedLocationForEvent:(id)a3
{
  void *v3;
  BOOL v4;

  -[RTEventModelProvider _suggestedLocationForEvent:](self, "_suggestedLocationForEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_suggestedLocationForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "needsSuggestedLocation"))
  {
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationWithoutPrediction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEventModelProvider _predictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:](self, "_predictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:", v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_submitMetricScoreBoardOnDate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardOnDate:]";
      v8 = 1024;
      v9 = 1316;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

  }
  -[RTEventModelProvider _submitMetricScoreBoardOnDate:submissionHandler:](self, "_submitMetricScoreBoardOnDate:submissionHandler:", v4, 0);

}

- (void)_submitMetricScoreBoardOnDate:(id)a3 submissionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardOnDate:submissionHandler:]";
      v13 = 1024;
      v14 = 1323;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }

  }
  objc_msgSend(v6, "startOfDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endOfDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTEventModelProvider _submitMetricScoreBoardFromStartDate:endDate:submissionHandler:](self, "_submitMetricScoreBoardFromStartDate:endDate:submissionHandler:", v9, v10, v7);

}

- (void)_submitMetricScoreBoardFromStartDate:(id)a3 endDate:(id)a4 submissionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardFromStartDate:endDate:submissionHandler:]";
    v26 = 1024;
    LODWORD(v27) = 1332;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTEventModelProvider(RTMetricManager) _submitMetricScoreBoardFromStartDate:endDate:submissionHandler:]";
      v26 = 1024;
      LODWORD(v27) = 1333;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "stringFromDate");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "LMP ScoreBoardOnDate:%@ - %@", buf, 0x16u);

  }
  -[RTEventModelProvider metricManager](self, "metricManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke;
  v20[3] = &unk_1E92A1198;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  objc_msgSend(v16, "fetchDiagnosticsEnabled:", v20);

}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2;
    v12[3] = &unk_1E9297EB8;
    v4 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v4;
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    dispatch_async(v3, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LMP score board: Failed metric submission because Diagnostics and Usage is disabled."));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v10);

    }
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__96;
  v20[4] = __Block_byref_object_dispose__96;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "eventManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3;
  v16[3] = &unk_1E92A1080;
  v18 = *(id *)(a1 + 56);
  v19 = v20;
  v7 = v2;
  v17 = v7;
  objc_msgSend(v3, "fetchEventsBetweenStartDate:andEndDate:withHandler:", v5, v6, v16);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_365;
  v11[3] = &unk_1E92A1170;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v15 = v20;
  v11[4] = v9;
  v12 = v10;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  dispatch_group_notify(v7, v8, v11);

  _Block_object_dispose(v20, 8);
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "LMP score board: Error fetching events %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "LMP score board: Fetched %lu events.", (uint8_t *)&v12, 0xCu);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v8 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_365(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  __int128 *v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  __int128 *p_buf;
  uint64_t v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = dispatch_group_create();
    dispatch_group_enter(v2);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__96;
    v30 = __Block_byref_object_dispose__96;
    v31 = 0;
    objc_msgSend(*(id *)(a1 + 32), "learnedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_366;
    v21[3] = &unk_1E92A1080;
    v23 = *(id *)(a1 + 56);
    p_buf = &buf;
    v7 = v2;
    v22 = v7;
    objc_msgSend(v3, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v5, v6, v21);

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_367;
    block[3] = &unk_1E92A1148;
    v9 = *(_QWORD *)(a1 + 32);
    v19 = &buf;
    block[4] = v9;
    v10 = *(void **)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    v18 = v10;
    dispatch_group_notify(v7, v8, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LMP score board: event counter is empty"));
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);

    }
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
    }

  }
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_366(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = (uint64_t)v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "LMP score, LOI for device: Error fetching LOIs of the device %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }
  else
  {
    if (v8)
    {
      v13 = 134217984;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "LMP score, LOI for device: Fetched %lu LOIs of the device.", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_367(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastDateOfLOIVisits:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_370;
    v42[3] = &unk_1E92A10F8;
    v7 = *(_QWORD *)(a1 + 32);
    v46 = v5;
    v42[4] = v7;
    v34 = v2;
    v43 = v34;
    v8 = v3;
    v44 = v8;
    v9 = v4;
    v45 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v42);
    v31 = v9;
    v32 = a1;
    v33 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_createMetricFromEventCounter:categories:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v16 = objc_alloc(MEMORY[0x1E0CB3940]);
          v17 = (void *)objc_msgSend(v16, "initWithCString:encoding:", RTAnalyticsEventLearnedMeeting, 1);
          log_analytics_submission(v17, v15);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v12);
    }
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v33;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = -[NSObject count](v33, "count");
      *(_DWORD *)buf = 134217984;
      v50 = v21;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "LMP score board: metric is submitted. (%lu)", buf, 0xCu);
    }

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_375;
    v35[3] = &unk_1E92A1120;
    v22 = v31;
    v23 = *(_QWORD *)(v32 + 32);
    v36 = v22;
    v37 = v23;
    -[NSObject enumerateObjectsUsingBlock:](v33, "enumerateObjectsUsingBlock:", v35);
    v24 = *(_QWORD *)(v32 + 40);
    if (v24)
      (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v10, 0);

    v25 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LMP score board: Location is not available"));
    v26 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v26;
    v27 = *(_QWORD *)(a1 + 40);
    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 10, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v27 + 16))(v27, 0, v30);

    }
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v25;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }

}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_2_370(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
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
  void *v38;
  uint64_t v39;
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
  _QWORD v50[4];
  id v51;

  v3 = a2;
  if ((objc_msgSend(v3, "isAllDay") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3880];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3_371;
    v50[3] = &unk_1E92A10D0;
    v5 = v3;
    v51 = v5;
    objc_msgSend(v4, "predicateWithBlock:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "filteredArrayUsingPredicate:");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_geoLocationOfEvent:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "_locationStateOfEvent:", v5);
    v47 = (void *)v7;
    v48 = (void *)v6;
    v9 = objc_msgSend(*(id *)(a1 + 32), "verifyPresenceOfUserWithEventLocation:deviceLOIs:", v7, v6);
    objc_msgSend(v5, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "endDate");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v46 = v10;
    v13 = objc_msgSend(*(id *)(a1 + 40), "compare:", v10);
    if (v9)
      v14 = 0;
    else
      v14 = v13 == -1;
    if (v14)
      v15 = 3;
    else
      v15 = v9;
    objc_msgSend(*(id *)(a1 + 32), "categoryForLocationState:ttlTrigggerd:", v8, objc_msgSend(v5, "hasTTLBeenTriggered"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v16, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
    v45 = (void *)v17;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
    if (objc_msgSend(v5, "hasRejectedSuggestion"))
    {
      objc_msgSend(*(id *)(a1 + 32), "categoryForLocationState:ttlTrigggerd:", 4, objc_msgSend(v5, "hasTTLBeenTriggered"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
      v19 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v18, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

    }
    if (v8 == 1)
    {
      objc_msgSend(v5, "locationWithoutPrediction");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(v5, "locationWithoutPrediction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24)
          v25 = 1;
        else
          v25 = 2;
      }
      else
      {
        v25 = 2;
      }
      objc_msgSend(*(id *)(a1 + 32), "appendFieldToCategoryString:field:value:", v16, CFSTR("MODEL"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v26);
      v27 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v26, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v28);

    }
    objc_msgSend(*(id *)(a1 + 32), "appendFieldToCategoryString:field:value:", v16, CFSTR("LENGTH"), objc_msgSend(*(id *)(a1 + 32), "lengthOfEvent:", v5));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
    v30 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v29, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v31);

    objc_msgSend(*(id *)(a1 + 32), "appendFieldToCategoryString:field:value:", v16, CFSTR("TOD"), objc_msgSend(*(id *)(a1 + 32), "timeOfDayOfEvent:", v5));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v32);
    v33 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v32, v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v34);

    if (v8 != 1)
      goto LABEL_28;
    objc_msgSend(*(id *)(a1 + 32), "_suggestedLocationForEvent:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (!v35)
    {
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    objc_msgSend(v35, "locationOfInterest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "type"))
    {
      objc_msgSend(v36, "locationOfInterest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "type");

      if (v39 != 1)
      {
        v40 = -1;
LABEL_26:
        objc_msgSend(*(id *)(a1 + 32), "appendFieldToCategoryString:field:value:", v16, CFSTR("TYPE"), v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v42);
        v43 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "keywordForCategory:visited:", v42, v15);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v44);

        goto LABEL_27;
      }
    }
    else
    {

    }
    objc_msgSend(v36, "locationOfInterest");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v41, "type");

    goto LABEL_26;
  }
LABEL_29:

}

uint64_t __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_3_371(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a2;
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v5, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_4;
  v10[3] = &unk_1E92A10A8;
  v11 = *(id *)(a1 + 32);
  v12 = &v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  v8 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v6 = a2;
  objc_msgSend(v6, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "laterDate:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "exitDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "earlierDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceDate:", v13);
  if (v12 > 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __104__RTEventModelProvider_RTMetricManager___submitMetricScoreBoardFromStartDate_endDate_submissionHandler___block_invoke_375(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEventModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "countForObject:", v6);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "countForObject:", v9);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "countForObject:", v12);
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413314;
    v16 = v3;
    v17 = 1024;
    v18 = v7;
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = (int)v11;
    v23 = 1024;
    v24 = objc_msgSend(v13, "countForObject:", v14);
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "LMP score board: (%@: corrects=%d, incorrects=%d, unknowns=%d, invalid=%d)", (uint8_t *)&v15, 0x24u);

  }
}

- (id)lastDateOfLOIVisits:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v7, "visits");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v13, "entryDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "exitDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v13, "exitDate");
                v16 = objc_claimAutoreleasedReturnValue();

                v14 = (void *)v16;
              }
              if (!v5 || objc_msgSend(v14, "compare:", v5) == 1)
              {
                v17 = v14;

                v5 = v17;
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)lengthOfEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 < 900.0)
    return 0;
  if (v7 < 1800.0)
    return 1;
  if (v7 < 2700.0)
    return 2;
  if (v7 < 3600.0)
    return 3;
  if (v7 >= 7200.0)
    return 5;
  return 4;
}

- (unint64_t)timeOfDayOfEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(a3, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hour");

  v5 = 1;
  if (v4 > 18)
    v5 = 2;
  if (v4 >= 8)
    return v5;
  else
    return 0;
}

- (id)_createMetricFromEventCounter:(id)a3 categories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  RTEventModelProvider *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    v22 = "-[RTEventModelProvider(RTMetricManager) _createMetricFromEventCounter:categories:]";
    v23 = 1024;
    v24 = 1587;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventCounter (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTEventModelProvider(RTMetricManager) _createMetricFromEventCounter:categories:]";
      v23 = 1024;
      v24 = 1588;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: categories (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v11 = (void *)objc_opt_new();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__RTEventModelProvider_RTMetricManager___createMetricFromEventCounter_categories___block_invoke;
  v17[3] = &unk_1E92A11C0;
  v18 = v6;
  v19 = self;
  v12 = v11;
  v20 = v12;
  v13 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
  v14 = v20;
  v15 = v12;

  return v15;
}

void __82__RTEventModelProvider_RTMetricManager___createMetricFromEventCounter_categories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a2;
  v22 = (id)objc_opt_new();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "countForObject:", v5);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "countForObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "countForObject:", v11);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keywordForCategory:visited:", v3, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "countForObject:", v14);

  v16 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("keyword"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("corrects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("incorrects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("unknown"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("invalids"));

  if (v9 + v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 / (v9 + v6));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("precision"));

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v22);

}

- (id)categoryForLocationState:(unint64_t)a3 ttlTrigggerd:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[RTEventModelProvider appendFieldToCategoryString:field:value:](self, "appendFieldToCategoryString:field:value:", 0, CFSTR("LOC"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTEventModelProvider appendFieldToCategoryString:field:value:](self, "appendFieldToCategoryString:field:value:", v6, CFSTR("TTL"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)keywordForCategory:(id)a3 visited:(unint64_t)a4
{
  return -[RTEventModelProvider appendFieldToCategoryString:field:value:](self, "appendFieldToCategoryString:field:value:", a3, CFSTR("VISIT"), a4);
}

- (id)appendFieldToCategoryString:(id)a3 field:(id)a4 value:(int64_t)a5
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTEventModelProvider(RTMetricManager) appendFieldToCategoryString:field:value:]";
      v16 = 1024;
      v17 = 1630;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: field (in %s:%d)", buf, 0x12u);
    }

    if (!v7)
      goto LABEL_10;
  }
  if (-[__CFString length](v7, "length"))
  {
    v10 = CFSTR(",");
    if (!v8)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_10:

  v7 = &stru_1E92AB3A8;
  v10 = &stru_1E92AB3A8;
  if (!v8)
  {
LABEL_13:
    v11 = v7;
    goto LABEL_14;
  }
LABEL_11:
  if (!objc_msgSend(v8, "length"))
    goto LABEL_13;
  v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@%@=%ld"), v7, v10, v8, a5);
LABEL_14:
  v12 = v11;

  return v12;
}

- (unint64_t)verifyPresenceOfUserWithEventLocation:(id)a3 deviceLOIs:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v7 = 2;
    v17 = 2;
    if (v5)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v5);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__RTEventModelProvider_RTMetricManager__verifyPresenceOfUserWithEventLocation_deviceLOIs___block_invoke;
      v11[3] = &unk_1E92A0F60;
      v9 = v8;
      v12 = v9;
      v13 = &v14;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
      v7 = v15[3];

    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __90__RTEventModelProvider_RTMetricManager__verifyPresenceOfUserWithEventLocation_deviceLOIs___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  id v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint8_t v33[8];
  id v34;

  v6 = a2;
  v7 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v6, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latitude");
  v10 = v9;
  objc_msgSend(v6, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longitude");
  v13 = v12;
  objc_msgSend(v6, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalUncertainty");
  v16 = v15;
  objc_msgSend(v6, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "altitude");
  v19 = v18;
  objc_msgSend(v6, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "verticalUncertainty");
  v22 = (void *)objc_msgSend(v7, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", 0, 0, v10, v13, v16, v19, v21, 0.0);

  v23 = (void *)objc_opt_new();
  v24 = *(_QWORD *)(a1 + 32);
  v34 = 0;
  objc_msgSend(v23, "distanceFromLocation:toLocation:error:", v24, v22, &v34);
  v26 = v25;
  v27 = v34;
  if (v27)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Error computing distance in metrics, unable to verify user presence", v33, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 3;
  }
  objc_msgSend(v6, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "horizontalUncertainty");
  v31 = v30;

  v32 = 100.0;
  if (v31 >= 100.0)
    v32 = v31;
  if (v26 < v32)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)onDailyMetricNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTEventModelProvider *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__RTEventModelProvider_RTMetricManager__onDailyMetricNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__RTEventModelProvider_RTMetricManager__onDailyMetricNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v3 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2080;
      v15 = "-[RTEventModelProvider(RTMetricManager) onDailyMetricNotification:]_block_invoke";
      v16 = 1024;
      v17 = 1691;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v6 & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEventModel);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "LMP, a ScoreBoard metric is requested.", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_submitMetricScoreBoardOnDate:", v9);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v12, 0xCu);

    }
  }

}

@end
