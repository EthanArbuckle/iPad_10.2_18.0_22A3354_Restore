@implementation RTLocationAwarenessMetricManager

- (RTLocationAwarenessMetricManager)initWithLocationManager:(id)a3 motionManager:(id)a4 learnedLocationStore:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTLocationAwarenessMetricManager *v18;
  RTLocationAwarenessMetricManager *v19;
  uint64_t v20;
  RTDistanceCalculator *distanceCalculator;
  RTLocationAwarenessMetricManager *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v27;
  id v28;
  objc_super v29;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v23 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: locationManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v23 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: motionManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v23 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v16)
  {
    v23 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: startDate";
      goto LABEL_17;
    }
LABEL_18:

    v22 = 0;
    goto LABEL_19;
  }
  v28 = v17;
  if (v17)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTLocationAwarenessMetricManager;
    v18 = -[RTLocationAwarenessMetricManager init](&v29, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_locationManager, a3);
      objc_storeStrong((id *)&v19->_motionManager, a4);
      objc_storeStrong((id *)&v19->_learnedLocationStore, a5);
      objc_storeStrong((id *)&v19->_startDate, a6);
      objc_storeStrong((id *)&v19->_endDate, a7);
      v20 = objc_opt_new();
      distanceCalculator = v19->_distanceCalculator;
      v19->_distanceCalculator = (RTDistanceCalculator *)v20;

      -[RTLocationAwarenessMetricManager setup](v19, "setup");
    }
    self = v19;
    v22 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    v22 = 0;
  }
  v23 = v28;
LABEL_19:

  return v22;
}

- (void)setup
{
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
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  RTMotionActivityManager *motionManager;
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
  char v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE buf[12];
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  -[RTLocationAwarenessMetricManager createSignalEnvironmentDictionary](self, "createSignalEnvironmentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateSignalEnvironmentDwell:](self, "setBoutStateSignalEnvironmentDwell:", v4);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionDwell:](self, "setBoutStateMotionDwell:", v5);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionLongestDwell:](self, "setBoutStateMotionLongestDwell:", v6);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionTypeNumBouts:](self, "setBoutStateMotionTypeNumBouts:", v7);

  -[RTLocationAwarenessMetricManager setBoutStateMotion:](self, "setBoutStateMotion:", 0);
  -[RTLocationAwarenessMetricManager setBoutStateWifi:](self, "setBoutStateWifi:", 0);
  -[RTLocationAwarenessMetricManager setBoutMetricType:](self, "setBoutMetricType:", 0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumWifiLocationsInBout:](self, "setBoutMetricNumWifiLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumGPSLocationsInBout:](self, "setBoutMetricNumGPSLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumOtherLocationsInBout:](self, "setBoutMetricNumOtherLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v9);

  -[RTLocationAwarenessMetricManager setBoutMetricDistanceToSensitiveLocation:](self, "setBoutMetricDistanceToSensitiveLocation:", -1.0);
  -[RTLocationAwarenessMetricManager setBoutBufferDistanceToSensitiveLocation:](self, "setBoutBufferDistanceToSensitiveLocation:", -1.0);
  -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeDwell:](self, "setBoutBufferMotionEdgeDwell:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeType:](self, "setBoutBufferMotionEdgeType:", 0);
  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionDwell:](self, "setBoutBufferMotionDwell:", v10);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionLongestDwell:](self, "setBoutBufferMotionLongestDwell:", v11);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionBoutCounts:](self, "setBoutBufferMotionBoutCounts:", v12);

  -[RTLocationAwarenessMetricManager createSignalEnvironmentDictionary](self, "createSignalEnvironmentDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferSignalEnvironmentDwell:](self, "setBoutBufferSignalEnvironmentDwell:", v13);

  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumGPSLocationsInBout:](self, "setBoutBufferNumGPSLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumOtherLocationsInBout:](self, "setBoutBufferNumOtherLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager createSignalEnvironmentDictionary](self, "createSignalEnvironmentDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setDailyStateSignalEnvironmentDwell:](self, "setDailyStateSignalEnvironmentDwell:", v14);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setDailyStateMotionDwell:](self, "setDailyStateMotionDwell:", v15);

  -[RTLocationAwarenessMetricManager createBoutDictionary](self, "createBoutDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setDailyStateBoutCounts:](self, "setDailyStateBoutCounts:", v16);

  -[RTLocationAwarenessMetricManager createBoutDictionary](self, "createBoutDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setDailyStateBoutDwell:](self, "setDailyStateBoutDwell:", v17);

  -[RTLocationAwarenessMetricManager createBoutDictionary](self, "createBoutDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setDailyStateBoutLongestDwell:](self, "setDailyStateBoutLongestDwell:", v18);

  v19 = dispatch_semaphore_create(0);
  v69 = 0;
  v70 = (id *)&v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__94;
  v73 = __Block_byref_object_dispose__94;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__94;
  v67 = __Block_byref_object_dispose__94;
  v68 = 0;
  motionManager = self->_motionManager;
  -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", -0.001);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", 0.001);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __41__RTLocationAwarenessMetricManager_setup__block_invoke;
  v59[3] = &unk_1E9296EE0;
  v61 = &v63;
  v62 = &v69;
  v23 = v19;
  v60 = v23;
  -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v21, v22, v59);

  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v24, v26))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v25);
  v29 = v28;
  v30 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_504);
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
  v80[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v80, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = objc_retainAutorelease(v38);

    v40 = 0;
  }
  else
  {
LABEL_6:
    v39 = 0;
    v40 = 1;
  }

  v41 = v39;
  if ((v40 & 1) == 0)
    objc_storeStrong(v70 + 5, v39);
  if (v70[5] || !objc_msgSend((id)v64[5], "count"))
  {
    -[RTLocationAwarenessMetricManager setStateVariableCurrMotionActivityType:](self, "setStateVariableCurrMotionActivityType:", 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)v64[5], "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v70[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v56;
      v76 = 2112;
      v77 = v57;
      _os_log_debug_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEBUG, "initializing motion activity to, %@, error, %@", buf, 0x16u);

    }
    objc_msgSend((id)v64[5], "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setStateVariableCurrMotionActivityType:](self, "setStateVariableCurrMotionActivityType:", objc_msgSend(v43, "type"));

  }
  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariableCurrMotionStart:](self, "setStateVariableCurrMotionStart:", v44);

  -[RTLocationAwarenessMetricManager setStateVariableCurrSignalEnvironmentType:](self, "setStateVariableCurrSignalEnvironmentType:", 0);
  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariableLastSettledStateChangeTimestamp:](self, "setStateVariableLastSettledStateChangeTimestamp:", v45);

  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariableLastWifiStateChangeTimestamp:](self, "setStateVariableLastWifiStateChangeTimestamp:", v46);

  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariablePrevLocationTimestamp:](self, "setStateVariablePrevLocationTimestamp:", v47);

  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariablePrevWifiLocationTimestamp:](self, "setStateVariablePrevWifiLocationTimestamp:", v48);

  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setStateVariableLastSensitiveLocationCheckTimestamp:](self, "setStateVariableLastSensitiveLocationCheckTimestamp:", v49);

  -[RTLocationAwarenessMetricManager setStateVariableMostRecentDistanceToSensitiveLocation:](self, "setStateVariableMostRecentDistanceToSensitiveLocation:", -1.0);
  v58 = 0;
  -[RTLocationAwarenessMetricManager sensitiveLocationsOfInterestWithError:](self, "sensitiveLocationsOfInterestWithError:", &v58);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v58;
  -[RTLocationAwarenessMetricManager setSensitiveLocations:](self, "setSensitiveLocations:", v50);

  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v54;
    v76 = 2112;
    v77 = v55;
    v78 = 2112;
    v79 = v51;
    _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, "%@, %@, fetch sensitive locations error, %@", buf, 0x20u);

  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
}

void __41__RTLocationAwarenessMetricManager_setup__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)createBoutDictionary
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328598);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285B0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285C8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285E0);
  return v2;
}

- (id)createMotionDictionary
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328598);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285B0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285C8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285E0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93285F8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328610);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328628);
  return v2;
}

- (id)createSignalEnvironmentDictionary
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328580);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328640);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328658);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328670);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E9328688);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328580, &unk_1E93286A0);
  return v2;
}

