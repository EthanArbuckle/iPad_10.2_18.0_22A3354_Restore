@implementation SMSessionMonitor

- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 noMovementMonitor:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SMSessionMonitor *v31;

  v28 = a12;
  v27 = a11;
  v26 = a10;
  v17 = a9;
  v25 = a8;
  v18 = a7;
  v19 = a6;
  v24 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  v31 = -[SMSessionMonitor initWithDefaultsManager:dataProtectionManager:healthKitManager:locationManager:motionActivityManager:platform:sessionMetricManager:sessionStore:wristStateManager:timerManager:noMovementMonitor:](self, "initWithDefaultsManager:dataProtectionManager:healthKitManager:locationManager:motionActivityManager:platform:sessionMetricManager:sessionStore:wristStateManager:timerManager:noMovementMonitor:", v21, v20, v24, v19, v18, v25, v17, v26, v27, v22, v28);

  return v31;
}

- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 timerManager:(id)a12 noMovementMonitor:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SMSessionMonitor *v27;
  SMSessionMonitor *v28;
  uint64_t v29;
  RTDistanceCalculator *distanceCalculator;
  SMSessionMonitor *v31;
  SMSessionMonitor *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  SMSessionMonitor *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  SMSessionMonitor *v43;
  NSObject *v45;
  id v46;
  dispatch_queue_t v47;
  OS_dispatch_queue *queue;
  NSObject *v49;
  id v50;
  id v52;
  id v53;
  id v54;
  id v55;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD block[4];
  SMSessionMonitor *v65;
  objc_super v66;
  uint8_t buf[16];

  v18 = a3;
  v52 = a4;
  v19 = a4;
  v53 = a5;
  v59 = a5;
  v54 = a6;
  v20 = a6;
  v55 = a7;
  v21 = a7;
  v60 = a8;
  v62 = a9;
  v63 = a10;
  v57 = a11;
  v61 = a12;
  v22 = a13;
  v58 = v18;
  if (!v18)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v37 = 0;
    v38 = 0;
    v24 = v59;
    v23 = v19;
    v25 = v21;
    goto LABEL_20;
  }
  v23 = v19;
  if (!v19)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    v24 = v59;
    v25 = v21;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager", buf, 2u);
    }

    v37 = 0;
    v38 = v58;
LABEL_20:
    v26 = v60;
LABEL_37:
    v43 = self;
    v42 = v57;
    goto LABEL_38;
  }
  v24 = v59;
  v25 = v21;
  if (!v59)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    v26 = v60;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: healthKitManager";
LABEL_35:
    _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_36;
  }
  v26 = v60;
  if (!v20)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_35;
  }
  if (!v25)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_35;
  }
  if (!v60)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: platform";
    goto LABEL_35;
  }
  if (!v63)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_35;
  }
  if (!v62)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: sessionMetricManager";
    goto LABEL_35;
  }
  if (!v61)
  {
    v35 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v41 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_35;
    }
LABEL_36:

    v37 = 0;
    v38 = v58;
    goto LABEL_37;
  }
  v50 = v22;
  if (v22)
  {
    v66.receiver = self;
    v66.super_class = (Class)SMSessionMonitor;
    v27 = -[SMSessionMonitor init](&v66, sel_init);
    if (v27)
    {
      v28 = v27;
      objc_storeStrong((id *)&v27->_defaultsManager, a3);
      objc_storeStrong((id *)&v28->_dataProtectionManager, v52);
      v29 = objc_opt_new();
      distanceCalculator = v28->_distanceCalculator;
      v28->_distanceCalculator = (RTDistanceCalculator *)v29;

      objc_storeStrong((id *)&v28->_healthKitManager, v53);
      objc_storeStrong((id *)&v28->_locationManager, v54);
      objc_storeStrong((id *)&v28->_motionActivityManager, v55);
      objc_storeStrong((id *)&v28->_platform, a8);
      objc_storeStrong((id *)&v28->_sessionMetricManager, a9);
      objc_storeStrong((id *)&v28->_sessionStore, a10);
      objc_storeStrong((id *)&v28->_wristStateManager, a11);
      objc_storeStrong((id *)&v28->_timerManager, a12);
      objc_storeStrong((id *)&v28->_noMovementMonitor, a13);
      v31 = v28;
      v32 = v28;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = (const char *)-[SMSessionMonitor UTF8String](objc_retainAutorelease(v32), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v32);
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = (const char *)objc_msgSend(v46, "UTF8String");

        v26 = v60;
      }
      v47 = dispatch_queue_create(v34, v33);

      queue = v32->_queue;
      v32->_queue = (OS_dispatch_queue *)v47;

      -[SMSessionMonitor queue](v32, "queue");
      v49 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __213__SMSessionMonitor_initWithDefaultsManager_dataProtectionManager_healthKitManager_locationManager_motionActivityManager_platform_sessionMetricManager_sessionStore_wristStateManager_timerManager_noMovementMonitor___block_invoke;
      block[3] = &unk_1E92977B8;
      v65 = v32;
      dispatch_async(v49, block);

      v27 = v31;
    }
    v43 = v27;
    v37 = v43;
    v42 = v57;
    v38 = v58;
    v35 = v50;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    v42 = v57;
    v38 = v58;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: noMovementMonitor", buf, 2u);
    }

    v37 = 0;
    v35 = 0;
    v43 = self;
  }
LABEL_38:

  return v37;
}

