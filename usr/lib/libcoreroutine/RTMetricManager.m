@implementation RTMetricManager

- (RTMetricManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_xpcActivityManager_);
}

- (RTMetricManager)initWithPlatform:(id)a3 xpcActivityManager:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  RTMetricManager *v12;

  v6 = (objc_class *)MEMORY[0x1E0DD9AF8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithComponentId:andBlockOnConfiguration:", 44, 1);
  +[RTMetricManager productionMetrics](RTMetricManager, "productionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = -[RTMetricManager initWithAWDServerConnection:configuredClasses:managedConfigurationManager:platform:xpcActivityManager:](self, "initWithAWDServerConnection:configuredClasses:managedConfigurationManager:platform:xpcActivityManager:", v9, v10, v11, v8, v7);

  return v12;
}

- (RTMetricManager)initWithAWDServerConnection:(id)a3 configuredClasses:(id)a4 managedConfigurationManager:(id)a5 platform:(id)a6 xpcActivityManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  RTMetricManager *v19;
  uint64_t v20;
  NSArray *configuredMetricClasses;
  NSObject *v22;
  void *v23;
  RTPlatform *platform;
  id v25;
  NSObject *v26;
  RTMetricManager *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: configuredClasses";
LABEL_22:
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_23;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: managedConfigurationManager";
    goto LABEL_22;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: platform";
    goto LABEL_22;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_22;
    }
LABEL_23:

    v27 = 0;
    goto LABEL_24;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTMetricManager;
  v19 = -[RTNotifier init](&v34, sel_init);
  if (v19)
  {
    v32 = v13;
    v20 = objc_msgSend(v14, "copy");
    configuredMetricClasses = v19->_configuredMetricClasses;
    v19->_configuredMetricClasses = (NSArray *)v20;

    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134218242;
      v36 = v31;
      v37 = 2112;
      v38 = v14;
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "Configured metric manager with %lu classes, %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v19->_managedConfigurationManager, a5);
    objc_storeStrong((id *)&v19->_awdServerConnection, a3);
    objc_storeStrong((id *)&v19->_platform, a6);
    objc_storeStrong((id *)&v19->_xpcActivityManager, a7);
    -[RTMetricManager configuredMetricClasses](v19, "configuredMetricClasses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    platform = v19->_platform;
    v33 = 0;
    -[RTMetricManager setupWithConfiguredClasses:platform:error:](v19, "setupWithConfiguredClasses:platform:error:", v23, platform, &v33);
    v25 = v33;

    v13 = v32;
    if (v25)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v25;
        _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "error configuring metric manager, %@", buf, 0xCu);
      }

    }
    -[RTMetricManager registerForXPCActivities:](v19, "registerForXPCActivities:", v19->_xpcActivityManager);

  }
  self = v19;
  v27 = self;
LABEL_24:

  return v27;
}

+ (id)productionMetrics
{
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fetchDiagnosticsEnabled:(id)a3
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
    v7[2] = __43__RTMetricManager_fetchDiagnosticsEnabled___block_invoke;
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
      v10 = "-[RTMetricManager fetchDiagnosticsEnabled:]";
      v11 = 1024;
      v12 = 123;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __43__RTMetricManager_fetchDiagnosticsEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDiagnosticsEnabled:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchDiagnosticsEnabled:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    -[RTMetricManager managedConfigurationManager](self, "managedConfigurationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, -[NSObject effectiveBoolValueForSetting:](v5, "effectiveBoolValueForSetting:", CFSTR("RTFeatureDiagnosticsSubmissionAllowed")));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[RTMetricManager _fetchDiagnosticsEnabled:]";
      v8 = 1024;
      v9 = 136;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }
  }

}

- (BOOL)setupWithConfiguredClasses:(id)a3 platform:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v8, "internalInstall");

  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__RTMetricManager_setupWithConfiguredClasses_platform_error___block_invoke;
    v14[3] = &unk_1E92974C8;
    v15 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  }
  _RTSafeArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v12 == 0;
}

void __61__RTMetricManager_setupWithConfiguredClasses_platform_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((-[objc_class conformsToProtocol:](v3, "conformsToProtocol:", &unk_1EFCD9890) & 1) == 0)
  {
    v10 = *MEMORY[0x1E0CB2D50];
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Class %@ does not conform to %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

  }
}