- (void)resetBoutMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RTLocationAwarenessMetricManager createSignalEnvironmentDictionary](self, "createSignalEnvironmentDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateSignalEnvironmentDwell:](self, "setBoutStateSignalEnvironmentDwell:", v3);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionLongestDwell:](self, "setBoutStateMotionLongestDwell:", v4);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionTypeNumBouts:](self, "setBoutStateMotionTypeNumBouts:", v5);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateMotionDwell:](self, "setBoutStateMotionDwell:", v6);

  -[RTLocationAwarenessMetricManager setBoutMetricNumGPSLocationsInBout:](self, "setBoutMetricNumGPSLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumWifiLocationsInBout:](self, "setBoutMetricNumWifiLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumOtherLocationsInBout:](self, "setBoutMetricNumOtherLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutMetricDistanceToSensitiveLocation:](self, "setBoutMetricDistanceToSensitiveLocation:", -1.0);
}

- (void)resetBuffer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RTLocationAwarenessMetricManager createSignalEnvironmentDictionary](self, "createSignalEnvironmentDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferSignalEnvironmentDwell:](self, "setBoutBufferSignalEnvironmentDwell:", v3);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionDwell:](self, "setBoutBufferMotionDwell:", v4);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionLongestDwell:](self, "setBoutBufferMotionLongestDwell:", v5);

  -[RTLocationAwarenessMetricManager createMotionDictionary](self, "createMotionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutBufferMotionBoutCounts:](self, "setBoutBufferMotionBoutCounts:", v6);

  -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeDwell:](self, "setBoutBufferMotionEdgeDwell:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeType:](self, "setBoutBufferMotionEdgeType:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
  -[RTLocationAwarenessMetricManager setBoutBufferNumGPSLocationsInBout:](self, "setBoutBufferNumGPSLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumOtherLocationsInBout:](self, "setBoutBufferNumOtherLocationsInBout:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:", 0.0);
  -[RTLocationAwarenessMetricManager setBoutBufferDistanceToSensitiveLocation:](self, "setBoutBufferDistanceToSensitiveLocation:", -1.0);
}

- (id)locationsAndMotionsForDateInterval:(id)a3
{
  dispatch_semaphore_t v4;
  uint64_t v5;
  RTLocationManager *locationManager;
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
  NSObject *v26;
  RTMotionActivityManager *motionManager;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  dispatch_time_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  id v46;
  NSObject *v47;
  void *v48;
  uint64_t v50;
  id v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  _BYTE *v65;
  _QWORD v66[4];
  NSObject *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  id *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _BYTE v82[12];
  __int16 v83;
  id v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _BYTE buf[24];
  uint64_t (*v96)(uint64_t, uint64_t);
  __int128 v97;
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  objc_msgSend(v61, "startDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "endDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__94;
  v80 = __Block_byref_object_dispose__94;
  v81 = (id)objc_opt_new();
  v4 = dispatch_semaphore_create(0);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v61, 3600, 0, 250.0);
  v70 = 0;
  v71 = (id *)&v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__94;
  v74 = __Block_byref_object_dispose__94;
  v75 = 0;
  locationManager = self->_locationManager;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke;
  v66[3] = &unk_1E9296EE0;
  v68 = &v70;
  v69 = &v76;
  v7 = v4;
  v67 = v7;
  v58 = (void *)v5;
  -[RTLocationManager fetchStoredLocationsWithOptions:handler:](locationManager, "fetchStoredLocationsWithOptions:handler:", v5, v66);
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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_504);
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
  v89 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v89, 1);
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
    objc_storeStrong(v71 + 5, v23);
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v50 = objc_msgSend((id)v77[5], "count");
    objc_msgSend(v60, "stringFromDate");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringFromDate");
    v52 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v53 = v71[5];
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v51;
    *(_WORD *)&buf[22] = 2112;
    v96 = v52;
    LOWORD(v97) = 2112;
    *(_QWORD *)((char *)&v97 + 2) = v53;
    _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "Fetched %lu locations, batch for metrics from, %@, to, %@, error, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v96 = __Block_byref_object_copy__94;
  *(_QWORD *)&v97 = __Block_byref_object_dispose__94;
  *((_QWORD *)&v97 + 1) = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__94;
  v93 = __Block_byref_object_dispose__94;
  v94 = (id)objc_opt_new();
  motionManager = self->_motionManager;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke_19;
  v62[3] = &unk_1E9296EE0;
  v64 = &v89;
  v65 = buf;
  v28 = v8;
  v63 = v28;
  -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v60, v59, v62);
  v29 = v28;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v29, v31))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceDate:", v30);
  v34 = v33;
  v35 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_504);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "filteredArrayUsingPredicate:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "submitToCoreAnalytics:type:duration:", v39, 1, v34);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v82 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v82, 2u);
  }

  v41 = (void *)MEMORY[0x1E0CB35C8];
  v98[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v82 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v98, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = objc_retainAutorelease(v43);

    v45 = 0;
  }
  else
  {
LABEL_16:
    v45 = 1;
    v44 = v25;
  }

  v46 = v44;
  if ((v45 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v44);
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v54 = objc_msgSend((id)v90[5], "count");
    objc_msgSend(v60, "stringFromDate");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringFromDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v82 = 134218754;
    *(_QWORD *)&v82[4] = v54;
    v83 = 2112;
    v84 = v55;
    v85 = 2112;
    v86 = v56;
    v87 = 2112;
    v88 = v57;
    _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "Fetched %lu motion activities, batch for metrics from, %@, to, %@, error, %@", v82, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v48 = 0;
  }
  else
  {
    v48 = (void *)objc_opt_new();
    objc_msgSend(v48, "addObjectsFromArray:", v77[5]);
    objc_msgSend(v48, "addObjectsFromArray:", v90[5]);
  }

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  return v48;
}

void __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke_19(uint64_t a1, void *a2, void *a3)
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

- (id)sensitiveLocationsOfInterestWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  RTLearnedLocationStore *learnedLocationStore;
  uint64_t v8;
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
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v38;
  _QWORD v39[6];
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  SEL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  uint8_t buf[16];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v38 = objc_msgSend(&unk_1E932C7D8, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v57;
    v33 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v57 != v35)
          objc_enumerationMutation(&unk_1E932C7D8);
        v5 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v4);
        v50 = 0;
        v51 = (id *)&v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__94;
        v54 = __Block_byref_object_dispose__94;
        v55 = 0;
        v44 = 0;
        v45 = &v44;
        v46 = 0x3032000000;
        v47 = __Block_byref_object_copy__94;
        v48 = __Block_byref_object_dispose__94;
        v49 = 0;
        v6 = dispatch_semaphore_create(0);
        learnedLocationStore = self->_learnedLocationStore;
        v8 = objc_msgSend(v5, "unsignedIntegerValue");
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __74__RTLocationAwarenessMetricManager_sensitiveLocationsOfInterestWithError___block_invoke;
        v39[3] = &unk_1E92A08C8;
        v39[4] = self;
        v39[5] = v5;
        v41 = &v50;
        v42 = &v44;
        v43 = a2;
        v9 = v6;
        v40 = v9;
        -[RTLearnedLocationStore fetchLocationsOfInterestWithPlaceType:handler:](learnedLocationStore, "fetchLocationsOfInterestWithPlaceType:handler:", v8, v39);
        v10 = v9;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12))
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v11);
        v15 = v14;
        v16 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_504);
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
        v61 = v34;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v61, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v33, 15, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = objc_retainAutorelease(v24);

          v26 = 0;
        }
        else
        {
LABEL_11:
          v25 = 0;
          v26 = 1;
        }

        v27 = v25;
        if ((v26 & 1) == 0)
          objc_storeStrong(v51 + 5, v25);
        v28 = v51[5];
        if (v28)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v28);
        }
        else if (v45[5])
        {
          objc_msgSend(v32, "addObjectsFromArray:");
        }

        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v50, 8);

        if (v28)
        {
          v30 = 0;
          v29 = v32;
          goto LABEL_24;
        }
        ++v4;
      }
      while (v38 != v4);
      v38 = objc_msgSend(&unk_1E932C7D8, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v38)
        continue;
      break;
    }
  }
  v29 = v32;
  v30 = v32;
LABEL_24:

  return v30;
}

void __74__RTLocationAwarenessMetricManager_sensitiveLocationsOfInterestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "count");
    v12 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue");
    v19 = 138413058;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v25 = 2048;
    v26 = v12;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store, of placeType, %lu", (uint8_t *)&v19, 0x2Au);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v5;
  v18 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)addDwellForMotionType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 motionDwellMetrics:(id)a6 longestDwell:(id)a7 boutCounts:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  id v48;

  v48 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v14, "timeIntervalSinceDate:", v48);
  if (v18 < 0.0)
    goto LABEL_17;
  objc_msgSend(v48, "timeIntervalSinceDate:", self->_endDate);
  if (v19 >= 0.0)
    goto LABEL_17;
  if (-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType") == a3)
  {
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v48, "isEqualToDate:", v20) & 1) == 0)
    {
      -[RTLocationAwarenessMetricManager startDate](self, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v48, "isEqualToDate:", v21) & 1) == 0)
      {
        -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqualToDate:", v22))
        {
          -[RTLocationAwarenessMetricManager endDate](self, "endDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v14, "isEqualToDate:", v46);

          if ((v47 & 1) == 0)
            goto LABEL_17;
          goto LABEL_10;
        }

      }
    }

  }
LABEL_10:
  objc_msgSend(v14, "earlierDate:", self->_endDate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", v48);
  v25 = v24;

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  objc_msgSend(v26, "numberWithDouble:", v25 + v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, v31);

  if (objc_msgSend(v16, "count"))
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    if (v36 >= v25)
      v37 = v36;
    else
      v37 = v25;
    objc_msgSend(v32, "numberWithDouble:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, v39);

  }
  if (objc_msgSend(v17, "count"))
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    objc_msgSend(v40, "numberWithDouble:", v43 + 1.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, v45);

  }