uint64_t __213__SMSessionMonitor_initWithDefaultsManager_dataProtectionManager_healthKitManager_locationManager_motionActivityManager_platform_sessionMetricManager_sessionStore_wristStateManager_timerManager_noMovementMonitor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  void *v3;
  double v4;
  NSObject *v5;
  double sessionMonitorRegionInsidePendingTimerDelay;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[RTDefaultsManager objectForKey:value:](self->_defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSessionMonitorRegionInsidePendingTimerDelay"), &unk_1E932CD70);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    self->_sessionMonitorRegionInsidePendingTimerDelay = v4;

    if (self->_sessionMonitorRegionInsidePendingTimerDelay == 30.0)
      return;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      sessionMonitorRegionInsidePendingTimerDelay = self->_sessionMonitorRegionInsidePendingTimerDelay;
      v7 = 136316162;
      v8 = "-[SMSessionMonitor _setup]";
      v9 = 2080;
      v10 = "overriding session monitor region inside pending timer delay";
      v11 = 2048;
      v12 = 0x403E000000000000;
      v13 = 2048;
      v14 = sessionMonitorRegionInsidePendingTimerDelay;
      v15 = 2112;
      v16 = CFSTR("RTDefaultsSessionMonitorRegionInsidePendingTimerDelay");
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v7, 0x34u);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[SMSessionMonitor _setup]";
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%s, feature not enabled", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_shutdownWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_bootstrap
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
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
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__24;
  v51 = __Block_byref_object_dispose__24;
  v52 = 0;
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__24;
  v45 = __Block_byref_object_dispose__24;
  v46 = 0;
  v3 = dispatch_semaphore_create(0);
  -[SMSessionMonitor sessionStore](self, "sessionStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __30__SMSessionMonitor__bootstrap__block_invoke;
  v37[3] = &unk_1E9299BA8;
  v39 = &v47;
  v40 = &v41;
  v7 = v3;
  v38 = v7;
  objc_msgSend(v4, "fetchMostRecentSessionMonitorStateWithSessionID:handler:", v6, v37);

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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_372);
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
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v56[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v56, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v42 + 5, v23);
  v26 = v42[5];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v26)
  {
    if (v28)
    {
      v29 = v42[5];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      v54 = 2112;
      v55 = v29;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%s, Error while fetching sessionMonitor state, error, %@", buf, 0x16u);
    }
  }
  else
  {
    if (v28)
    {
      v30 = (void *)v48[5];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      v54 = 2112;
      v55 = v30;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%s, most recent sessionMonitor state, %@", buf, 0x16u);
    }

    if (v48[5])
    {
      -[SMSessionMonitor setSessionMonitorState:](self, "setSessionMonitorState:");
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0D8BA48]);
      -[SMSessionMonitor configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sessionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v31, "initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:", v33, 0, 0, 0, v34);
      -[SMSessionMonitor setSessionMonitorState:](self, "setSessionMonitorState:", v35);

      -[SMSessionMonitor _persistState](self, "_persistState");
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      v54 = 2112;
      v55 = v36;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%s     , %@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

}

void __30__SMSessionMonitor__bootstrap__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SMSessionMonitor _reset]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTriggerPending:", 0);

  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerConfirmed:", 0);

  -[SMSessionMonitor setConfiguration:](self, "setConfiguration:", 0);
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentRegionState:", 0);

  -[SMSessionMonitor setRiskState:](self, "setRiskState:", 0);
  -[SMSessionMonitor regionInsidePendingTimer](self, "regionInsidePendingTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[SMSessionMonitor setRegionInsidePendingTimer:](self, "setRegionInsidePendingTimer:", 0);
  -[SMSessionMonitor _persistState](self, "_persistState");
}

- (void)setSessionManagerDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCD0A08)
    && (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCD0BE0) & 1) != 0)
  {
    objc_storeWeak((id *)&self->_sessionManagerDelegate, v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [sessionManagerDelegate conformsToProtocol:@protocol(SMSessionManagerMonitorProtocol)] && [sessionManagerDelegate conformsToProtocol:@protocol(SMSessionManagerRegistrationProtocol)]", v6, 2u);
    }

  }
}

- (void)setRiskState:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  unint64_t riskState;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D8BA40];
  -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isSOSTriggerCategory:", objc_msgSend(v6, "triggerCategory"));

  riskState = self->_riskState;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (riskState != a3 || (v7 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      +[SMSessionMonitor riskStateToString:](SMSessionMonitor, "riskStateToString:", self->_riskState);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SMSessionMonitor riskStateToString:](SMSessionMonitor, "riskStateToString:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 136315650;
      v29 = "-[SMSessionMonitor setRiskState:]";
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, riskState change detected, from, %@, to, %@", (uint8_t *)&v28, 0x20u);

    }
    switch(a3)
    {
      case 4uLL:
        -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionMonitor _promptSafeArrivalWithContext:](self, "_promptSafeArrivalWithContext:", v14);
        break;
      case 3uLL:
        -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "triggerConfirmed") ^ 1 | v7;

        -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 != 1)
        {
LABEL_19:
          -[SMSessionMonitor _updateUserWithTriggerContext:](self, "_updateUserWithTriggerContext:", v14);
          break;
        }
        -[SMSessionMonitor _promptDirectTriggerWithContext:](self, "_promptDirectTriggerWithContext:", v14);
        break;
      case 2uLL:
        if (self->_riskState == 3)
        {
LABEL_13:
          -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionMonitor _updateUserWithTriggerContext:](self, "_updateUserWithTriggerContext:", v13);

          return;
        }
        -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "triggerPending");

        if (!v18)
        {
          v19 = (void *)MEMORY[0x1E0D8BA40];
          -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = objc_msgSend(v19, "isRoundTripTriggerCategory:", objc_msgSend(v20, "triggerCategory"));

          if ((_DWORD)v19)
          {
            -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionMonitor _promptRoundTripAnomalyVerificationWithContext:](self, "_promptRoundTripAnomalyVerificationWithContext:", v14);
          }
          else
          {
            v22 = (void *)MEMORY[0x1E0D8BA40];
            -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v22) = objc_msgSend(v22, "isDestinationTriggerCategory:", objc_msgSend(v23, "triggerCategory"));

            if ((_DWORD)v22)
            {
              -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionMonitor _promptDestinationAnomalyVerificationWithContext:](self, "_promptDestinationAnomalyVerificationWithContext:", v14);
            }
            else
            {
              v24 = (void *)MEMORY[0x1E0D8BA40];
              -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v24) = objc_msgSend(v24, "isDurationTriggerCategory:", objc_msgSend(v25, "triggerCategory"));

              if ((_DWORD)v24)
              {
                -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[SMSessionMonitor _promptTimerEndedVerificationWithContext:](self, "_promptTimerEndedVerificationWithContext:", v14);
              }
              else
              {
                v26 = (void *)MEMORY[0x1E0D8BA40];
                -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v26) = objc_msgSend(v26, "isWorkoutTriggerCategory:", objc_msgSend(v27, "triggerCategory"));

                if (!(_DWORD)v26)
                  goto LABEL_21;
                -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[SMSessionMonitor _promptWorkoutAnomalyVerificationWithContext:](self, "_promptWorkoutAnomalyVerificationWithContext:", v14);
              }
            }
          }
          break;
        }
        -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      default:
LABEL_21:
        self->_riskState = a3;
        return;
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    +[SMSessionMonitor riskStateToString:](SMSessionMonitor, "riskStateToString:", self->_riskState);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315394;
    v29 = "-[SMSessionMonitor setRiskState:]";
    v30 = 2112;
    v31 = v21;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%s, no change to current session monitor riskState, %@, proceeding to update user with context", (uint8_t *)&v28, 0x16u);

  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    goto LABEL_13;
}

+ (id)riskStateToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("SMSessionMonitorRiskStateUnknown");
  else
    return off_1E9299C78[a3 - 1];
}

- (id)_createTriggersWithConfiguration:(id)a3
{
  SMTriggerSOS *v4;
  void *v5;
  void *v6;
  SMTriggerSOS *v7;
  NSObject *v8;
  uint64_t v9;
  SMTriggerDuration *v10;
  void *v11;
  void *v12;
  void *v13;
  SMTriggerDestination *v14;
  NSObject *v15;
  const char *v16;
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
  NSObject *v34;
  void *v35;
  SMSessionWorkoutMonitor *v37;
  SMTriggerDestination *v38;
  void *v39;
  SMTriggerSOS *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v44 = (id)objc_opt_new();
  v4 = [SMTriggerSOS alloc];
  -[SMSessionMonitor queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor sessionStore](self, "sessionStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SMTriggerSOS initWithQueue:sessionStore:](v4, "initWithQueue:sessionStore:", v5, v6);

  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
      v47 = 1024;
      LODWORD(v48) = 338;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sosTrigger (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v44, "addObject:", v7);
  v9 = objc_msgSend(v43, "sessionType");
  if ((unint64_t)(v9 - 2) < 2)
  {
    v38 = [SMTriggerDestination alloc];
    -[SMSessionMonitor queue](self, "queue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor defaultsManager](self, "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor dataProtectionManager](self, "dataProtectionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor locationManager](self, "locationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor motionActivityManager](self, "motionActivityManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor distanceCalculator](self, "distanceCalculator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor platform](self, "platform");
    v40 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionStore](self, "sessionStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor timerManager](self, "timerManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionMetricManager](self, "sessionMetricManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SMTriggerDestination initWithQueue:defaultsManager:dataProtectionManager:locationManager:motionActivityManager:distanceCalculator:platform:sessionStore:timerManager:sessionMetricManager:](v38, "initWithQueue:defaultsManager:dataProtectionManager:locationManager:motionActivityManager:distanceCalculator:platform:sessionStore:timerManager:sessionMetricManager:", v41, v17, v18, v19, v20, v21, v22, v23, v24, v25);

    v7 = v40;
    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        v47 = 1024;
        LODWORD(v48) = 364;
        v16 = "Invalid parameter not satisfying: destinationTrigger (in %s:%d)";
        goto LABEL_22;
      }
LABEL_16:

      v14 = 0;
    }
  }
  else if (v9 == 4)
  {
    v37 = [SMSessionWorkoutMonitor alloc];
    -[SMSessionMonitor queue](self, "queue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor defaultsManager](self, "defaultsManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor distanceCalculator](self, "distanceCalculator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor locationManager](self, "locationManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor healthKitManager](self, "healthKitManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor platform](self, "platform");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionMetricManager](self, "sessionMetricManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionStore](self, "sessionStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor timerManager](self, "timerManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor noMovementMonitor](self, "noMovementMonitor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SMSessionWorkoutMonitor initWithQueue:defaultsManager:distanceCalculator:locationManager:healthKitManager:platform:sessionMetricManager:sessionStore:timerManager:noMovementMonitor:](v37, "initWithQueue:defaultsManager:distanceCalculator:locationManager:healthKitManager:platform:sessionMetricManager:sessionStore:timerManager:noMovementMonitor:", v42, v39, v26, v27, v28, v29, v30, v31, v32, v33);

    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        v47 = 1024;
        LODWORD(v48) = 380;
        v16 = "Invalid parameter not satisfying: workoutMonitor (in %s:%d)";
        goto LABEL_22;
      }
      goto LABEL_16;
    }
  }
  else
  {
    if (v9 != 1)
      goto LABEL_18;
    v10 = [SMTriggerDuration alloc];
    -[SMSessionMonitor queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor defaultsManager](self, "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionStore](self, "sessionStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SMTriggerDuration initWithQueue:defaultsManager:sessionStore:](v10, "initWithQueue:defaultsManager:sessionStore:", v11, v12, v13);

    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        v47 = 1024;
        LODWORD(v48) = 347;
        v16 = "Invalid parameter not satisfying: durationTrigger (in %s:%d)";
LABEL_22:
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  objc_msgSend(v44, "addObject:", v14);

LABEL_18:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8B9F0], "sessionTypeToString:", objc_msgSend(v43, "sessionType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
    v47 = 2112;
    v48 = v35;
    v49 = 2112;
    v50 = v44;
    _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%s, type, %@, triggers, %@", buf, 0x20u);

  }
  return v44;
}

- (void)_processTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  SMSessionMonitor *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SMSessionMonitor _processTriggerNotification:]";
      v17 = 1024;
      LODWORD(v18) = 409;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
  v6 = objc_alloc(MEMORY[0x1E0D8BA40]);
  v7 = objc_msgSend(v4, "triggerCategory");
  -[SMSessionMonitor configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithUpdateReason:triggerCategory:sessionID:", 1, v7, v9);

  -[SMSessionMonitor setMostRecentTriggerContext:](self, "setMostRecentTriggerContext:", v10);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "-[SMSessionMonitor _processTriggerNotification:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, processing trigger notification, %@", (uint8_t *)&v15, 0x16u);
  }

  if (objc_msgSend(v4, "SOSState") == 2)
  {
    v12 = self;
    v13 = 3;
  }
  else
  {
    if (objc_msgSend(v4, "SOSState") != 1)
    {
      -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionMonitor _updateUserWithTriggerContext:](self, "_updateUserWithTriggerContext:", v14);

      goto LABEL_13;
    }
    v12 = self;
    v13 = 2;
  }
  -[SMSessionMonitor setRiskState:](v12, "setRiskState:", v13);
LABEL_13:

}

- (void)_processTriggerEstimatedEndDateUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SMSessionMonitor _processTriggerEstimatedEndDateUpdateNotification:]";
      v17 = 1024;
      LODWORD(v18) = 432;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: triggerEndDateUpdateNotification (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
  v6 = objc_alloc(MEMORY[0x1E0D8BA40]);
  v7 = objc_msgSend(v4, "triggerCategory");
  objc_msgSend(v4, "estimatedEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coarseEstimatedEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:", 5, v7, v8, v9, v11);

  -[SMSessionMonitor setMostRecentTriggerContext:](self, "setMostRecentTriggerContext:", v12);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "-[SMSessionMonitor _processTriggerEstimatedEndDateUpdateNotification:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, processing trigger notification, %@", (uint8_t *)&v15, 0x16u);
  }

  -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor _promptEstimatedEndDateUpdateWithContext:](self, "_promptEstimatedEndDateUpdateWithContext:", v14);

}

- (void)_processUserTriggerResponse:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTriggerConfirmed:", 0);
    v6 = 1;
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      goto LABEL_6;
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTriggerConfirmed:", 1);
    v6 = 3;
  }

  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTriggerPending:", 0);

  -[SMSessionMonitor setRiskState:](self, "setRiskState:", v6);
LABEL_6:
  -[SMSessionMonitor _persistState](self, "_persistState");
  -[SMSessionMonitor _updateTriggersWithUserResponse:](self, "_updateTriggersWithUserResponse:", a3);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8BA40], "userTriggerResponseToString:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SMSessionMonitor _processUserTriggerResponse:]";
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, passing response, %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_processSessionEnd
{
  void *v3;
  uint64_t v4;

  -[SMSessionMonitor _reset](self, "_reset");
  -[SMSessionMonitor locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v3, "stopMonitoringAllRegionsForClientIdentifier:error:", CFSTR("SMDestinationRegionClientIdentifier"), &v4);

  -[SMSessionMonitor _unregisterForTriggers](self, "_unregisterForTriggers");
  -[SMSessionMonitor _shutdownWithHandler:](self, "_shutdownWithHandler:", &__block_literal_global_19);
}

void __38__SMSessionMonitor__processSessionEnd__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionMonitor _processSessionEnd]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, session ended, shutting down safety monitor, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_processSessionResumeWithState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  SMSessionMonitor *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 487;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state (in %s:%d)", v16, 0x12u);
    }

  }
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor _initializeSessionWithConfiguration:](self, "_initializeSessionWithConfiguration:", v6);

  objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v4, "sessionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "sessionState"))
  {
    case 0:
      -[SMSessionMonitor setRiskState:](self, "setRiskState:", 0);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_18;
      goto LABEL_17;
    case 1:
    case 12:
      -[SMSessionMonitor setRiskState:](self, "setRiskState:", 0);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      goto LABEL_10;
    case 2:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v7;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }

      v11 = self;
      v12 = 1;
      goto LABEL_28;
    case 4:
      -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTriggerConfirmed:", 1);

      -[SMSessionMonitor setRiskState:](self, "setRiskState:", 3);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_17:
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v7;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_18:

      goto LABEL_29;
    case 7:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_26;
      goto LABEL_27;
    case 8:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_26;
      goto LABEL_27;
    case 9:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_26;
      goto LABEL_27;
    case 10:
    case 11:
      -[SMSessionMonitor setRiskState:](self, "setRiskState:", 0);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v7;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_10:

      goto LABEL_30;
    case 14:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_26:
        *(_DWORD *)v16 = 136315394;
        *(_QWORD *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v7;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_27:

      -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTriggerPending:", 1);

      v11 = self;
      v12 = 2;
LABEL_28:
      -[SMSessionMonitor setRiskState:](v11, "setRiskState:", v12, *(_QWORD *)v16, *(_OWORD *)&v16[8], v17);
      goto LABEL_29;
    default:
LABEL_29:
      -[SMSessionMonitor _persistState](self, "_persistState", *(_OWORD *)v16, *(_QWORD *)&v16[16]);
LABEL_30:

      return;
  }
}

- (void)_registerForTriggersWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionMonitor _unregisterForTriggers](self, "_unregisterForTriggers");
  -[SMSessionMonitor _createTriggersWithConfiguration:](self, "_createTriggersWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitor setTriggers:](self, "setTriggers:", v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SMSessionMonitor triggers](self, "triggers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "setSessionMonitorDelegate:", self);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __58__SMSessionMonitor__registerForTriggersWithConfiguration___block_invoke;
          v12[3] = &unk_1E9297150;
          v12[4] = v11;
          objc_msgSend(v11, "startMonitoringWithConfiguration:handler:", v4, v12);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __58__SMSessionMonitor__registerForTriggersWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[SMSessionMonitor _registerForTriggersWithConfiguration:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%s, register for trigger, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)_unregisterForTriggers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SMSessionMonitor triggers](self, "triggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "setSessionMonitorDelegate:", 0);
          v10[0] = v6;
          v10[1] = 3221225472;
          v10[2] = __42__SMSessionMonitor__unregisterForTriggers__block_invoke;
          v10[3] = &unk_1E9297150;
          v10[4] = v8;
          objc_msgSend(v8, "stopMonitoringWithHandler:", v10);
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  -[SMSessionMonitor setTriggers:](self, "setTriggers:", 0);
}

void __42__SMSessionMonitor__unregisterForTriggers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[SMSessionMonitor _unregisterForTriggers]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%s, unregister for trigger, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)_updateGeofenceWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
      v24 = 1024;
      LODWORD(v25) = 598;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v4, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSessionMonitor configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clLocation");
    v10 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, current configuration destination, %@, updated configuration destination, %@", buf, 0x20u);
    }

    if (v10 && (-[NSObject distanceFromLocation:](v10, "distanceFromLocation:", v7), v12 < 10.0))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, current configuration destination matches updated configuration destination, exiting geofence update", buf, 0xCu);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, proceed to update destination geofence", buf, 0xCu);
      }

      -[SMSessionMonitor locationManager](self, "locationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v15, "stopMonitoringAllRegionsForClientIdentifier:error:", CFSTR("SMDestinationRegionClientIdentifier"), &v21);
      v13 = v21;

      if (v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
          v24 = 2112;
          v25 = v13;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%s, Error stopping monitoring for regions, %@", buf, 0x16u);
        }

      }
      objc_msgSend(v4, "destination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "radius");
      v19 = v18;

      if (v19 <= 0.0)
      {
        v19 = *MEMORY[0x1E0D8BC40];
      }
      else if (v19 < *MEMORY[0x1E0D8BC50])
      {
        v19 = *MEMORY[0x1E0D8BC50];
      }
      objc_msgSend(v4, "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:](self, "_setupGeofenceWithLocation:regionIdentifier:radius:destinationType:", v7, CFSTR("SMDestinationRegionIdentifier"), objc_msgSend(v20, "destinationType"), v19);

    }
  }

}