- (void)registerForXPCActivities:(id)a3
{
  id v5;
  RTXPCActivityCriteria *v6;
  _QWORD v7[4];
  id v8[2];
  id location[2];

  v5 = a3;
  if (v5)
  {
    v6 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 1, 1, 0, 0, 1, 86400.0, 60.0);
    -[RTXPCActivityCriteria setCpuIntensive:](v6, "setCpuIntensive:", 1);
    objc_initWeak(location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__RTMetricManager_registerForXPCActivities___block_invoke;
    v7[3] = &unk_1E9297790;
    v8[1] = (id)a2;
    objc_copyWeak(v8, location);
    objc_msgSend(v5, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.metrics.daily"), v6, v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = (RTXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", (uint8_t *)location, 2u);
    }
  }

}

void __44__RTMetricManager_registerForXPCActivities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, id);
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__RTMetricManager_registerForXPCActivities___block_invoke_84;
      v15[3] = &unk_1E9297650;
      v15[4] = v10;
      v16 = v5;
      dispatch_async(v11, v15);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "self was nil during daily metric activity, returning", buf, 2u);
      }

      if (v5)
      {
        v17 = *MEMORY[0x1E0CB2D50];
        v18 = CFSTR("self was nil during daily metric activity");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, v14);

      }
    }

  }
}

uint64_t __44__RTMetricManager_registerForXPCActivities___block_invoke_84(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RTMetricManagerDailyMetricNotification"), *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  -[RTMetricManager awdServerConnection](self, "awdServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "Flushing remaining metrics to AWD.", buf, 2u);
    }

    -[RTMetricManager awdServerConnection](self, "awdServerConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__RTMetricManager__shutdownWithHandler___block_invoke;
    v15[3] = &unk_1E92977B8;
    v10 = v6;
    v16 = v10;
    objc_msgSend(v8, "flushToQueue:block:", v9, v15);

    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v11, v13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);

    }
  }
  if (v4)
    v4[2](v4, 0);

}

intptr_t __40__RTMetricManager__shutdownWithHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTMetricManager_registerQueriableMetric_withHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __55__RTMetricManager_registerQueriableMetric_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerQueriableMetric:withHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_registerQueriableMetric:(unint64_t)a3 withHandler:(id)a4
{
  void (**v6)(id, unint64_t, void *, _QWORD);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void (**v13)(id, unint64_t, void *, _QWORD);
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int);
  void *v27;
  id v28;
  id v29[2];
  int v30;
  id location;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, unint64_t, void *, _QWORD))a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTMetricManager _registerQueriableMetric:withHandler:]";
      v38 = 1024;
      v39 = 257;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "metricId");
  -[RTMetricManager awdServerConnection](self, "awdServerConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Failed metric submission because routined didn't have a connection to awdd.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, a3, v18, 0);

    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed metric submission because routined didn't have a connection to awdd.");
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    -[RTMetricManager awdServerConnection](self, "awdServerConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke;
    v27 = &unk_1E9299AD0;
    objc_copyWeak(v29, &location);
    v30 = v9;
    v13 = v6;
    v28 = v13;
    v29[1] = (id)a3;
    v14 = objc_msgSend(v12, "registerQueriableMetric:callback:", v9, &v24);

    if (v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v9;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "Queriable Metric (%u) is registered.", buf, 8u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AWD registerQueriableMetric failure (%d)"), v9, v24, v25, v26, v27);
      v15 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 9, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, a3, v22, 0);

      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (const char *)v15;
        _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }

}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  int v14;
  int v15;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2;
    v11[3] = &unk_1E9299AA8;
    v8 = *(_DWORD *)(a1 + 56);
    v14 = a2;
    v15 = v8;
    v9 = *(id *)(a1 + 32);
    v10 = *(void **)(a1 + 48);
    v12 = v9;
    v13[1] = v10;
    objc_copyWeak(v13, v4);
    dispatch_async(v7, v11);

    objc_destroyWeak(v13);
  }

}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2(int32x2_t *a1)
{
  NSObject *v2;
  __int32 v3;
  uint64_t v4;
  int32x2_t v5;
  int32x2_t v6;
  void *v7;
  int32x2_t v8;
  int32x2_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15[3];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[7].i32[0];
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Registered Metric (%u) is triggered.", buf, 8u);
  }

  v4 = a1[7].u32[1];
  if (a1[7].i32[0] == (_DWORD)v4)
  {
    v5 = a1[6];
    v6 = a1[4];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_89;
    v14[3] = &unk_1E9299A80;
    objc_copyWeak(v15, (id *)&a1[5]);
    v15[2] = (id)vrev64_s32(a1[7]);
    v15[1] = (id)a1[6];
    (*(void (**)(int32x2_t, int32x2_t, _QWORD, _QWORD *))(*(_QWORD *)&v6 + 16))(v6, v5, 0, v14);
    objc_destroyWeak(v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("triggered metricId (%d) is not what we registered (%d)"), a1[7].u32[0], v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v9 = a1[6];
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(int32x2_t, int32x2_t, void *, _QWORD))(*(_QWORD *)&v8 + 16))(v8, v9, v12, 0);

    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_89(uint64_t a1, void *a2, void *a3, void *a4)
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
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2_90;
  v16[3] = &unk_1E9299A58;
  v16[4] = WeakRetained;
  v17 = v8;
  v21 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 40);
  v19 = v9;
  v20 = v12;
  v18 = v7;
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(v11, v16);

}