LABEL_17:

}

- (void)addDwellForSignalEnvironmentType:(int)a3 startDate:(id)a4 endDate:(id)a5 sigEnvMetrics:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  id v42;

  v8 = *(_QWORD *)&a3;
  v42 = a4;
  v10 = a5;
  v11 = a6;
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToDate:", v13);

  if (v14)
    -[RTLocationAwarenessMetricManager setStateVariableCurrSignalEnvironmentType:](self, "setStateVariableCurrSignalEnvironmentType:", v8);
  if (-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType") == (_DWORD)v8)
  {
    objc_msgSend(v10, "timeIntervalSinceDate:", v42);
    v16 = v15;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v17, "numberWithDouble:", v16 + v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);
  }
  else
  {
    -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v23);
    v25 = v24;

    v26 = (void *)MEMORY[0x1E0C99D68];
    -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateWithTimeInterval:sinceDate:", v27, v25 * 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "laterDate:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v42);
    v30 = v29;

    objc_msgSend(v10, "timeIntervalSinceDate:", v18);
    v32 = v31;
    v33 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    objc_msgSend(v33, "numberWithDouble:", v30 + v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v37, v38);

    v39 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v39, "numberWithDouble:", v32 + v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v41);

  }
}

- (double)distanceToNearestSensitiveLocation:(id)a3
{
  id v4;
  NSArray *sensitiveLocations;
  double v6;
  void *v7;
  NSArray *v8;
  id v9;
  NSObject *v10;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sensitiveLocations = self->_sensitiveLocations;
  v6 = -1.0;
  if (sensitiveLocations && -[NSArray count](sensitiveLocations, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v4);
    v23 = 0;
    v24 = (double *)&v23;
    v25 = 0x2020000000;
    v26 = 0x41DFFFFFFFC00000;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__94;
    v21 = __Block_byref_object_dispose__94;
    v22 = 0;
    v8 = self->_sensitiveLocations;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__RTLocationAwarenessMetricManager_distanceToNearestSensitiveLocation___block_invoke;
    v13[3] = &unk_1E92A08F0;
    v13[4] = self;
    v9 = v7;
    v14 = v9;
    v15 = &v17;
    v16 = &v23;
    -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v13);
    if (v18[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = v18[5];
        *(_DWORD *)buf = 138412546;
        v28 = v12;
        v29 = 2112;
        v30 = v4;
        _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "error for near sensitive location check: error, %@, location, %@", buf, 0x16u);
      }

    }
    else
    {
      v6 = v24[3];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  return v6;
}

void __71__RTLocationAwarenessMetricManager_distanceToNearestSensitiveLocation___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 440);
  objc_msgSend(a2, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "distanceFromLocation:toLocation:error:", v3, v6, &v12);
  v8 = v7;
  v9 = v12;
  v10 = v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);
  v11 = *(_QWORD *)(a1[7] + 8);
  if (v8 < *(double *)(v11 + 24))
    *(double *)(v11 + 24) = v8;

}

- (id)sortLocationsAndMotions:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_75);
}

uint64_t __60__RTLocationAwarenessMetricManager_sortLocationsAndMotions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "timestamp");
  else
    objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "startDate");
  else
    objc_msgSend(v4, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

- (void)flushBufferToCurrBoutMetrics
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  id obj;
  id obja;
  id objb;
  id v114;
  id v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  -[RTLocationAwarenessMetricManager boutBufferSignalEnvironmentDwell](self, "boutBufferSignalEnvironmentDwell");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
  if (v3)
  {
    v4 = v3;
    v114 = *(id *)v131;
    do
    {
      v5 = 0;
      do
      {
        if (*(id *)v131 != v114)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1E0CB37E8];
        -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;
        -[RTLocationAwarenessMetricManager boutBufferSignalEnvironmentDwell](self, "boutBufferSignalEnvironmentDwell");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v7, "numberWithDouble:", v11 + v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v6);

        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
    }
    while (v4);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[RTLocationAwarenessMetricManager boutBufferMotionLongestDwell](self, "boutBufferMotionLongestDwell");
  v115 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v127;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v127 != v19)
          objc_enumerationMutation(v115);
        v21 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v20);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isEqualToNumber:", v22) & 1) == 0)
        {

LABEL_21:
          v33 = (void *)MEMORY[0x1E0CB37E8];
          -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v21);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "doubleValue");
          v43 = v42;

          -[RTLocationAwarenessMetricManager boutBufferMotionLongestDwell](self, "boutBufferMotionLongestDwell");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v21);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          v47 = v46;

          if (v43 >= v47)
            v39 = v43;
          else
            v39 = v47;
          goto LABEL_24;
        }
        -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToNumber:", &unk_1E9328580);

        if ((v25 & 1) != 0)
          goto LABEL_21;
        -[RTLocationAwarenessMetricManager boutBufferMotionEdgeDwell](self, "boutBufferMotionEdgeDwell");
        v27 = v26;
        -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        if (v27 >= v32)
          v32 = v27;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        -[RTLocationAwarenessMetricManager boutBufferMotionLongestDwell](self, "boutBufferMotionLongestDwell");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v38 = v37;

        if (v32 >= v38)
          v39 = v32;
        else
          v39 = v38;
LABEL_24:
        objc_msgSend(v33, "numberWithDouble:", v39);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
    }
    while (v18);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[RTLocationAwarenessMetricManager boutBufferMotionBoutCounts](self, "boutBufferMotionBoutCounts");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
  if (!v50)
    goto LABEL_40;
  v51 = v50;
  v116 = *(id *)v123;
  do
  {
    v52 = 0;
    do
    {
      if (*(id *)v123 != v116)
        objc_enumerationMutation(obja);
      v53 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v52);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "isEqualToNumber:", v54);

      if (!v55)
      {
        v65 = (void *)MEMORY[0x1E0CB37E8];
        -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "doubleValue");
        v67 = v66;
        -[RTLocationAwarenessMetricManager boutBufferMotionBoutCounts](self, "boutBufferMotionBoutCounts");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v53);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "doubleValue");
        objc_msgSend(v65, "numberWithDouble:", v67 + v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, v53);

LABEL_36:
        goto LABEL_37;
      }
      -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", v53);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "isEqualToNumber:", &unk_1E9328580))
      {
        -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v58, "isEqualToDate:", v59);

        if ((v60 & 1) != 0)
          goto LABEL_38;
        v61 = (void *)MEMORY[0x1E0CB37E8];
        -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "doubleValue");
        objc_msgSend(v61, "numberWithDouble:", v62 + 1.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v63, v53);
        goto LABEL_36;
      }
LABEL_37:

LABEL_38:
      ++v52;
    }
    while (v51 != v52);
    v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
  }
  while (v51);
LABEL_40:

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[RTLocationAwarenessMetricManager boutBufferMotionDwell](self, "boutBufferMotionDwell");
  objb = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v118, v134, 16);
  if (v71)
  {
    v72 = v71;
    v117 = *(id *)v119;
    do
    {
      v73 = 0;
      do
      {
        if (*(id *)v119 != v117)
          objc_enumerationMutation(objb);
        v74 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v73);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "isEqualToNumber:", v75);

        v76 = (void *)MEMORY[0x1E0CB37E8];
        -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectForKeyedSubscript:", v74);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "doubleValue");
        v80 = v79;
        -[RTLocationAwarenessMetricManager boutBufferMotionDwell](self, "boutBufferMotionDwell");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectForKeyedSubscript:", v74);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "doubleValue");
        objc_msgSend(v76, "numberWithDouble:", v80 + v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, v74);

        ++v73;
      }
      while (v72 != v73);
      v72 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v118, v134, 16);
    }
    while (v72);
  }

  -[RTLocationAwarenessMetricManager boutBufferDistanceToSensitiveLocation](self, "boutBufferDistanceToSensitiveLocation");
  if (v86 >= 0.0)
  {
    -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
    v88 = v87;
    -[RTLocationAwarenessMetricManager boutBufferDistanceToSensitiveLocation](self, "boutBufferDistanceToSensitiveLocation");
    if (v88 < v89)
      v89 = v88;
    -[RTLocationAwarenessMetricManager setBoutMetricDistanceToSensitiveLocation:](self, "setBoutMetricDistanceToSensitiveLocation:", v89);
  }
  -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle");
  v91 = v90;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:", v91 + v92);
  -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle");
  v94 = v93;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:", v94 + v95);
  -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle");
  v97 = v96;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:", v97 + v98);
  -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle");
  v100 = v99;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:", v100 + v101);
  -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle");
  v103 = v102;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:", v103 + v104);
  -[RTLocationAwarenessMetricManager boutBufferNumGPSLocationsInBout](self, "boutBufferNumGPSLocationsInBout");
  v106 = v105;
  -[RTLocationAwarenessMetricManager boutMetricNumGPSLocationsInBout](self, "boutMetricNumGPSLocationsInBout");
  -[RTLocationAwarenessMetricManager setBoutMetricNumGPSLocationsInBout:](self, "setBoutMetricNumGPSLocationsInBout:", v106 + v107);
  -[RTLocationAwarenessMetricManager boutBufferNumOtherLocationsInBout](self, "boutBufferNumOtherLocationsInBout");
  v109 = v108;
  -[RTLocationAwarenessMetricManager boutMetricNumOtherLocationsInBout](self, "boutMetricNumOtherLocationsInBout");
  -[RTLocationAwarenessMetricManager setBoutMetricNumOtherLocationsInBout:](self, "setBoutMetricNumOtherLocationsInBout:", v109 + v110);
  -[RTLocationAwarenessMetricManager resetBuffer](self, "resetBuffer");
}