- (void)_initializeSessionWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  _BYTE v10[24];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v10 = 136315394;
      *(_QWORD *)&v10[4] = "-[SMSessionMonitor _initializeSessionWithConfiguration:]";
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = 642;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", v10, 0x12u);
    }

  }
  -[SMSessionMonitor _addObservers](self, "_addObservers");
  -[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:](self, "_registerForCircularRegionEventsForIdentifier:", CFSTR("SMDestinationRegionClientIdentifier"));
  -[SMSessionMonitor _registerForTriggersWithConfiguration:](self, "_registerForTriggersWithConfiguration:", v4);
  -[SMSessionMonitor locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMonitoringForRegionWithClientIdentifier:regionIdentifier:", CFSTR("SMDestinationRegionClientIdentifier"), CFSTR("SMDestinationRegionIdentifier"));

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)&v10[4] = "-[SMSessionMonitor _initializeSessionWithConfiguration:]";
    *(_WORD *)&v10[12] = 2112;
    *(_QWORD *)&v10[14] = v4;
    if (v7)
      v9 = CFSTR("YES");
    *(_WORD *)&v10[22] = 2112;
    v11 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, configuration, %@, monitoringForConfiguration, %@", v10, 0x20u);
  }

  if ((v7 & 1) == 0)
    -[SMSessionMonitor _updateGeofenceWithConfiguration:](self, "_updateGeofenceWithConfiguration:", v4);
  -[SMSessionMonitor setConfiguration:](self, "setConfiguration:", v4, *(_OWORD *)v10, *(_QWORD *)&v10[16]);
  -[SMSessionMonitor _bootstrap](self, "_bootstrap");

}

- (void)_initializeTriggersForRemoteSessionIfNecessary
{
  void *v3;
  uint64_t v4;

  -[SMSessionMonitor triggers](self, "triggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[SMSessionMonitor _registerForTriggersWithConfiguration:](self, "_registerForTriggersWithConfiguration:", 0);
}

- (void)_addObservers
{
  void *v3;
  id v4;

  -[SMSessionMonitor locationManager](self, "locationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_onLocationNotification_, v3);

}

- (void)_removeObservers
{
  id v3;

  -[SMSessionMonitor locationManager](self, "locationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_persistState
{
  void *v3;
  int v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
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
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE buf[12];
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dirty");

  if (v4)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__24;
    v38 = __Block_byref_object_dispose__24;
    v39 = 0;
    v5 = dispatch_semaphore_create(0);
    -[SMSessionMonitor sessionStore](self, "sessionStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __33__SMSessionMonitor__persistState__block_invoke;
    v31[3] = &unk_1E9297038;
    v33 = &v34;
    v9 = v5;
    v32 = v9;
    objc_msgSend(v6, "storeSessionMonitorStates:handler:", v8, v31);

    v10 = (id *)(v35 + 5);
    v11 = (id)v35[5];
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceDate:", v13);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_372);
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
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v46[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v46, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v11 = objc_retainAutorelease(v25);

      }
    }

    objc_storeStrong(v10, v11);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v35[5];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SMSessionMonitor _persistState]";
      v41 = 2112;
      v42 = v27;
      v43 = 2112;
      v44 = v28;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, persisted state, %@, error, %@", buf, 0x20u);

    }
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDirty:", 0);

    _Block_object_dispose(&v34, 8);
  }
}

void __33__SMSessionMonitor__persistState__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)onBecomingActiveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SMSessionMonitor_onBecomingActiveDevice___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __43__SMSessionMonitor_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBecomingActiveDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_onBecomingActiveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SMSessionMonitor _onBecomingActiveDevice:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, state, %@, initiating actions to become an active device", (uint8_t *)&v6, 0x16u);
  }

  -[SMSessionMonitor onSessionResumedWithState:forActiveDevice:](self, "onSessionResumedWithState:forActiveDevice:", v4, 1);
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SMSessionMonitor_onBecomingNonActiveDevice___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__SMSessionMonitor_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBecomingNonActiveDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_onBecomingNonActiveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SMSessionMonitor _onBecomingNonActiveDevice:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, state, %@, initiating actions to become a non active device", buf, 0x16u);
  }

  -[SMSessionMonitor locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v6, "stopMonitoringAllRegionsForClientIdentifier:error:", CFSTR("SMDestinationRegionClientIdentifier"), &v7);

  -[SMSessionMonitor _unregisterForTriggers](self, "_unregisterForTriggers");
  -[SMSessionMonitor _reset](self, "_reset");
  -[SMSessionMonitor _initializeTriggersForRemoteSessionIfNecessary](self, "_initializeTriggersForRemoteSessionIfNecessary");

}

- (void)onSessionStartedWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionMonitor *v9;

  v4 = a3;
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SMSessionMonitor_onSessionStartedWithConfiguration___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__SMSessionMonitor_onSessionStartedWithConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SMSessionMonitor onSessionStartedWithConfiguration:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%s, configuration, %@", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_initializeSessionWithConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)onSessionChangedWithConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  SMSessionMonitor *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__SMSessionMonitor_onSessionChangedWithConfiguration___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[SMSessionMonitor queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

uint64_t __54__SMSessionMonitor_onSessionChangedWithConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SMSessionMonitor onSessionChangedWithConfiguration:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, configuration, %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_reset");
  objc_msgSend(*(id *)(a1 + 40), "_updateTriggersWithConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_updateGeofenceWithConfiguration:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "setConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  SMSessionMonitor *v12;
  BOOL v13;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SMSessionMonitor_onSessionResumedWithState_forActiveDevice___block_invoke;
  v10[3] = &unk_1E9297D30;
  v13 = a4;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = (void *)MEMORY[0x1D8232094](v10);
  -[SMSessionMonitor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, v8);

}