void __56__RTMetricManager__registerQueriableMetric_withHandler___block_invoke_2_90(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint8_t buf[4];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_DWORD *)(a1 + 76);
        objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        LODWORD(v16[0]) = v13;
        WORD2(v16[0]) = 2112;
        *(_QWORD *)((char *)v16 + 6) = v14;
        _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "A queriable metric is not submitted. %u (%@)", buf, 0x12u);

      }
      v4 = *(void **)(a1 + 32);
      +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", *(_QWORD *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_releaseMetricPlaceholderForMetric:withHandler:", v5, *(_QWORD *)(a1 + 56));

    }
    else
    {
      objc_msgSend(v2, "_submitMetric:withHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTMetricManager swelf is nil metricId (%d)"), *(unsigned int *)(a1 + 72));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

    }
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16[0] = v7;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

- (void)_releaseMetricPlaceholderForMetric:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[RTMetricManager awdServerConnection](self, "awdServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "metricId");
    -[RTMetricManager awdServerConnection](self, "awdServerConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newMetricContainerWithIdentifier:", v9);

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed metric submission because AWD was not configured to accept the metric id %u."), v9);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v18;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (v7)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 4, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v22);

      }
      v11 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v11, "setMetric:", v6);
    -[RTMetricManager awdServerConnection](self, "awdServerConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "submitMetric:", v11);

    if ((v13 & 1) != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = v9;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "AWD placeholder is released %u, success!", buf, 8u);
      }

      if (v7)
        v7[2](v7, 0);
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AWD placeholder may be not released %u, failed!"), v9);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (v7)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v28 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 6, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v26);

    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v34 = CFSTR("Failed metric submission because routined didn't have a connection to awdd.");
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  if (v7)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("Failed metric submission because routined didn't have a connection to awdd.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 3, v11);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);
    goto LABEL_21;
  }
LABEL_23:

}

- (void)submitMetric:(id)a3
{
  -[RTMetricManager submitMetric:withHandler:](self, "submitMetric:withHandler:", a3, 0);
}