- (void)updateBoutMetricsForLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  int v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  RTLocationAwarenessMetricManager *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  double v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  RTLocationAwarenessMetricManager *v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v61 = a3;
  objc_msgSend(v61, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (v9 + -1.0) / 60.0;
  if (v10 < 0.0)
    v10 = 0.0;
  v11 = (int)v10;
  if (objc_msgSend(v61, "type") == 4 || objc_msgSend(v61, "type") == 11)
  {
    -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutMetricNumWifiLocationsInBout](self, "boutMetricNumWifiLocationsInBout");
    -[RTLocationAwarenessMetricManager setBoutMetricNumWifiLocationsInBout:](self, "setBoutMetricNumWifiLocationsInBout:", v13 + 1.0);
    -[RTLocationAwarenessMetricManager flushBufferToCurrBoutMetrics](self, "flushBufferToCurrBoutMetrics");
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:", v14 + (double)v11);
    if (v11 >= 0)
      v15 = v11;
    else
      v15 = v11 + 1;
    v16 = v15 >> 1;
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:", v17 + (double)v16);
    v18 = 1717986919 * v11;
    v19 = HIDWORD(v18);
    v20 = v18 >> 63;
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:", v21 + (double)(v11 / 5));
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:", v22 + (double)((int)v20 + ((int)v19 >> 2)));
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:", v23 + (double)(v11 / 15));
    objc_msgSend(v61, "timestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariableLastSensitiveLocationCheckTimestamp](self, "stateVariableLastSensitiveLocationCheckTimestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v25);
    if (v26 >= 600.0)
    {

    }
    else
    {
      -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
      v28 = v27;

      if (v28 >= 0.0)
        goto LABEL_35;
    }
    -[RTLocationAwarenessMetricManager distanceToNearestSensitiveLocation:](self, "distanceToNearestSensitiveLocation:", v61);
    v30 = v29;
    -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
    v31 = self;
    if (v32 >= 0.0)
    {
      -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
      if (v33 >= v30)
        v33 = v30;
      v31 = self;
    }
    else
    {
      v33 = v30;
    }
    -[RTLocationAwarenessMetricManager setBoutMetricDistanceToSensitiveLocation:](v31, "setBoutMetricDistanceToSensitiveLocation:", v33);
  }
  else
  {
    -[RTLocationAwarenessMetricManager boutBufferSignalEnvironmentDwell](self, "boutBufferSignalEnvironmentDwell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "type") == 1 || objc_msgSend(v61, "type") == 9)
    {
      -[RTLocationAwarenessMetricManager boutBufferNumGPSLocationsInBout](self, "boutBufferNumGPSLocationsInBout");
      -[RTLocationAwarenessMetricManager setBoutBufferNumGPSLocationsInBout:](self, "setBoutBufferNumGPSLocationsInBout:", v34 + 1.0);
    }
    else
    {
      -[RTLocationAwarenessMetricManager boutBufferNumOtherLocationsInBout](self, "boutBufferNumOtherLocationsInBout");
      -[RTLocationAwarenessMetricManager setBoutBufferNumOtherLocationsInBout:](self, "setBoutBufferNumOtherLocationsInBout:", v35 + 1.0);
    }
    -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:", v36 + (double)v11);
    if (v11 >= 0)
      v37 = v11;
    else
      v37 = v11 + 1;
    v38 = v37 >> 1;
    -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:", v39 + (double)v38);
    v40 = 1717986919 * v11;
    v41 = HIDWORD(v40);
    v42 = v40 >> 63;
    -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:", v43 + (double)(v11 / 5));
    -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:", v44 + (double)((int)v42 + ((int)v41 >> 2)));
    -[RTLocationAwarenessMetricManager boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle");
    -[RTLocationAwarenessMetricManager setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:", v45 + (double)(v11 / 15));
    objc_msgSend(v61, "timestamp");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariableLastSensitiveLocationCheckTimestamp](self, "stateVariableLastSensitiveLocationCheckTimestamp");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSinceDate:", v47);
    if (v48 >= 600.0)
    {

    }
    else
    {
      -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
      v50 = v49;

      if (v50 >= 0.0)
        goto LABEL_35;
    }
    -[RTLocationAwarenessMetricManager distanceToNearestSensitiveLocation:](self, "distanceToNearestSensitiveLocation:", v61);
    v52 = v51;
    -[RTLocationAwarenessMetricManager boutBufferDistanceToSensitiveLocation](self, "boutBufferDistanceToSensitiveLocation");
    v53 = self;
    if (v54 >= 0.0)
    {
      -[RTLocationAwarenessMetricManager boutBufferDistanceToSensitiveLocation](self, "boutBufferDistanceToSensitiveLocation");
      if (v55 >= v52)
        v55 = v52;
      v53 = self;
    }
    else
    {
      v55 = v52;
    }
    -[RTLocationAwarenessMetricManager setBoutBufferDistanceToSensitiveLocation:](v53, "setBoutBufferDistanceToSensitiveLocation:", v55);
  }
LABEL_35:
  v56 = objc_msgSend(v61, "signalEnvironmentType");
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "laterDate:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "timestamp");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:](self, "addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:", v56, v59, v60, v12);

}

- (void)updateBoutMetricsForMotion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v4 = objc_msgSend(v28, "type");
  if (v4 != -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"))
  {
    -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 >= 0.0)
    {
      v20 = objc_msgSend(v28, "type");
      -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
    }
    else
    {
      objc_msgSend(v28, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "laterDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v12);
      -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeDwell:](self, "setBoutBufferMotionEdgeDwell:");

      -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeType:](self, "setBoutBufferMotionEdgeType:", -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"));
      v13 = objc_msgSend(v28, "type");
      -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "laterDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v13, v16, v17, v18, v19, 0);

      v20 = objc_msgSend(v28, "type");
      -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "laterDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutBufferMotionDwell](self, "boutBufferMotionDwell");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutBufferMotionLongestDwell](self, "boutBufferMotionLongestDwell");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutBufferMotionBoutCounts](self, "boutBufferMotionBoutCounts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v20, v23, v24, v25, v26, v27);

  }
}

- (void)updateBoutMetricsStateChangeEdgeDwell
{
  void *v3;
  void *v4;
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
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  int v40;
  double v41;
  int v42;
  int v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;

  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  -[RTLocationAwarenessMetricManager setBoutMetricDuration:](self, "setBoutMetricDuration:");

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutCounts](self, "dailyStateBoutCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v9 + 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager dailyStateBoutCounts](self, "dailyStateBoutCounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutDwell](self, "dailyStateBoutDwell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;
  -[RTLocationAwarenessMetricManager boutMetricDuration](self, "boutMetricDuration");
  objc_msgSend(v13, "numberWithDouble:", v18 + v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager dailyStateBoutDwell](self, "dailyStateBoutDwell");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutLongestDwell](self, "dailyStateBoutLongestDwell");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  -[RTLocationAwarenessMetricManager boutMetricDuration](self, "boutMetricDuration");
  if (v28 >= v29)
    v29 = v28;
  objc_msgSend(v23, "numberWithDouble:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager dailyStateBoutLongestDwell](self, "dailyStateBoutLongestDwell");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "laterDate:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceDate:", v36);
  v38 = v37;

  v39 = v38 / 60.0 + -1.0;
  if (v39 < 0.0)
    v39 = 0.0;
  v40 = (int)v39;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:", v41 + (double)v40);
  if (v40 >= 0)
    v42 = v40;
  else
    v42 = v40 + 1;
  v43 = v42 >> 1;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:", v44 + (double)v43);
  v45 = 1717986919 * v40;
  v46 = HIDWORD(v45);
  v47 = v45 >> 63;
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:", v48 + (double)(v40 / 5));
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:", v49 + (double)((int)v47 + ((int)v46 >> 2)));
  -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle");
  -[RTLocationAwarenessMetricManager setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:](self, "setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:", v50 + (double)(v40 / 15));
  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariableLastWifiStateChangeTimestamp](self, "stateVariableLastWifiStateChangeTimestamp");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = objc_msgSend(v51, "isEqualToDate:", v52);

  if ((_DWORD)v47)
  {
    v53 = -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType");
    -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "laterDate:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v53, v56, v57, v58, v59, v60);

  }
  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v61, "isEqualToDate:", v62);

  if (v63)
  {
    -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "laterDate:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "timeIntervalSinceDate:", v67);
    v69 = v68;

    v70 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
    v77 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectForKeyedSubscript:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    objc_msgSend(v70, "numberWithDouble:", v69 + v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setObject:forKeyedSubscript:", v74, v76);

  }
}