void __62__SMSessionMonitor_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActiveState") & 1) != 0)
  {
    v2 = *(unsigned __int8 *)(a1 + 48);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 32);
        v11 = 136315394;
        v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, state, %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_processSessionResumeWithState:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v4)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(unsigned __int8 *)(a1 + 48);
        v11 = 136315650;
        v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
        v13 = 2112;
        v14 = v9;
        v15 = 1024;
        v16 = v10;
        _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, state, %@ only initialize triggers for remote session since active device %d", (uint8_t *)&v11, 0x1Cu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_initializeTriggersForRemoteSessionIfNecessary");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(unsigned __int8 *)(a1 + 48);
      v11 = 136315650;
      v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
      v13 = 2112;
      v14 = v7;
      v15 = 1024;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, not initializing monitor for inactive state, %@, activeDevice, %d", (uint8_t *)&v11, 0x1Cu);
    }

  }
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SMSessionMonitor_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E92977B8;
  v6[4] = self;
  v4 = (void *)MEMORY[0x1D8232094](v6, a2, a3);
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

uint64_t __50__SMSessionMonitor_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SMSessionMonitor onSessionEndedForActiveDevice:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_removeObservers");
  return objc_msgSend(*(id *)(a1 + 32), "_processSessionEnd");
}

- (void)onUserTriggerResponse:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SMSessionMonitor_onUserTriggerResponse___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  v4 = (void *)MEMORY[0x1D8232094](v6, a2);
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

uint64_t __42__SMSessionMonitor_onUserTriggerResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SMSessionMonitor onUserTriggerResponse:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_processUserTriggerResponse:", *(_QWORD *)(a1 + 40));
}

- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SMSessionMonitor_onRemoteEmergencyContactsNotified___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  v4 = (void *)MEMORY[0x1D8232094](v6, a2);
  -[SMSessionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

void __54__SMSessionMonitor_onRemoteEmergencyContactsNotified___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionMonitor onRemoteEmergencyContactsNotified:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "triggers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "onRemoteEmergencyContactsNotified:", *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)onWorkoutPause
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SMSessionMonitor_onWorkoutPause__block_invoke;
  v5[3] = &unk_1E92977B8;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1D8232094](v5, a2);
  -[SMSessionMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v3);

}

void __34__SMSessionMonitor_onWorkoutPause__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionMonitor onWorkoutPause]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "triggers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "onWorkoutTriggerControlUpdate:", 1);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)onWorkoutResume
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SMSessionMonitor_onWorkoutResume__block_invoke;
  v5[3] = &unk_1E92977B8;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1D8232094](v5, a2);
  -[SMSessionMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v3);

}

void __35__SMSessionMonitor_onWorkoutResume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionMonitor onWorkoutResume]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "triggers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "onWorkoutTriggerControlUpdate:", 2);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_promptEstimatedEndDateUpdateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[SMSessionMonitor _promptEstimatedEndDateUpdateWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptEstimatedEndDateUpdateWithContext:", v4);

}

- (void)_promptTimerEndedVerificationWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerPending:", 1);

  -[SMSessionMonitor _persistState](self, "_persistState");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315394;
    v9 = "-[SMSessionMonitor _promptTimerEndedVerificationWithContext:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promptTimerEndedVerificationWithContext:", v4);

}

- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerPending:", 1);

  -[SMSessionMonitor _persistState](self, "_persistState");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315394;
    v9 = "-[SMSessionMonitor _promptDestinationAnomalyVerificationWithContext:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promptDestinationAnomalyVerificationWithContext:", v4);

}

- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerPending:", 1);

  -[SMSessionMonitor _persistState](self, "_persistState");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315394;
    v9 = "-[SMSessionMonitor _promptRoundTripAnomalyVerificationWithContext:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promptRoundTripAnomalyVerificationWithContext:", v4);

}

- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[SMSessionMonitor _promptWorkoutAnomalyVerificationWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptWorkoutAnomalyVerificationWithContext:", v4);

}

- (void)_promptDirectTriggerWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[SMSessionMonitor _promptDirectTriggerWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptDirectTriggerWithContext:", v4);

}

- (void)_promptSafeArrivalWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMSessionMonitor _promptSafeArrivalWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, context, %@", (uint8_t *)&v7, 0x16u);
  }

  -[SMSessionMonitor _processSessionEnd](self, "_processSessionEnd");
  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptSafeArrivalWithContext:", v4);

}

- (void)_updateUserWithTriggerContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[SMSessionMonitor _updateUserWithTriggerContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  -[SMSessionMonitor sessionManagerDelegate](self, "sessionManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateUserWithTriggerContext:", v4);

}

- (void)onTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  SMSessionMonitor *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SMSessionMonitor onTriggerNotification:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, notification, %@", buf, 0x16u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __42__SMSessionMonitor_onTriggerNotification___block_invoke;
  v12 = &unk_1E9297540;
  v13 = v4;
  v14 = self;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D8232094](&v9);
  -[SMSessionMonitor queue](self, "queue", v9, v10, v11, v12);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v7);

}

void __42__SMSessionMonitor_onTriggerNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMTriggerNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_processTriggerNotification:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](SMTriggerEstimatedEndDateUpdateNotification, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_processTriggerEstimatedEndDateUpdateNotification:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 136315394;
        v11 = "-[SMSessionMonitor onTriggerNotification:]_block_invoke";
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, notification not supported, %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }
}

- (void)_updateTriggersWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SMSessionMonitor triggers](self, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v17 = "-[SMSessionMonitor _updateTriggersWithConfiguration:]";
            v18 = 2112;
            v19 = v10;
            _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, registering trigger, %@", buf, 0x16u);
          }

          objc_msgSend(v10, "modifyMonitoringWithConfiguration:handler:", v4, &__block_literal_global_133);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v7);
  }

}

void __53__SMSessionMonitor__updateTriggersWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[SMSessionMonitor _updateTriggersWithConfiguration:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%s, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_updateTriggersWithUserResponse:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SMSessionMonitor triggers](self, "triggers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "onUserTriggerResponse:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setupGeofenceWithLocation:(id)a3 regionIdentifier:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  Class *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    v29 = 1024;
    LODWORD(v30) = 1012;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
      v29 = 1024;
      LODWORD(v30) = 1013;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: regionIdentifier (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8BA00], "destinationTypeToString:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v12;
    v33 = 2048;
    v34 = a5;
    v35 = 2112;
    v36 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, regionLocation, %@, regionIdentifier, %@, radius, %.3f, destinationType, %@", buf, 0x34u);

  }
  objc_msgSend(v10, "coordinate");
  v18 = v17;
  objc_msgSend(v10, "coordinate");
  v20 = (Class *)0x1E0C9E460;
  if (a6 != 1)
    v20 = (Class *)0x1E0C9E368;
  v21 = (void *)objc_msgSend(objc_alloc(*v20), "initWithCenter:radius:identifier:", v12, v18, v19, a5);
  objc_msgSend(v21, "setGeoReferenceFrame:", objc_msgSend(v10, "referenceFrame"));
  -[SMSessionMonitor locationManager](self, "locationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v22, "startMonitoringForRegion:clientIdentifier:error:", v21, CFSTR("SMDestinationRegionClientIdentifier"), &v26);
  v23 = v26;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, registered geofence for region, %@", buf, 0x16u);
  }

  if (v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
      v29 = 2112;
      v30 = v23;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%s, error setting up fence for safety buddy trip notifier, %@", buf, 0x16u);
    }

  }
}