- (void)submitMetric:(id)a3 withHandler:(id)a4
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
  block[2] = __44__RTMetricManager_submitMetric_withHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __44__RTMetricManager_submitMetric_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitMetric:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_submitMetric:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[RTMetricManager awdServerConnection](self, "awdServerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v14 = CFSTR("Failed metric submission because routined didn't have a connection to awdd.");
    v30 = 3;
LABEL_18:
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), v30, v32);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      v7[2](v7, v12);
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v14;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    goto LABEL_23;
  }
  if (!v6)
  {
    v14 = CFSTR("Failed metric submission because the metric was nil.");
    v30 = 1;
    goto LABEL_18;
  }
  if (!-[RTMetricManager _routineConfiguredForMetric:](self, "_routineConfiguredForMetric:", v6))
  {
    v14 = CFSTR("Failed metric submission because the metric was not an AWD metric.");
    v30 = 2;
    goto LABEL_18;
  }
  -[RTMetricManager managedConfigurationManager](self, "managedConfigurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "effectiveBoolValueForSetting:", CFSTR("RTFeatureDiagnosticsSubmissionAllowed"));

  if ((v10 & 1) == 0)
  {
    v14 = CFSTR("Failed metric submission because Diagnostics and Usage is disabled.");
    v30 = 5;
    goto LABEL_18;
  }
  v39 = 0;
  v11 = objc_msgSend(v6, "valid:", &v39);
  v12 = v39;
  if ((v11 & 1) != 0)
  {
    -[RTMetricManager awdServerConnection](self, "awdServerConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)objc_msgSend(v13, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "metricId"));

    if (v14)
    {
      -[__CFString setMetric:](v14, "setMetric:", v6);
      -[RTMetricManager awdServerConnection](self, "awdServerConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "submitMetric:", v14);

      if (v7)
      {
        if ((v16 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v40 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("Submitted metric type %@, failed!"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 6, v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v23;
        }
        v7[2](v7, v12);
      }
      v24 = (uint64_t)v12;
      if (!v12)
      {
        v12 = 0;
        goto LABEL_23;
      }
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v27;
      v28 = "Submitted metric type %@, failed!";
      v29 = v25;
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("Failed metric submission because AWD was not configured to accept the metric type %@."), v36);
      v25 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 4, v38);
      v24 = objc_claimAutoreleasedReturnValue();

      if (v7)
        v7[2](v7, (id)v24);
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v45 = v25;
      v28 = "%@";
      v29 = v27;
    }
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
LABEL_31:

LABEL_32:
    v12 = (id)v24;
    goto LABEL_23;
  }
  if (v7)
    v7[2](v7, v12);
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v12;
    _os_log_error_impl(&dword_1D1A22000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Error during metric validation, %@", buf, 0xCu);
  }
LABEL_23:

}

- (BOOL)_routineConfiguredForMetric:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[RTMetricManager configuredMetricClasses](self, "configuredMetricClasses", 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v13;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Metric manager is not configured for %@", buf, 0xCu);

  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)createMetricForType:(unint64_t)a3
{
  return +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", a3);
}

+ (id)metricForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 0x13)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(**((Class **)&unk_1E9299AF0 + a3)), "_init", v3, v4);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSArray)configuredMetricClasses
{
  return self->_configuredMetricClasses;
}

- (void)setConfiguredMetricClasses:(id)a3
{
  objc_storeStrong((id *)&self->_configuredMetricClasses, a3);
}

- (AWDServerConnection)awdServerConnection
{
  return self->_awdServerConnection;
}

- (void)setAwdServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_awdServerConnection, a3);
}

- (RTManagedConfiguration)managedConfigurationManager
{
  return self->_managedConfigurationManager;
}

- (void)setManagedConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationManager, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_managedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_awdServerConnection, 0);
  objc_storeStrong((id *)&self->_configuredMetricClasses, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (int)roundTimeInterval:(double)a3 byIntervalUnit:(unint64_t)a4
{
  if (a4)
    return (int)(a3 / (double)(int)a4) * a4;
  else
    return (int)(a3 * 1000.0);
}

+ (int)doubleToInt:(double)a3 shifts:(int)a4
{
  return (int)(__exp10((double)a4) * a3);
}

+ (int)intWithSignificantDigits:(int)a3 digits:(int)a4
{
  double v4;

  +[RTMetricManager doubleWithSignificantDigits:digits:](RTMetricManager, "doubleWithSignificantDigits:digits:", *(_QWORD *)&a4, (double)a3);
  return (int)v4;
}

+ (double)doubleWithSignificantDigits:(double)a3 digits:(int)a4
{
  double result;
  double v8;
  double v9;
  double v10;

  result = 0.0;
  if (a3 != 0.0 && a4 >= 1)
  {
    v8 = -a3;
    if (a3 >= 0.0)
      v8 = a3;
    v9 = log10(v8);
    v10 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v9)));
    return (double)(uint64_t)round(v10 * a3) / v10;
  }
  return result;
}

@end