- (void)processLastBout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;

  if (-[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi") == 2)
  {
    -[RTLocationAwarenessMetricManager endDate](self, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;

    if (v6 > 1200.0)
    {
      -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v7);

      v8 = -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType");
      -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "laterDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v8, v11, v12, v13, v14, 0);

      -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
      -[RTLocationAwarenessMetricManager setBoutMetricType:](self, "setBoutMetricType:", 2);
    }
  }
  -[RTLocationAwarenessMetricManager flushBufferToCurrBoutMetrics](self, "flushBufferToCurrBoutMetrics");
  if (-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType") == 1)
  {
    -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v15);
    v16 = 1;
    goto LABEL_10;
  }
  -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "laterDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v19);

  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v20);
  if (v21 <= 1200.0)
  {
LABEL_9:

    v16 = 3;
    goto LABEL_10;
  }
  -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v23);
  if (v24 > 0.0)
  {

    goto LABEL_9;
  }
  v39 = -[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi");

  if (v39 != 2)
  {
    v16 = 3;
    goto LABEL_11;
  }
  -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v40);

  -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
  -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v15);
  v16 = 2;
LABEL_10:

LABEL_11:
  -[RTLocationAwarenessMetricManager setBoutMetricType:](self, "setBoutMetricType:", v16);
  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v25);

  v26 = -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType");
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "laterDate:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:](self, "addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:", v26, v29, v30, v31);

  v32 = -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType");
  -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "laterDate:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v32, v35, v36, v37, v38, 0);

  -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
}

- (void)updateDailyMetrics:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v16;
    v5 = objc_msgSend(v4, "signalEnvironmentType");
    -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:](self, "addDwellForSignalEnvironmentType:startDate:endDate:sigEnvMetrics:", v5, v6, v7, v8);
    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v16;
    v11 = objc_msgSend(v6, "type");
    if (v11 == -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"))
    {
LABEL_7:

      v10 = v16;
      goto LABEL_8;
    }
    v12 = objc_msgSend(v6, "type");
    -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "laterDate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:](self, "addDwellForMotionType:startDate:endDate:motionDwellMetrics:longestDwell:boutCounts:", v12, v13, v14, v15, 0, 0);

LABEL_6:
    goto LABEL_7;
  }
LABEL_8:

}

- (void)processLastDailyMetrics
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType");
  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariableCurrMotionStart](self, "stateVariableCurrMotionStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v8, "numberWithDouble:", v7 + v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager stateVariablePrevLocationTimestamp](self, "stateVariablePrevLocationTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  v19 = v18;

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v20, "numberWithDouble:", v19 + v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

}

- (void)processMetrics
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  -[RTLocationAwarenessMetricManager startDate](self, "startDate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "earlierDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToDate:", v16);

  if (v5)
  {
    v6 = 0;
    v7 = v16;
    do
    {
      v8 = v6;
      v9 = v7;
      v10 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, 3600.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v6);
      -[RTLocationAwarenessMetricManager locationsAndMotionsForDateInterval:](self, "locationsAndMotionsForDateInterval:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager sortLocationsAndMotions:](self, "sortLocationsAndMotions:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__RTLocationAwarenessMetricManager_processMetrics__block_invoke;
      v17[3] = &unk_1E92974C8;
      v17[4] = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v6, 1.0);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v10);
      -[RTLocationAwarenessMetricManager endDate](self, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "earlierDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v15, "isEqualToDate:", v16);

      v7 = v16;
    }
    while ((v11 & 1) != 0);

  }
}

void __50__RTLocationAwarenessMetricManager_processMetrics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateDailyMetrics:", v4);
  objc_msgSend(*(id *)(a1 + 32), "monitorStateChange:", v4);

}