- (void)_registerForCircularRegionEventsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Registering for circular region events with identifier, %@", buf, 0x16u);
  }

  -[SMSessionMonitor locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SMSessionMonitor__registerForCircularRegionEventsForIdentifier___block_invoke;
  v8[3] = &unk_1E9299C10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "registerForRegionEventsWithClientIdentifier:handler:", v7, v8);

}

void __66__SMSessionMonitor__registerForCircularRegionEventsForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SMDestinationRegionIdentifier"));

  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v8;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, received region monitoring event for unsupported region identifier, %@, regionCallbackType, %@, error, %@", (uint8_t *)&v19, 0x2Au);

      goto LABEL_18;
    }
LABEL_7:

    goto LABEL_10;
  }
  if (a3 == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v8;
      v13 = "%s, regionMonitoring failure, %@, error, %@";
      goto LABEL_20;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (a3 == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v8;
      v13 = "%s, regionMonitoring client registration failure, %@, error, %@";
LABEL_20:
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  v14 = v15;
  if (v8)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v8;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, regionMonitoring %@, error, %@", (uint8_t *)&v19, 0x20u);
LABEL_18:

      goto LABEL_7;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315650;
    v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%s, regionMonitoring success %@, error, %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "handleCircularRegionCallback:region:clientIdentifier:", a3, v7, *(_QWORD *)(a1 + 40));
LABEL_10:

}

- (void)_unregisterForCircularRegionEventsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Unregistering for circular region events with identifier, %@", buf, 0x16u);
  }

  -[SMSessionMonitor locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SMSessionMonitor__unregisterForCircularRegionEventsForIdentifier___block_invoke;
  v8[3] = &unk_1E9297150;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "unregisterForRegionEventsWithClientIdentifier:handler:", v7, v8);

}

void __68__SMSessionMonitor__unregisterForCircularRegionEventsForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%s, regionMonitoring client unregistration failed with error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 136315650;
    v8 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, unregistered for region event with client identifier, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
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
  -[SMSessionMonitor queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__SMSessionMonitor_handleCircularRegionCallback_region_clientIdentifier___block_invoke;
  v13[3] = &unk_1E9298238;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __73__SMSessionMonitor_handleCircularRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCircularRegionCallback:region:clientIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = v9;
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
    v16 = 136315394;
    v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
    v18 = 1024;
    LODWORD(v19) = 1150;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region (in %s:%d)", (uint8_t *)&v16, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
      v18 = 1024;
      LODWORD(v19) = 1151;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

  }
LABEL_10:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, Received event, %@, region, %@, clientIdentifier, %@", (uint8_t *)&v16, 0x2Au);

  }
  if (v10 == CFSTR("SMDestinationRegionClientIdentifier"))
  {
    if ((unint64_t)(a3 - 1) <= 1)
      -[SMSessionMonitor _updateRegionStateWithCircularRegionCallback:](self, "_updateRegionStateWithCircularRegionCallback:", a3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315394;
      v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
      v18 = 2112;
      v19 = CFSTR("SMDestinationRegionClientIdentifier");
      _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%s, unrecognized clientIdentifier, %@", (uint8_t *)&v16, 0x16u);
    }

  }
}

- (void)_updateRegionStateWithCircularRegionCallback:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor currentLocation](self, "currentLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionMonitor configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "distanceFromLocation:", v10);
    v16 = 136315650;
    v17 = "-[SMSessionMonitor _updateRegionStateWithCircularRegionCallback:]";
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = v11;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, distance to destination, %.3f", (uint8_t *)&v16, 0x20u);

  }
  -[SMSessionMonitor configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sessionType");

  if (v13 == 2)
  {
    -[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:](self, "_updateDestinationBoundRegionStateWithCircularRegionCallback:", a3);
  }
  else
  {
    -[SMSessionMonitor configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sessionType");

    if (v15 == 3)
      -[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:](self, "_updateRoundTripRegionStateWithCircularRegionCallback:", a3);
  }
}

- (void)_updateDestinationBoundRegionStateWithCircularRegionCallback:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  RTXPCTimerAlarm *v14;
  void *v15;
  id v16;
  RTXPCTimerAlarm *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D8BA48];
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regionStateToString:", objc_msgSend(v8, "currentRegionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v28 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]";
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, currentRegionState, %@", buf, 0x20u);

  }
  if (a3 == 2)
  {
    -[SMSessionMonitor _onRegionExit](self, "_onRegionExit");
  }
  else
  {
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentRegionState");

    if (a3 == 1 && v11 <= 1)
    {
      -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCurrentRegionState:", 2);

      -[SMSessionMonitor _persistState](self, "_persistState");
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [RTXPCTimerAlarm alloc];
      -[SMSessionMonitor queue](self, "queue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __81__SMSessionMonitor__updateDestinationBoundRegionStateWithCircularRegionCallback___block_invoke;
      v23[3] = &unk_1E9299C38;
      v16 = v13;
      v24 = v16;
      objc_copyWeak(&v25, &location);
      v17 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v14, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.SMSessionMonitor.insidePendingTimer"), v15, v23);
      -[SMSessionMonitor setRegionInsidePendingTimer:](self, "setRegionInsidePendingTimer:", v17);

      -[SMSessionMonitor regionInsidePendingTimer](self, "regionInsidePendingTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionMonitor sessionMonitorRegionInsidePendingTimerDelay](self, "sessionMonitorRegionInsidePendingTimerDelay");
      objc_msgSend(v16, "dateByAddingTimeInterval:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v18, "fireWithDate:error:", v19, &v22);
      v20 = v22;

      if (v20)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]";
          v29 = 2112;
          v30 = v20;
          _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
        }

      }
      objc_destroyWeak(&v25);

      objc_destroyWeak(&location);
    }
  }
}