- (void)monitorStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v37;
    objc_msgSend(v4, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (-[RTLocationAwarenessMetricManager boutStateMotion](self, "boutStateMotion") == 1
      || !-[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi")
      && (-[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          -[RTLocationAwarenessMetricManager startDate](self, "startDate"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v21, "isEqualToDate:", v22),
          v22,
          v21,
          v23))
    {
      if (v8 <= 1200.0)
        v9 = 2;
      else
        v9 = 1;
      -[RTLocationAwarenessMetricManager setBoutStateWifi:](self, "setBoutStateWifi:", v9);
      goto LABEL_31;
    }
    if (v8 <= 1200.0 && -[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi") == 1)
    {
      v24 = 2;
      v25 = 2;
    }
    else
    {
      if (v8 <= 1200.0 || -[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi") != 2)
        goto LABEL_31;
      v25 = 1;
      v24 = 3;
    }
    -[RTLocationAwarenessMetricManager setBoutMetricType:](self, "setBoutMetricType:", v24);
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v26);

    -[RTLocationAwarenessMetricManager setBoutStateWifi:](self, "setBoutStateWifi:", v25);
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setStateVariableLastWifiStateChangeTimestamp:](self, "setStateVariableLastWifiStateChangeTimestamp:", v27);

    -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariableLastSettledStateChangeTimestamp](self, "stateVariableLastSettledStateChangeTimestamp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "laterDate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v30);

LABEL_31:
    -[RTLocationAwarenessMetricManager updateBoutMetricsForLocation:](self, "updateBoutMetricsForLocation:", v4);
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v37;
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 <= 0.0)
    {
      if (objc_msgSend(v10, "type") == 1)
        v15 = 1;
      else
        v15 = 2;
      -[RTLocationAwarenessMetricManager setBoutStateMotion:](self, "setBoutStateMotion:", v15);
      -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeType:](self, "setBoutBufferMotionEdgeType:", objc_msgSend(v10, "type"));
    }
    if (-[RTLocationAwarenessMetricManager boutStateMotion](self, "boutStateMotion") == 1
      && objc_msgSend(v10, "type") != 1
      && objc_msgSend(v10, "type") != 6)
    {
      objc_msgSend(v10, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v31);

      v32 = 2;
      v33 = 1;
LABEL_41:
      -[RTLocationAwarenessMetricManager setBoutMetricType:](self, "setBoutMetricType:", v33);
      -[RTLocationAwarenessMetricManager setBoutStateMotion:](self, "setBoutStateMotion:", v32);
      objc_msgSend(v10, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setStateVariableLastSettledStateChangeTimestamp:](self, "setStateVariableLastSettledStateChangeTimestamp:", v35);

      -[RTLocationAwarenessMetricManager updateBoutMetricsForMotion:](self, "updateBoutMetricsForMotion:", v10);
      -[RTLocationAwarenessMetricManager flushBufferToCurrBoutMetrics](self, "flushBufferToCurrBoutMetrics");
      -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
      objc_msgSend(v10, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v36);

      goto LABEL_32;
    }
    if (-[RTLocationAwarenessMetricManager boutStateMotion](self, "boutStateMotion") != 2
      || objc_msgSend(v10, "type") != 1)
    {
      -[RTLocationAwarenessMetricManager updateBoutMetricsForMotion:](self, "updateBoutMetricsForMotion:", v10);
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(v10, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    if (v18 <= 1200.0)
    {

    }
    else
    {
      v19 = -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType");

      if (v19 != 3)
      {
LABEL_37:
        objc_msgSend(v10, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v34);

        if (-[RTLocationAwarenessMetricManager boutStateWifi](self, "boutStateWifi") == 2)
          v33 = 3;
        else
          v33 = 2;
        v32 = 1;
        goto LABEL_41;
      }
      -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setBoutStateCurrBoutEnd:](self, "setBoutStateCurrBoutEnd:", v20);

      -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
      -[RTLocationAwarenessMetricManager stateVariablePrevWifiLocationTimestamp](self, "stateVariablePrevWifiLocationTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setBoutStateCurrBoutStart:](self, "setBoutStateCurrBoutStart:", v16);
    }

    goto LABEL_37;
  }
LABEL_33:
  -[RTLocationAwarenessMetricManager updateStateVariables:](self, "updateStateVariables:", v37);

}

- (void)updateStateVariables:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v22;
    if (objc_msgSend(v4, "type") == 4 || objc_msgSend(v4, "type") == 11)
    {
      objc_msgSend(v4, "timestamp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setStateVariablePrevWifiLocationTimestamp:](self, "setStateVariablePrevWifiLocationTimestamp:", v5);

    }
    objc_msgSend(v4, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager stateVariableLastSensitiveLocationCheckTimestamp](self, "stateVariableLastSensitiveLocationCheckTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    if (v8 >= 600.0)
    {

    }
    else
    {
      -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
      v10 = v9;

      if (v10 >= 0.0)
        goto LABEL_14;
    }
    -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
    -[RTLocationAwarenessMetricManager setStateVariableMostRecentDistanceToSensitiveLocation:](self, "setStateVariableMostRecentDistanceToSensitiveLocation:");
    objc_msgSend(v4, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setStateVariableLastSensitiveLocationCheckTimestamp:](self, "setStateVariableLastSensitiveLocationCheckTimestamp:", v20);

LABEL_14:
    objc_msgSend(v4, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager setStateVariablePrevLocationTimestamp:](self, "setStateVariablePrevLocationTimestamp:", v21);

    -[RTLocationAwarenessMetricManager setStateVariableCurrSignalEnvironmentType:](self, "setStateVariableCurrSignalEnvironmentType:", objc_msgSend(v4, "signalEnvironmentType"));
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v22;
    v12 = objc_msgSend(v11, "type");
    if (v12 != -[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType"))goto LABEL_11;
    objc_msgSend(v11, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v16 = v15;

    if (v16 <= 0.0)
    {
LABEL_11:
      -[RTLocationAwarenessMetricManager setStateVariableCurrMotionActivityType:](self, "setStateVariableCurrMotionActivityType:", objc_msgSend(v11, "type"));
      objc_msgSend(v11, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager startDate](self, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "laterDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager setStateVariableCurrMotionStart:](self, "setStateVariableCurrMotionStart:", v19);

    }
    goto LABEL_15;
  }
LABEL_16:

}

- (id)collectBoutMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
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
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  uint64_t v71;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  void *v150;
  void *v151;
  void *v152;
  double v153;
  void *v154;
  void *v155;
  NSObject *v156;
  int v158;
  void *v159;
  unsigned int v160;
  void *v161;
  unsigned int v162;
  void *v163;
  void *v164;
  unsigned int v165;
  void *v166;
  unsigned int v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  _QWORD v186[5];
  _QWORD v187[5];
  uint8_t buf[16];

  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "laterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v7 & 1) != 0)
  {
    v164 = (void *)objc_opt_new();
    +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328580, &unk_1E932D050, &unk_1E932D060);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_opt_new();
    +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328580, &unk_1E9328700, &unk_1E9328640);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328790, &unk_1E9328718, &unk_1E93286B8);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "addObjectsFromArray:", v175);
    objc_msgSend(v171, "addObjectsFromArray:", v174);
    v170 = (void *)objc_opt_new();
    +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328580, &unk_1E9328718, &unk_1E93286B8);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "addObjectsFromArray:", v173);
    objc_msgSend(v170, "addObjectsFromArray:", &unk_1E932C808);
    +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932D070, &unk_1E932D080, &unk_1E932D090);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "components:fromDate:", 32, v8);
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v187[0] = MEMORY[0x1E0C809B0];
    v187[1] = 3221225472;
    v187[2] = __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke;
    v187[3] = &unk_1E92A0938;
    v187[4] = self;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v187);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v186[0] = v15;
    v186[1] = 3221225472;
    v186[2] = __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke_2;
    v186[3] = &unk_1E92A0938;
    v186[4] = self;
    objc_msgSend(v18, "sortedArrayUsingComparator:", v186);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    v177 = v16;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "intValue");

    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v27, "intValue");

    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v30, "intValue");

    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v33, "intValue");

    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(v34, "numberWithDouble:", v38 / v12);
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    objc_msgSend(v39, "numberWithDouble:", v43 / v12);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    objc_msgSend(v44, "numberWithDouble:", v48 / v12);
    v181 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    objc_msgSend(v49, "numberWithDouble:", v53 / v12);
    v180 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "doubleValue");
    objc_msgSend(v54, "numberWithDouble:", v58 / v12);
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionLongestDwell](self, "boutStateMotionLongestDwell");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    objc_msgSend(v59, "numberWithDouble:", v63 / v12);
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v169, "objectAtIndexedSubscript:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "intValue");

    v66 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateSignalEnvironmentDwell](self, "boutStateSignalEnvironmentDwell");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "doubleValue");
    if (v70 <= 0.0)
      v71 = 0;
    else
      v71 = v65;
    objc_msgSend(v66, "numberWithUnsignedInt:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v72, CFSTR("_primarySignalEnvironment"));

    v73 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricDistanceToSensitiveLocation](self, "boutMetricDistanceToSensitiveLocation");
    objc_msgSend(v73, "numberWithDouble:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v74, &unk_1E932C820);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v75, CFSTR("_boutMetricNearSensitiveLocation"));

    v76 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricDuration](self, "boutMetricDuration");
    objc_msgSend(v76, "numberWithDouble:");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v77, v185);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v78, CFSTR("_duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v184, "hour"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v79, CFSTR("_startDate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v80, CFSTR("_wifiMobilityType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v81, CFSTR("_primarySignalEnvironment"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v82, CFSTR("_primaryMotion"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v183, v176);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v83, CFSTR("_primaryMotionDurationBucketed"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v162);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v84, &unk_1E932C7F0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v85, CFSTR("_numBoutsPrimaryMotionBucketed"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v180, v176);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v86, CFSTR("_longestBoutPrimaryMotionBucketed"));

    v87 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectForKeyedSubscript:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "doubleValue");
    if (v91 <= 0.0)
      v92 = 0xFFFFFFFFLL;
    else
      v92 = v22;
    objc_msgSend(v87, "numberWithInt:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v93, CFSTR("_secondaryMotion"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v182, v176);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v94, CFSTR("_secondaryMotionDurationBucketed"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v165);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v95, &unk_1E932C7F0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v96, CFSTR("_numBoutsSecondaryMotionBucketed"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v179, v176);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v97, CFSTR("_longestBoutSecondaryMotionBucketed"));

    v98 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v160);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectForKeyedSubscript:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "doubleValue");
    if (v102 <= 0.0)
      v103 = 0xFFFFFFFFLL;
    else
      v103 = v160;
    objc_msgSend(v98, "numberWithInt:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v104, CFSTR("_tertiaryMotion"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v181, v176);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v105, CFSTR("_tertiaryMotionDurationBucketed"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v167);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v106, &unk_1E932C7F0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v107, CFSTR("_numBoutsTertiaryMotionBucketed"));

    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v178, v176);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v108, CFSTR("_longestBoutTertiaryMotionBucketed"));

    -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "timeIntervalSinceDate:", v110);
    v112 = v111 / 3600.0;

    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "objectAtIndexedSubscript:", 3);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "objectForKeyedSubscript:", v166);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v110) = objc_msgSend(v163, "intValue");
    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "objectAtIndexedSubscript:", 4);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "objectForKeyedSubscript:", v159);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v113, "intValue") + (_DWORD)v110;
    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "objectAtIndexedSubscript:", 5);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "objectForKeyedSubscript:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v109) = objc_msgSend(v116, "intValue");
    -[RTLocationAwarenessMetricManager boutStateMotionTypeNumBouts](self, "boutStateMotionTypeNumBouts");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "objectAtIndexedSubscript:", 6);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "objectForKeyedSubscript:", v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v158 + v109 + objc_msgSend(v119, "intValue");

    v121 = v164;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v120);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v122, &unk_1E932C7F0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v123, CFSTR("_numBoutsOtherMotionBucketed"));

    v124 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumWifiLocationsInBout](self, "boutMetricNumWifiLocationsInBout");
    objc_msgSend(v124, "numberWithDouble:", v125 / v112);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v126, v170);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v127, CFSTR("_numWifiLocations"));

    v128 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumGPSLocationsInBout](self, "boutMetricNumGPSLocationsInBout");
    objc_msgSend(v128, "numberWithDouble:", v129 / v112);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v130, v170);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v131, CFSTR("_numGPSLocations"));

    v132 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumOtherLocationsInBout](self, "boutMetricNumOtherLocationsInBout");
    objc_msgSend(v132, "numberWithDouble:", v133 / v112);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v134, v170);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v135, CFSTR("_numOtherLocations"));

    v136 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle");
    objc_msgSend(v136, "numberWithDouble:", v137 / v112);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v138, v171);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v139, CFSTR("_numAdditionalFixesRequired_1mCycle"));

    v140 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle");
    objc_msgSend(v140, "numberWithDouble:", v141 / v112);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v142, v171);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v143, CFSTR("_numAdditionalFixesRequired_2mCycle"));

    v144 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle");
    objc_msgSend(v144, "numberWithDouble:", v145 / v112);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v146, v171);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v147, CFSTR("_numAdditionalFixesRequired_5mCycle"));

    v148 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle");
    objc_msgSend(v148, "numberWithDouble:", v149 / v112);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v150, v171);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v151, CFSTR("_numAdditionalFixesRequired_10mCycle"));

    v152 = (void *)MEMORY[0x1E0CB37E8];
    -[RTLocationAwarenessMetricManager boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle](self, "boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle");
    objc_msgSend(v152, "numberWithDouble:", v153 / v112);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v154, v171);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v155, CFSTR("_numAdditionalFixesRequired_15mCycle"));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v156 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v156, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [[self.boutStateCurrBoutStart laterDate:self.boutStateCurrBoutEnd] isEqualToDate:self.boutStateCurrBoutEnd]", buf, 2u);
    }

    v121 = 0;
  }
  return v121;
}

uint64_t __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "boutStateMotionDwell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "boutStateMotionDwell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -objc_msgSend(v9, "compare:", v11);
  return v12;
}

uint64_t __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "boutStateSignalEnvironmentDwell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "boutStateSignalEnvironmentDwell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -objc_msgSend(v9, "compare:", v11);
  return v12;
}

- (id)collectDailyMetrics
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
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
  void *v117;
  void *v118;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328580, &unk_1E932D0A0, &unk_1E932D0B0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932D0C0, &unk_1E932D0D0, &unk_1E932D0E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932D0F0, &unk_1E932D050, &unk_1E932D100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutCounts](self, "dailyStateBoutCounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E93285B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v12, &unk_1E932C850);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("_numBoutsInPastDayLowMobility"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutDwell](self, "dailyStateBoutDwell");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", &unk_1E93285B0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("_totalDailyDwellLowMobility"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutLongestDwell](self, "dailyStateBoutLongestDwell");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E93285B0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v22, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("_durationOfLongestLowMobilityBout"));

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutCounts](self, "dailyStateBoutCounts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E93285C8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v26, "integerValue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v27, &unk_1E932C838);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("_numBoutsInPastDayMobileNoWifi"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutDwell](self, "dailyStateBoutDwell");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", &unk_1E93285C8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v31, "integerValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v32, v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("_totalDailyDwellMobileNoWifi"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutLongestDwell](self, "dailyStateBoutLongestDwell");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", &unk_1E93285C8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v36, "integerValue"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v37, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("_durationOfLongestMobileNoWifiBout"));

  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutCounts](self, "dailyStateBoutCounts");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", &unk_1E93285E0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "numberWithInteger:", objc_msgSend(v41, "integerValue"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v42, &unk_1E932C838);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("_numBoutsInPastDayMobileWithWifi"));

  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutDwell](self, "dailyStateBoutDwell");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", &unk_1E93285E0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v46, "integerValue"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v47, v5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("_totalDailyDwellMobileWithWifi"));

  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateBoutLongestDwell](self, "dailyStateBoutLongestDwell");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", &unk_1E93285E0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "numberWithInteger:", objc_msgSend(v51, "integerValue"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v52, v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, CFSTR("_durationOfLongestMobileWithWifiBout"));

  v54 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", &unk_1E93286A0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "doubleValue");
  objc_msgSend(v54, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v57, v5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v58, CFSTR("_totalDailyDwellFoliage"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", &unk_1E9328580);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "doubleValue");
  objc_msgSend(v59, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v62, v5);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v63, CFSTR("_totalDailyDwellUnavailableSignalEnvironment"));

  v64 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E9328640);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "doubleValue");
  objc_msgSend(v64, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v67, v5);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v68, CFSTR("_totalDailyDwellRural"));

  v69 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectForKeyedSubscript:", &unk_1E9328658);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "doubleValue");
  objc_msgSend(v69, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v72, v5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v73, CFSTR("_totalDailyDwellUrban"));

  v74 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E9328670);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "doubleValue");
  objc_msgSend(v74, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v77, v5);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v78, CFSTR("_totalDailyDwellDenseUrban"));

  v79 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateSignalEnvironmentDwell](self, "dailyStateSignalEnvironmentDwell");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectForKeyedSubscript:", &unk_1E9328688);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "doubleValue");
  objc_msgSend(v79, "numberWithDouble:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v82, v5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v83, CFSTR("_totalDailyDwellDenseUrbanCanyon"));

  v84 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectForKeyedSubscript:", &unk_1E93285B0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "doubleValue");
  objc_msgSend(v84, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v87, v5);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v88, CFSTR("_totalDailyDurationStationary"));

  v89 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectForKeyedSubscript:", &unk_1E93285C8);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "doubleValue");
  objc_msgSend(v89, "numberWithDouble:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v92, v5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v93, CFSTR("_totalDailyDurationWalking"));

  v94 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKeyedSubscript:", &unk_1E93285E0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "doubleValue");
  objc_msgSend(v94, "numberWithDouble:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v97, v5);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v98, CFSTR("_totalDailyDurationRunning"));

  v99 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectForKeyedSubscript:", &unk_1E9328610);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "doubleValue");
  objc_msgSend(v99, "numberWithDouble:");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v102, v5);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v103, CFSTR("_totalDailyDurationCycling"));

  v104 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "objectForKeyedSubscript:", &unk_1E93285F8);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "doubleValue");
  objc_msgSend(v104, "numberWithDouble:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v107, v5);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v108, CFSTR("_totalDailyDurationDriving"));

  v109 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "objectForKeyedSubscript:", &unk_1E9328628);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "doubleValue");
  objc_msgSend(v109, "numberWithDouble:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v112, v5);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v113, CFSTR("_totalDailyDurationMoving"));

  v114 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocationAwarenessMetricManager dailyStateMotionDwell](self, "dailyStateMotionDwell");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "objectForKeyedSubscript:", &unk_1E9328598);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "doubleValue");
  objc_msgSend(v114, "numberWithDouble:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v117, v5);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v118, CFSTR("_totalDailyDurationUnknownMotionActivity"));

  return v8;
}

- (void)submitMetrics
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, start", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager processMetrics](self, "processMetrics");
  -[RTLocationAwarenessMetricManager processLastBout](self, "processLastBout");
  -[RTLocationAwarenessMetricManager processLastDailyMetrics](self, "processLastDailyMetrics");
  -[RTLocationAwarenessMetricManager submitDailyMetricsToCoreAnalytics](self, "submitDailyMetricsToCoreAnalytics");
  -[RTLocationAwarenessMetricManager submitBoutMetricsToCoreAnalytics](self, "submitBoutMetricsToCoreAnalytics");
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v10;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, finished, latency, %.2f", (uint8_t *)&v11, 0x16u);

  }
}

- (void)submitBoutMetricsToCoreAnalytics
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType") == 1)
    goto LABEL_3;
  -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 >= 1200.0)
  {
LABEL_3:
    -[RTLocationAwarenessMetricManager updateBoutMetricsStateChangeEdgeDwell](self, "updateBoutMetricsStateChangeEdgeDwell");
    -[RTLocationAwarenessMetricManager collectBoutMetrics](self, "collectBoutMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutStart](self, "boutStateCurrBoutStart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateCurrBoutEnd](self, "boutStateCurrBoutEnd");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessMetricManager boutStateMotionDwell](self, "boutStateMotionDwell");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, bout start, %@, bout end %@, motion dwell %@", buf, 0x2Au);

    }
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = (void *)objc_msgSend(v16, "initWithCString:encoding:", RTAnalyticsEventLocationAwarenessBoutMetrics, 1);
    log_analytics_submission(v17, v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  -[RTLocationAwarenessMetricManager resetBoutMetrics](self, "resetBoutMetrics");
}

- (void)submitDailyMetricsToCoreAnalytics
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  -[RTLocationAwarenessMetricManager collectDailyMetrics](self, "collectDailyMetrics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(v2, "initWithCString:encoding:", RTAnalyticsEventLocationAwarenessDailyMetrics, 1);
  log_analytics_submission(v3, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMotionActivityManager)motionManager
{
  return self->_motionManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (double)boutMetricDistanceToSensitiveLocation
{
  return self->_boutMetricDistanceToSensitiveLocation;
}

- (void)setBoutMetricDistanceToSensitiveLocation:(double)a3
{
  self->_boutMetricDistanceToSensitiveLocation = a3;
}

- (unint64_t)boutMetricType
{
  return self->_boutMetricType;
}

- (void)setBoutMetricType:(unint64_t)a3
{
  self->_boutMetricType = a3;
}

- (double)boutMetricDuration
{
  return self->_boutMetricDuration;
}

- (void)setBoutMetricDuration:(double)a3
{
  self->_boutMetricDuration = a3;
}

- (double)boutMetricNumWifiLocationsInBout
{
  return self->_boutMetricNumWifiLocationsInBout;
}

- (void)setBoutMetricNumWifiLocationsInBout:(double)a3
{
  self->_boutMetricNumWifiLocationsInBout = a3;
}

- (double)boutMetricNumGPSLocationsInBout
{
  return self->_boutMetricNumGPSLocationsInBout;
}

- (void)setBoutMetricNumGPSLocationsInBout:(double)a3
{
  self->_boutMetricNumGPSLocationsInBout = a3;
}

- (double)boutMetricNumOtherLocationsInBout
{
  return self->_boutMetricNumOtherLocationsInBout;
}

- (void)setBoutMetricNumOtherLocationsInBout:(double)a3
{
  self->_boutMetricNumOtherLocationsInBout = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle = a3;
}

- (unint64_t)stateVariableCurrMotionActivityType
{
  return self->_stateVariableCurrMotionActivityType;
}

- (void)setStateVariableCurrMotionActivityType:(unint64_t)a3
{
  self->_stateVariableCurrMotionActivityType = a3;
}

- (NSDate)stateVariableCurrMotionStart
{
  return self->_stateVariableCurrMotionStart;
}

- (void)setStateVariableCurrMotionStart:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariableCurrMotionStart, a3);
}