void __81__SMSessionMonitor__updateDestinationBoundRegionStateWithCircularRegionCallback___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 136315650;
    v7 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("com.apple.routined.SMSessionMonitor.insidePendingTimer");
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v6, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onRegionInsidePendingTimerExpiry");

}

- (void)_updateRoundTripRegionStateWithCircularRegionCallback:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  RTXPCTimerAlarm *v14;
  void *v15;
  id v16;
  RTXPCTimerAlarm *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D8BA48];
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regionStateToString:", objc_msgSend(v8, "currentRegionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, currentRegionState, %@", buf, 0x20u);

  }
  if (a3 == 2)
  {
    -[SMSessionMonitor _onRegionExit](self, "_onRegionExit");
  }
  else
  {
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentRegionState");

    if ((unint64_t)(v11 - 2) >= 2 && v11)
    {
      if (v11 == 1)
      {
        if (a3 == 1)
        {
          -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCurrentRegionState:", 2);

          -[SMSessionMonitor _persistState](self, "_persistState");
          objc_initWeak(&location, self);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = [RTXPCTimerAlarm alloc];
          -[SMSessionMonitor queue](self, "queue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __74__SMSessionMonitor__updateRoundTripRegionStateWithCircularRegionCallback___block_invoke;
          v24[3] = &unk_1E9299C38;
          v16 = v13;
          v25 = v16;
          objc_copyWeak(&v26, &location);
          v17 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v14, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.SMSessionMonitor.insidePendingTimer"), v15, v24);
          -[SMSessionMonitor setRegionInsidePendingTimer:](self, "setRegionInsidePendingTimer:", v17);

          -[SMSessionMonitor regionInsidePendingTimer](self, "regionInsidePendingTimer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionMonitor sessionMonitorRegionInsidePendingTimerDelay](self, "sessionMonitorRegionInsidePendingTimerDelay");
          objc_msgSend(v16, "dateByAddingTimeInterval:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          objc_msgSend(v18, "fireWithDate:error:", v19, &v23);
          v20 = v23;

          if (v20)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
              v30 = 2112;
              v31 = v20;
              _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
            }

          }
          objc_destroyWeak(&v26);

          objc_destroyWeak(&location);
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
          _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%s, Invalid region state", buf, 0xCu);
        }

      }
    }
  }
}

void __74__SMSessionMonitor__updateRoundTripRegionStateWithCircularRegionCallback___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 136315650;
    v7 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("com.apple.routined.SMSessionMonitor.insidePendingTimer");
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v6, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onRegionInsidePendingTimerExpiry");

}

- (void)_onRegionInsidePendingTimerExpiry
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0D8BA48];
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionStateToString:", objc_msgSend(v5, "currentRegionState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[SMSessionMonitor _onRegionInsidePendingTimerExpiry]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, currentRegionState, %@", (uint8_t *)&v17, 0x16u);

  }
  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "currentRegionState");

  if (v8 == (void *)2)
  {
    -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentRegionState:", 3);

    -[SMSessionMonitor _persistState](self, "_persistState");
    v10 = objc_alloc(MEMORY[0x1E0D8BA40]);
    -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SMSessionMonitor mostRecentTriggerContext](self, "mostRecentTriggerContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "triggerCategory");
    }
    else
    {
      v12 = 0;
    }
    -[SMSessionMonitor configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithUpdateReason:triggerCategory:sessionID:", 4, v12, v14);

    if (v11)
    -[SMSessionMonitor setMostRecentTriggerContext:](self, "setMostRecentTriggerContext:", v15);
    -[SMSessionMonitor setRiskState:](self, "setRiskState:", 4);

  }
  -[SMSessionMonitor regionInsidePendingTimer](self, "regionInsidePendingTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidate");

  -[SMSessionMonitor setRegionInsidePendingTimer:](self, "setRegionInsidePendingTimer:", 0);
}

- (void)_onRegionExit
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SMSessionMonitor _onRegionExit]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Received region exit event", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionMonitor sessionMonitorState](self, "sessionMonitorState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentRegionState:", 1);

  -[SMSessionMonitor _persistState](self, "_persistState");
  -[SMSessionMonitor regionInsidePendingTimer](self, "regionInsidePendingTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SMSessionMonitor setRegionInsidePendingTimer:](self, "setRegionInsidePendingTimer:", 0);
}

- (void)onLocationNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  SMSessionMonitor *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__SMSessionMonitor_onLocationNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[SMSessionMonitor queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __43__SMSessionMonitor_onLocationNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "leechedLocations");
    v2 = objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSObject reverseObjectEnumerator](v2, "reverseObjectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if (+[SMTriggerDestination validLocation:](SMTriggerDestination, "validLocation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)))
          {
            -[NSObject lastObject](v2, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setCurrentLocation:", v8);

            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }
  }

}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
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

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionMetricManager, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_wristStateManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SMSessionManagerMonitorProtocol)sessionManagerDelegate
{
  return (SMSessionManagerMonitorProtocol *)objc_loadWeakRetained((id *)&self->_sessionManagerDelegate);
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_noMovementMonitor, a3);
}

- (unint64_t)riskState
{
  return self->_riskState;
}

- (SMSessionMonitorContext)mostRecentTriggerContext
{
  return self->_mostRecentTriggerContext;
}

- (void)setMostRecentTriggerContext:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentTriggerContext, a3);
}

- (RTTimer)pendingSafeArrivalTimer
{
  return self->_pendingSafeArrivalTimer;
}

- (void)setPendingSafeArrivalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSafeArrivalTimer, a3);
}

- (NSSet)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (SMSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (RTXPCTimerAlarm)regionInsidePendingTimer
{
  return self->_regionInsidePendingTimer;
}

- (void)setRegionInsidePendingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_regionInsidePendingTimer, a3);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (SMSessionMonitorState)sessionMonitorState
{
  return self->_sessionMonitorState;
}

- (void)setSessionMonitorState:(id)a3
{
  objc_storeStrong((id *)&self->_sessionMonitorState, a3);
}

- (double)sessionMonitorRegionInsidePendingTimerDelay
{
  return self->_sessionMonitorRegionInsidePendingTimerDelay;
}

- (void)setSessionMonitorRegionInsidePendingTimerDelay:(double)a3
{
  self->_sessionMonitorRegionInsidePendingTimerDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionMonitorState, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_regionInsidePendingTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_pendingSafeArrivalTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentTriggerContext, 0);
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_destroyWeak((id *)&self->_sessionManagerDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end