- (int)stateVariableCurrSignalEnvironmentType
{
  return self->_stateVariableCurrSignalEnvironmentType;
}

- (void)setStateVariableCurrSignalEnvironmentType:(int)a3
{
  self->_stateVariableCurrSignalEnvironmentType = a3;
}

- (NSDate)stateVariablePrevLocationTimestamp
{
  return self->_stateVariablePrevLocationTimestamp;
}

- (void)setStateVariablePrevLocationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariablePrevLocationTimestamp, a3);
}

- (NSDate)stateVariablePrevWifiLocationTimestamp
{
  return self->_stateVariablePrevWifiLocationTimestamp;
}

- (void)setStateVariablePrevWifiLocationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariablePrevWifiLocationTimestamp, a3);
}

- (double)stateVariableMostRecentDistanceToSensitiveLocation
{
  return self->_stateVariableMostRecentDistanceToSensitiveLocation;
}

- (void)setStateVariableMostRecentDistanceToSensitiveLocation:(double)a3
{
  self->_stateVariableMostRecentDistanceToSensitiveLocation = a3;
}

- (NSDate)stateVariableLastSensitiveLocationCheckTimestamp
{
  return self->_stateVariableLastSensitiveLocationCheckTimestamp;
}

- (void)setStateVariableLastSensitiveLocationCheckTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariableLastSensitiveLocationCheckTimestamp, a3);
}

- (NSDate)stateVariableLastSettledStateChangeTimestamp
{
  return self->_stateVariableLastSettledStateChangeTimestamp;
}

- (void)setStateVariableLastSettledStateChangeTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariableLastSettledStateChangeTimestamp, a3);
}

- (NSDate)stateVariableLastWifiStateChangeTimestamp
{
  return self->_stateVariableLastWifiStateChangeTimestamp;
}

- (void)setStateVariableLastWifiStateChangeTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_stateVariableLastWifiStateChangeTimestamp, a3);
}

- (NSMutableDictionary)boutStateMotionDwell
{
  return self->_boutStateMotionDwell;
}

- (void)setBoutStateMotionDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateMotionDwell, a3);
}

- (NSMutableDictionary)boutStateMotionLongestDwell
{
  return self->_boutStateMotionLongestDwell;
}

- (void)setBoutStateMotionLongestDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateMotionLongestDwell, a3);
}

- (NSMutableDictionary)boutStateMotionTypeNumBouts
{
  return self->_boutStateMotionTypeNumBouts;
}

- (void)setBoutStateMotionTypeNumBouts:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateMotionTypeNumBouts, a3);
}

- (NSMutableDictionary)boutStateSignalEnvironmentDwell
{
  return self->_boutStateSignalEnvironmentDwell;
}

- (void)setBoutStateSignalEnvironmentDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateSignalEnvironmentDwell, a3);
}

- (unint64_t)boutStateMotion
{
  return self->_boutStateMotion;
}

- (void)setBoutStateMotion:(unint64_t)a3
{
  self->_boutStateMotion = a3;
}

- (unint64_t)boutStateWifi
{
  return self->_boutStateWifi;
}

- (void)setBoutStateWifi:(unint64_t)a3
{
  self->_boutStateWifi = a3;
}

- (unint64_t)boutStateTypeForLastCompleteBout
{
  return self->_boutStateTypeForLastCompleteBout;
}

- (void)setBoutStateTypeForLastCompleteBout:(unint64_t)a3
{
  self->_boutStateTypeForLastCompleteBout = a3;
}

- (NSDate)boutStateCurrBoutStart
{
  return self->_boutStateCurrBoutStart;
}

- (void)setBoutStateCurrBoutStart:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateCurrBoutStart, a3);
}

- (NSDate)boutStateCurrBoutEnd
{
  return self->_boutStateCurrBoutEnd;
}

- (void)setBoutStateCurrBoutEnd:(id)a3
{
  objc_storeStrong((id *)&self->_boutStateCurrBoutEnd, a3);
}

- (double)boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle = a3;
}

- (double)boutBufferNumGPSLocationsInBout
{
  return self->_boutBufferNumGPSLocationsInBout;
}

- (void)setBoutBufferNumGPSLocationsInBout:(double)a3
{
  self->_boutBufferNumGPSLocationsInBout = a3;
}

- (double)boutBufferNumOtherLocationsInBout
{
  return self->_boutBufferNumOtherLocationsInBout;
}

- (void)setBoutBufferNumOtherLocationsInBout:(double)a3
{
  self->_boutBufferNumOtherLocationsInBout = a3;
}

- (double)boutBufferDistanceToSensitiveLocation
{
  return self->_boutBufferDistanceToSensitiveLocation;
}

- (void)setBoutBufferDistanceToSensitiveLocation:(double)a3
{
  self->_boutBufferDistanceToSensitiveLocation = a3;
}

- (double)boutBufferMotionEdgeDwell
{
  return self->_boutBufferMotionEdgeDwell;
}

- (void)setBoutBufferMotionEdgeDwell:(double)a3
{
  self->_boutBufferMotionEdgeDwell = a3;
}

- (unint64_t)boutBufferMotionEdgeType
{
  return self->_boutBufferMotionEdgeType;
}

- (void)setBoutBufferMotionEdgeType:(unint64_t)a3
{
  self->_boutBufferMotionEdgeType = a3;
}

- (NSMutableDictionary)boutBufferMotionDwell
{
  return self->_boutBufferMotionDwell;
}

- (void)setBoutBufferMotionDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutBufferMotionDwell, a3);
}

- (NSMutableDictionary)boutBufferMotionLongestDwell
{
  return self->_boutBufferMotionLongestDwell;
}

- (void)setBoutBufferMotionLongestDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutBufferMotionLongestDwell, a3);
}

- (NSMutableDictionary)boutBufferMotionBoutCounts
{
  return self->_boutBufferMotionBoutCounts;
}

- (void)setBoutBufferMotionBoutCounts:(id)a3
{
  objc_storeStrong((id *)&self->_boutBufferMotionBoutCounts, a3);
}

- (NSMutableDictionary)boutBufferSignalEnvironmentDwell
{
  return self->_boutBufferSignalEnvironmentDwell;
}

- (void)setBoutBufferSignalEnvironmentDwell:(id)a3
{
  objc_storeStrong((id *)&self->_boutBufferSignalEnvironmentDwell, a3);
}

- (NSMutableDictionary)dailyStateSignalEnvironmentDwell
{
  return self->_dailyStateSignalEnvironmentDwell;
}

- (void)setDailyStateSignalEnvironmentDwell:(id)a3
{
  objc_storeStrong((id *)&self->_dailyStateSignalEnvironmentDwell, a3);
}

- (NSMutableDictionary)dailyStateMotionDwell
{
  return self->_dailyStateMotionDwell;
}

- (void)setDailyStateMotionDwell:(id)a3
{
  objc_storeStrong((id *)&self->_dailyStateMotionDwell, a3);
}

- (NSMutableDictionary)dailyStateBoutCounts
{
  return self->_dailyStateBoutCounts;
}

- (void)setDailyStateBoutCounts:(id)a3
{
  objc_storeStrong((id *)&self->_dailyStateBoutCounts, a3);
}

- (NSMutableDictionary)dailyStateBoutDwell
{
  return self->_dailyStateBoutDwell;
}

- (void)setDailyStateBoutDwell:(id)a3
{
  objc_storeStrong((id *)&self->_dailyStateBoutDwell, a3);
}

- (NSMutableDictionary)dailyStateBoutLongestDwell
{
  return self->_dailyStateBoutLongestDwell;
}

- (void)setDailyStateBoutLongestDwell:(id)a3
{
  objc_storeStrong((id *)&self->_dailyStateBoutLongestDwell, a3);
}

- (NSArray)sensitiveLocations
{
  return self->_sensitiveLocations;
}

- (void)setSensitiveLocations:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveLocations, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_sensitiveLocations, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutLongestDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutCounts, 0);
  objc_storeStrong((id *)&self->_dailyStateMotionDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionBoutCounts, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionLongestDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionDwell, 0);
  objc_storeStrong((id *)&self->_boutStateCurrBoutEnd, 0);
  objc_storeStrong((id *)&self->_boutStateCurrBoutStart, 0);
  objc_storeStrong((id *)&self->_boutStateSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutStateMotionTypeNumBouts, 0);
  objc_storeStrong((id *)&self->_boutStateMotionLongestDwell, 0);
  objc_storeStrong((id *)&self->_boutStateMotionDwell, 0);
  objc_storeStrong((id *)&self->_stateVariableLastWifiStateChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableLastSettledStateChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableLastSensitiveLocationCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariablePrevWifiLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariablePrevLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableCurrMotionStart, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
