@implementation SMReplayManager

- (SMReplayManager)initWithQueue:(id)a3
{
  id v5;
  SMReplayManager *v6;
  SMReplayManager *v7;
  uint64_t v8;
  NSMutableArray *mockLocations;
  uint64_t v10;
  NSMutableDictionary *locationToEtaDictionary;
  uint64_t v12;
  RTLocationSmoother *locationSmoother;
  uint64_t v14;
  NSMutableArray *mockMotionActivities;
  uint64_t v16;
  NSMutableArray *timerStack;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SMReplayManager;
  v6 = -[SMReplayManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_opt_new();
    mockLocations = v7->_mockLocations;
    v7->_mockLocations = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    locationToEtaDictionary = v7->_locationToEtaDictionary;
    v7->_locationToEtaDictionary = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    locationSmoother = v7->_locationSmoother;
    v7->_locationSmoother = (RTLocationSmoother *)v12;

    v14 = objc_opt_new();
    mockMotionActivities = v7->_mockMotionActivities;
    v7->_mockMotionActivities = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    timerStack = v7->_timerStack;
    v7->_timerStack = (NSMutableArray *)v16;

    -[SMReplayManager _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *results;
  NSMutableDictionary *v6;
  NSMutableDictionary *defaults;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SMReplayManager _setup]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[SMReplayManager _createEvaluatorDict](self, "_createEvaluatorDict");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v4;

  -[SMReplayManager _createDefaultsDict](self, "_createDefaultsDict");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  defaults = self->_defaults;
  self->_defaults = v6;

  *(_WORD *)&self->_predominantMotionActivitySet = 0;
}

- (id)mockedCurrentDate
{
  return self->_currentDate;
}

- (unint64_t)mockedCurrentPredominantMotionActivityType
{
  return self->_currentPredominantMotionActivityType;
}

- (double)mockedMapsExpectedETA
{
  return self->_currentMapsExpectedETA;
}

- (id)_createEvaluatorDict
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = MEMORY[0x1E0C9AAA0];
  v20[0] = MEMORY[0x1E0C9AAA0];
  v19[0] = CFSTR("value");
  v19[1] = CFSTR("date");
  v4 = (void *)objc_opt_new();
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("_triggered"));

  v17[1] = CFSTR("date");
  v18[0] = v3;
  v17[0] = CFSTR("value");
  v6 = (void *)objc_opt_new();
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("_noProgress"));

  v15[1] = CFSTR("date");
  v16[0] = v3;
  v15[0] = CFSTR("value");
  v8 = (void *)objc_opt_new();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("_etaTriggered"));

  v13[1] = CFSTR("date");
  v14[0] = v3;
  v13[0] = CFSTR("value");
  v10 = (void *)objc_opt_new();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("_routeDeviationTriggered"));

  return v2;
}

- (id)_createDefaultsDict
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationLastLockDateKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationLastUnlockDateKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationModeOfTransportKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationNominalMapsExpectedTravelTimeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationRemainingDistanceKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationRoundTripReminderDateKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationTimeToUpdateStatusKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationStatusKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationUpperBoundCrowFliesEtaKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationUpperBoundMapsEtaKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationScaleFactorInternalKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("RTDefaultsSMTriggerDestinationMuteRouteDeviationTriggerWithinThresholdKey"));
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SMReplayManager setObject:forKey:]";
      v14 = 1024;
      v15 = 125;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

  }
  -[SMReplayManager defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    v11 = v6;
  else
    v11 = 0;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v7);

}

- (id)objectForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[SMReplayManager objectForKey:value:]";
      v16 = 1024;
      v17 = 135;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
  -[SMReplayManager defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMReplayManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SMReplayManager setObject:forKey:](self, "setObject:forKey:", v7, v6);
    v12 = v7;
  }

  return v12;
}

- (void)setCurrentPredominantMotionActivityType:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v12 = 136315394;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    v14 = 2112;
    v15 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, setting currentPredominantMotionActivityType to, %@", (uint8_t *)&v12, 0x16u);
  }

  self->_currentPredominantMotionActivityType = a3;
  self->_predominantMotionActivitySet = 1;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[SMReplayManager results](self, "results");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (self->_currentPredominantMotionActivityType)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = 136315650;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, results, %@, noProgressTriggered, %@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)setNoProgressTriggered:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v3 = a3;
  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = -[SMReplayManager muteTriggers](self, "muteTriggers");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v26 = 136315138;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, triggers muted", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v26 = 136315394;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      v28 = 2112;
      v29 = (uint64_t)v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, setting noProgressTriggered to, %@", (uint8_t *)&v26, 0x16u);
    }

    if (v3)
    {
      -[SMReplayManager results](self, "results");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("_triggered"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("date"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReplayManager mockedCurrentDate](self, "mockedCurrentDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      objc_msgSend(v12, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      v15 = MEMORY[0x1E0C9AAB0];
      v34[0] = CFSTR("value");
      v34[1] = CFSTR("date");
      v35[0] = MEMORY[0x1E0C9AAB0];
      v35[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReplayManager results](self, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("_triggered"));

      v32[1] = CFSTR("date");
      v33[0] = v15;
      v32[0] = CFSTR("value");
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReplayManager mockedCurrentDate](self, "mockedCurrentDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReplayManager results](self, "results");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("_noProgress"));

      -[SMReplayManager evaluateResults](self, "evaluateResults");
    }
    self->_noProgressTriggered = v3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[SMReplayManager results](self, "results");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (self->_noProgressTriggered)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v26 = 136315650;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, results, %@, noProgressTriggered, %@", (uint8_t *)&v26, 0x20u);

    }
  }

}

- (void)setRouteDeviationTriggered:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v3 = a3;
  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = -[SMReplayManager muteTriggers](self, "muteTriggers");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v26 = 136315138;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, triggers muted", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v26 = 136315394;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      v28 = 2112;
      v29 = (uint64_t)v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, setting routeDeviationTriggered to, %@", (uint8_t *)&v26, 0x16u);
    }

    if (v3)
    {
      -[SMReplayManager results](self, "results");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("_triggered"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("date"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReplayManager mockedCurrentDate](self, "mockedCurrentDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      objc_msgSend(v12, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      v15 = MEMORY[0x1E0C9AAB0];
      v34[0] = CFSTR("value");
      v34[1] = CFSTR("date");
      v35[0] = MEMORY[0x1E0C9AAB0];
      v35[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReplayManager results](self, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("_triggered"));

      v32[1] = CFSTR("date");
      v33[0] = v15;
      v32[0] = CFSTR("value");
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReplayManager mockedCurrentDate](self, "mockedCurrentDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReplayManager results](self, "results");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("_routeDeviationTriggered"));

      -[SMReplayManager evaluateResults](self, "evaluateResults");
    }
    self->_routeDeviationTriggered = v3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[SMReplayManager results](self, "results");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (self->_routeDeviationTriggered)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v26 = 136315650;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, results, %@, routeDeviationTriggered, %@", (uint8_t *)&v26, 0x20u);

    }
  }

}

- (void)setCurrentDate:(id)a3
{
  NSDate *v4;
  NSObject *v5;
  void *v6;
  NSDate *currentDate;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (NSDate *)a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[NSDate stringFromDate](v4, "stringFromDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SMReplayManager setCurrentDate:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s currentDate, %@", (uint8_t *)&v8, 0x16u);

  }
  -[SMReplayManager _updateTimerStackForDate:](self, "_updateTimerStackForDate:", v4);
  currentDate = self->_currentDate;
  self->_currentDate = v4;

}

- (void)setCrowFliesWalkingSpeed:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMReplayManager setCrowFliesWalkingSpeed:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s crowFliesWalkingSpeed, %.2f", (uint8_t *)&v7, 0x16u);
  }

  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[SMReplayManager setCrowFliesWalkingSpeed:]";
      v9 = 2048;
      v10 = a3;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s invalid crowFliesWalkingSpeed, %.2f", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    self->_crowFliesWalkingSpeed = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaults, "setObject:forKeyedSubscript:", v6, CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"));
  }

}

- (void)setDestinationLocation:(id)a3
{
  CLLocation *v4;
  NSObject *v5;
  CLLocation *destinationLocation;
  int v7;
  const char *v8;
  __int16 v9;
  CLLocation *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (CLLocation *)a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMReplayManager setDestinationLocation:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s destinationLocation, %@", (uint8_t *)&v7, 0x16u);
  }

  destinationLocation = self->_destinationLocation;
  self->_destinationLocation = v4;

}

- (void)setResultsPath:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *resultsPath;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMReplayManager setResultsPath:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s resultsPath, %@", (uint8_t *)&v7, 0x16u);
  }

  resultsPath = self->_resultsPath;
  self->_resultsPath = v4;

}

- (void)setEtaScaleFactor:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMReplayManager setEtaScaleFactor:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s etaScaleFactor, %.2f", (uint8_t *)&v7, 0x16u);
  }

  self->_etaScaleFactor = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaults, "setObject:forKeyedSubscript:", v6, CFSTR("RTDefaultsSMTriggerDestinationScaleFactorInternalKey"));

}

- (void)setMuteMapsExpectedETA:(double)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (a3 > 0.0)
      v6 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[SMReplayManager setMuteMapsExpectedETA:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s muteMapsExpectedETA, %@", (uint8_t *)&v8, 0x16u);
  }

  if (a3 > 0.0)
  {
    self->_muteMapsExpectedETA = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaults, "setObject:forKeyedSubscript:", v7, CFSTR("RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"));

  }
}

- (void)setMuteRouteDeviationTriggerWithinThreshold:(double)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (a3 > 0.0)
      v6 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[SMReplayManager setMuteRouteDeviationTriggerWithinThreshold:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s muteRouteDeviationTriggerWithinThreshold, %@", (uint8_t *)&v8, 0x16u);
  }

  if (a3 > 0.0)
  {
    self->_muteRouteDeviationTriggerWithinThreshold = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaults, "setObject:forKeyedSubscript:", v7, CFSTR("RTDefaultsSMTriggerDestinationMuteRouteDeviationTriggerWithinThresholdKey"));

  }
}

- (void)setMinDistanceETAUpdateThreshold:(double)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (a3 != 0.0)
      v6 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[SMReplayManager setMinDistanceETAUpdateThreshold:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s minDistanceETAUptdateThreshold, %@", (uint8_t *)&v8, 0x16u);
  }

  self->_minDistanceETAUpdateThreshold = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaults, "setObject:forKeyedSubscript:", v7, CFSTR("RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey"));

}

- (void)addMotionActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SMReplayManager addMotionActivity:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[SMReplayManager mockMotionActivities](self, "mockMotionActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "-[SMReplayManager fetchMotionActivitiesFromStartDate:endDate:handler:]";
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
    }

    -[SMReplayManager _fetchMotionActivitiesFromStartDate:endDate:handler:](self, "_fetchMotionActivitiesFromStartDate:endDate:handler:", v10, v9, v8);
  }
}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v8 = (void (**)(id, void *, _QWORD))a5;
    v9 = a4;
    v10 = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SMReplayManager _fetchMotionActivitiesFromStartDate:endDate:handler:]";
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("startDate"), v10, CFSTR("startDate"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray filteredArrayUsingPredicate:](self->_mockMotionActivities, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13, 0);

  }
}

- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SMReplayManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  -[SMReplayManager _fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](self, "_fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v10, v9, v8);
}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8;
  void (**v9)(id, unint64_t, _QWORD);
  NSObject *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
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
  char v30;
  id v31;
  RTMotionActivityHistogram *v32;
  RTMotionActivityHistogram *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  NSObject *v39;
  _BYTE *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = a4;
  v9 = (void (**)(id, unint64_t, _QWORD))a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 388;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  if (-[SMReplayManager predominantMotionActivitySet](self, "predominantMotionActivitySet", v36))
    v9[2](v9, -[SMReplayManager currentPredominantMotionActivityType](self, "currentPredominantMotionActivityType"), 0);
  v12 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v49 = __Block_byref_object_copy__43;
  v50 = __Block_byref_object_dispose__43;
  v51 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__43;
  v46 = __Block_byref_object_dispose__43;
  v47 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __90__SMReplayManager__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
  v38[3] = &unk_1E9296EE0;
  v40 = buf;
  v41 = &v42;
  v13 = v12;
  v39 = v13;
  -[SMReplayManager _fetchMotionActivitiesFromStartDate:endDate:handler:](self, "_fetchMotionActivitiesFromStartDate:endDate:handler:", v37, v8, v38);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_324);
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
    *(_WORD *)v53 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v53, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v53 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

    v30 = 0;
  }
  else
  {
LABEL_14:
    v29 = 0;
    v30 = 1;
  }

  v31 = v29;
  if ((v30 & 1) == 0)
    objc_storeStrong(v43 + 5, v29);
  if (v43[5])
  {
    v9[2](v9, 0, 0);
  }
  else
  {
    v32 = [RTMotionActivityHistogram alloc];
    v33 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:](v32, "initWithActivites:betweenDate:andDate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v37, v8);
    -[RTMotionActivityHistogram binsSortedByInterval](v33, "binsSortedByInterval");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, objc_msgSend(v35, "type"), 0);

  }
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(buf, 8);
}

void __90__SMReplayManager__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_addLocation:(id)a3 eta:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SMReplayManager destinationLocation](self, "destinationLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distanceFromLocation:", v7);
  v9 = v8;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 >= 100.0)
  {
    if (v11)
    {
      -[SMReplayManager destinationLocation](self, "destinationLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315906;
      v18 = "-[SMReplayManager _addLocation:eta:]";
      v19 = 2048;
      v20 = v9;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v12;
      v13 = "%s, triggers unmuted with distance, %.2f, location, %@, destination, %@";
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    -[SMReplayManager destinationLocation](self, "destinationLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315906;
    v18 = "-[SMReplayManager _addLocation:eta:]";
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v12;
    v13 = "%s, triggers muted with distance, %.2f, location, %@, destination, %@";
LABEL_6:
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x2Au);

  }
  -[SMReplayManager setMuteTriggers:](self, "setMuteTriggers:", v9 < 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReplayManager locationToEtaDictionary](self, "locationToEtaDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v6);

  -[SMReplayManager setCurrentMapsExpectedETA:](self, "setCurrentMapsExpectedETA:", a4);
  -[SMReplayManager mockLocations](self, "mockLocations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v6);

}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SMReplayManager fetchStoredLocationsWithOptions:handler:]";
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[SMReplayManager _fetchStoredLocationsWithOptions:handler:](self, "_fetchStoredLocationsWithOptions:handler:", v7, v6);
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
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
  void (**v60)(_QWORD, _QWORD, _QWORD);
  _QWORD v61[4];
  _QWORD v62[3];
  _BYTE buf[12];
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v5)
  {
    if (v6)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
    v64 = 1024;
    v65 = 456;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
      v64 = 1024;
      v65 = 457;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(v5, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v5, "dateInterval");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  objc_msgSend(v5, "horizontalAccuracy");
  v60 = v7;
  if (v21 == 0.0)
  {
    v23 = 1.79769313e308;
  }
  else
  {
    objc_msgSend(v5, "horizontalAccuracy");
    v23 = v22;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3528];
  v58 = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), v15, CFSTR("timestamp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v26;
  v57 = v20;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v27;
  v28 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("horizontalAccuracy"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addObject:", v32);
  objc_msgSend(v5, "boundingBoxLocation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(v5, "boundingBoxLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "coordinate");
    objc_msgSend(v5, "boundingBoxLocation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "coordinate");
    objc_msgSend(v5, "boundingBoxLocation");
    v56 = v24;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "horizontalAccuracy");
    RTCommonCalculateBoundingBox();

    v53 = (void *)MEMORY[0x1E0CB3528];
    v37 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "predicateWithFormat:", CFSTR("%@ <= %K"), v54, CFSTR("coordinate.latitude"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v52;
    v38 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v32;
    objc_msgSend(v38, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("coordinate.longitude"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v40;
    v41 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predicateWithFormat:", CFSTR("%@ <= %K"), v42, CFSTR("coordinate.latitude"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v43;
    v44 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("coordinate.latitude"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "andPredicateWithSubpredicates:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v55;
    v24 = v56;

    objc_msgSend(v56, "addObject:", v48);
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v24);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReplayManager mockLocations](self, "mockLocations");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "filteredArrayUsingPredicate:", v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, _QWORD))v60)[2](v60, v51, 0);
}

- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SMReplayManager fetchCurrentLocationWithOptions:handler:]";
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[SMReplayManager _fetchCurrentLocationWithOptions:handler:](self, "_fetchCurrentLocationWithOptions:handler:", v7, v6);
}

- (void)_fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SMReplayManager _fetchCurrentLocationWithOptions:handler:]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[SMReplayManager mockLocations](self, "mockLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[SMReplayManager mockLocations](self, "mockLocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10, 0);

  }
  else
  {
    v5[2](v5, 0, 0);
  }

}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "-[SMReplayManager fetchEstimatedLocationAtDate:options:handler:]";
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v14, 0xCu);
  }

  v12 = v9;
  v13 = v12;
  if (!v12)
    v13 = objc_alloc_init(MEMORY[0x1E0D18380]);
  -[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:](self, "_fetchEstimatedLocationAtDate:options:handler:", v8, v12, v10);

}

- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  id *v23;
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
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  double v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  SEL v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t v77[16];
  uint64_t v78;
  const __CFString *v79;
  _BYTE v80[12];
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE buf[24];
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  const __CFString *v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v63 = v7;
  if (!v7)
  {
    v10 = v8;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 568;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    v8 = v10;
  }
  v62 = v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 569;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 570;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v9)
  {
    objc_msgSend(v62, "timeInterval");
    if (v15 >= 0.0)
      v16 = v15;
    else
      v16 = 30.0;
    v17 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v63, "dateByAddingTimeInterval:", -v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dateByAddingTimeInterval:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

    v20 = objc_alloc(MEMORY[0x1E0D184F0]);
    v60 = (void *)objc_msgSend(v20, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v61, 100, 0, *MEMORY[0x1E0C9E4A8]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v86 = __Block_byref_object_copy__43;
    v87 = __Block_byref_object_dispose__43;
    v88 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__43;
    v75 = __Block_byref_object_dispose__43;
    v76 = 0;
    v21 = dispatch_semaphore_create(0);
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke;
    v67[3] = &unk_1E9296EE0;
    v69 = &v71;
    v70 = buf;
    v22 = v21;
    v68 = v22;
    -[SMReplayManager _fetchStoredLocationsWithOptions:handler:](self, "_fetchStoredLocationsWithOptions:handler:", v60, v67);
    v23 = (id *)(*(_QWORD *)&buf[8] + 40);
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    v24 = v22;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v24, v26))
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", obj);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v25);
    v29 = v28;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_324);
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
      *(_WORD *)v77 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v91[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v80 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v91, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

      objc_storeStrong(v23, v39);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v56 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v80 = 136315394;
        *(_QWORD *)&v80[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
        v81 = 2112;
        v82 = v56;
        _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%s, error, %@", v80, 0x16u);
      }

    }
    else
    {
LABEL_26:

      objc_storeStrong(v23, obj);
      if (objc_msgSend((id)v72[5], "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v72[5], "count"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)v72[5];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_91;
        v64[3] = &unk_1E929B920;
        v43 = v41;
        v65 = v43;
        v66 = a2;
        objc_msgSend(v42, "enumerateObjectsUsingBlock:", v64);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "averageSpeed");
        if (v45 >= 0.0)
        {
          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v62, "averageSpeed");
          objc_msgSend(v46, "numberWithDouble:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v47, CFSTR("kRTLocationSmootherAverageMovingSpeed"));

        }
        if (objc_msgSend(v62, "enableFallbackModel", obj))
          objc_msgSend(v44, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kRTLocationSmootherEnableFallbackModel"));
        -[SMReplayManager locationSmoother](self, "locationSmoother");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "timeIntervalSinceReferenceDate");
        objc_msgSend(v48, "estimateLocationWithLocations:timestamp:parameters:meta:", v43, v44, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v63, "stringFromDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v80 = 136315650;
          *(_QWORD *)&v80[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
          v81 = 2112;
          v82 = v49;
          v83 = 2112;
          v84 = v51;
          _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%s, estimated location, %@, on date, %@", v80, 0x20u);

        }
        if (v49 && (objc_msgSend(v49, "horizontalAccuracy"), v52 > 0.0))
        {
          v9[2](v9, v49, 0);
        }
        else
        {
          v78 = *MEMORY[0x1E0CB2D50];
          v79 = CFSTR("Failed to estimate a location.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 6, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v9)[2](v9, 0, v55);

        }
        goto LABEL_42;
      }
    }
    v9[2](v9, 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
LABEL_42:

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_43;
  }
  v89 = *MEMORY[0x1E0CB2D50];
  v90 = CFSTR("A completion handler is a required parameter.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v60;
    _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "A completion handler is a required parameter, %@", buf, 0xCu);
  }

LABEL_43:
}

void __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_91(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  _OWORD v14[2];
  uint8_t buf[32];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "horizontalAccuracy");
  if (v6 <= 30.0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "horizontalAccuracy");
    if (v7 <= 165.0)
      v8 = 4;
    else
      v8 = 0;
  }
  memset(v14, 0, 28);
  v13 = 0u;
  if (v5)
    objc_msgSend(v5, "clientLocation");
  LODWORD(v13) = v8;
  v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v20 = v13;
  v21 = 0u;
  v22[0] = v14[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v14 + 12);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  memset(buf, 0, sizeof(buf));
  v10 = (void *)objc_msgSend(v9, "initWithClientLocation:", buf);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = a3;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, input location, %@, idx, %ld", buf, 0x20u);

  }
}

- (void)cacheTimer:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SMReplayManager cacheTimer:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMReplayManager _cacheTimer:](self, "_cacheTimer:", v4);
}

- (void)_cacheTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[SMReplayManager _cacheTimer:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v18, 0xCu);
  }

  -[SMReplayManager timerStack](self, "timerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReplayManager timerStack](self, "timerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_31);

  -[SMReplayManager timerStack](self, "timerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v4, v8);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager mockedCurrentDate](self, "mockedCurrentDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager timerStack](self, "timerStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager _timerStackToString:](self, "_timerStackToString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136316162;
    v19 = "-[SMReplayManager _cacheTimer:]";
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, cached timer with identifier, %@, endDate, %@, currentDate, %@, timerStack, %@", (uint8_t *)&v18, 0x34u);

  }
}

uint64_t __31__SMReplayManager__cacheTimer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)invalidateTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SMReplayManager invalidateTimerWithIdentifier:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMReplayManager _invalidateTimerWithIdentifier:](self, "_invalidateTimerWithIdentifier:", v4);
}

- (void)_invalidateTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
      v30 = 1024;
      LODWORD(v31) = 717;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SMReplayManager timerStack](self, "timerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[SMReplayManager timerStack](self, "timerStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager _timerStackToString:](self, "_timerStackToString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v9;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, invalidating timer with identifier, %@, timerStackCount, %lu, timerStack, %@", buf, 0x2Au);

  }
  -[SMReplayManager timerStack](self, "timerStack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__SMReplayManager__invalidateTimerWithIdentifier___block_invoke;
  v26[3] = &unk_1E929B988;
  v14 = v4;
  v27 = v14;
  objc_msgSend(v13, "predicateWithBlock:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%s, timersToRemove FIRST, %@", buf, 0x16u);
  }

  -[SMReplayManager timerStack](self, "timerStack");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsInArray:", v16);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    -[SMReplayManager timerStack](self, "timerStack");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    -[SMReplayManager timerStack](self, "timerStack");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager _timerStackToString:](self, "_timerStackToString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager _timerStackToString:](self, "_timerStackToString:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 136316418;
    v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    v30 = 2112;
    v31 = v14;
    v32 = 2048;
    v33 = v21;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v24;
    v38 = 2048;
    v39 = v25;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%s, finished invalidating timer with identifier, %@, timerStackCount, %lu, timerStack, %@, timersToRemove, %@, count, %lu", buf, 0x3Eu);

  }
}

uint64_t __50__SMReplayManager__invalidateTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_updateTimerStackForDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  dispatch_once_t *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  dispatch_once_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDate *v27;
  NSDate *currentDate;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  __int128 v47;
  id v48;
  _QWORD block[4];
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v48 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "stringFromDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager timerStack](self, "timerStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReplayManager _timerStackToString:](self, "_timerStackToString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v52 = "-[SMReplayManager _updateTimerStackForDate:]";
    v53 = 2112;
    v54 = v6;
    v55 = 2112;
    v56 = v8;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, ENTERING WITH DATE, %@, TIMER STACK, %@ ", buf, 0x20u);

    v4 = v48;
  }

  -[SMReplayManager timerStack](self, "timerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v12 = RTLogFacilitySafetyMonitor;
    v13 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v11 = 136315906;
    v47 = v11;
    while (1)
    {
      -[SMReplayManager timerStack](self, "timerStack", v47);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isAfterDate:", v4);

      _rt_log_facility_get_os_log(v12);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v17)
        break;
      if (v19)
      {
        objc_msgSend(v15, "identifier");
        v20 = v12;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringFromDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringFromDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringFromDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v52 = "-[SMReplayManager _updateTimerStackForDate:]";
        v53 = 2112;
        v54 = v21;
        v55 = 2112;
        v56 = v23;
        v57 = 2112;
        v58 = (uint64_t)v24;
        v59 = 2112;
        v60 = v26;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%s, firing timer with identifier, %@, endDate, %@, old currentDate, %@, newCurrentDate, %@", buf, 0x34u);

        v12 = v20;
        v13 = MEMORY[0x1E0C809B0];

        v4 = v48;
      }

      objc_msgSend(v15, "endDate");
      v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
      currentDate = self->_currentDate;
      self->_currentDate = v27;

      objc_msgSend(v15, "queue");
      v29 = objc_claimAutoreleasedReturnValue();
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __44__SMReplayManager__updateTimerStackForDate___block_invoke;
      block[3] = &unk_1E92977B8;
      v30 = v15;
      v50 = v30;
      dispatch_async(v29, block);

      -[SMReplayManager timerStack](self, "timerStack");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        -[SMReplayManager timerStack](self, "timerStack");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeObjectAtIndex:", 0);

        _rt_log_facility_get_os_log(v12);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v30, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "endDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringFromDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReplayManager timerStack](self, "timerStack");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");
          *(_DWORD *)buf = v47;
          v52 = "-[SMReplayManager _updateTimerStackForDate:]";
          v53 = 2112;
          v54 = v35;
          v55 = 2112;
          v56 = v37;
          v57 = 2048;
          v58 = v39;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%s, removing timer with identifier, %@, endDate, %@, remaining timer count after removal, %lu", buf, 0x2Au);

          v4 = v48;
        }

      }
      -[SMReplayManager timerStack](self, "timerStack");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (!v41)
        goto LABEL_17;
    }
    if (v19)
    {
      objc_msgSend(v15, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringFromDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v47;
      v52 = "-[SMReplayManager _updateTimerStackForDate:]";
      v53 = 2112;
      v54 = v42;
      v55 = 2112;
      v56 = v44;
      v57 = 2112;
      v58 = (uint64_t)v45;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%s, timer with identifier, %@, endDate, %@, has later fire date than new current date, %@", buf, 0x2Au);

      v4 = v48;
    }

  }
LABEL_17:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[SMReplayManager _updateTimerStackForDate:]";
    _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "%s, exit", buf, 0xCu);
  }

}

void __44__SMReplayManager__updateTimerStackForDate___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)onTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  int v10;
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
    v10 = 136315394;
    v11 = "-[SMReplayManager onTriggerNotification:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, notification, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMTriggerNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v4;
    if (objc_msgSend(v9, "triggerCategory") == 3)
    {
      -[SMReplayManager setNoProgressTriggered:](self, "setNoProgressTriggered:", 1);
    }
    else if (objc_msgSend(v9, "triggerCategory") == 4)
    {
      -[SMReplayManager setRouteDeviationTriggered:](self, "setRouteDeviationTriggered:", 1);
    }

  }
}

- (void)evaluateResults
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SMReplayManager results](self, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SMReplayManager evaluateResults]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, evaluating results, %@", (uint8_t *)&v12, 0x16u);

  }
  v5 = (void *)MEMORY[0x1E0CB36D8];
  -[SMReplayManager results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMReplayManager resultsPath](self, "resultsPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  if (v8)
  {
    -[SMReplayManager resultsPath](self, "resultsPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/tmp/results_json.json"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "writeToURL:atomically:", v11, 1);

}

- (id)_timerStackToString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_msgSend(a3, "copy");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = CFSTR("TimerStack:");
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR(" [timerIdentifier, %@, timer fire date, %@] "), v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v14);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  else
  {
    v6 = CFSTR("TimerStack:");
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (double)currentMapsExpectedETA
{
  return self->_currentMapsExpectedETA;
}

- (void)setCurrentMapsExpectedETA:(double)a3
{
  self->_currentMapsExpectedETA = a3;
}

- (unint64_t)currentPredominantMotionActivityType
{
  return self->_currentPredominantMotionActivityType;
}

- (NSMutableArray)replayEvents
{
  return self->_replayEvents;
}

- (void)setReplayEvents:(id)a3
{
  objc_storeStrong((id *)&self->_replayEvents, a3);
}

- (NSMutableArray)mockLocations
{
  return self->_mockLocations;
}

- (void)setMockLocations:(id)a3
{
  objc_storeStrong((id *)&self->_mockLocations, a3);
}

- (NSMutableDictionary)locationToEtaDictionary
{
  return self->_locationToEtaDictionary;
}

- (void)setLocationToEtaDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_locationToEtaDictionary, a3);
}

- (NSMutableArray)mockMotionActivities
{
  return self->_mockMotionActivities;
}

- (void)setMockMotionActivities:(id)a3
{
  objc_storeStrong((id *)&self->_mockMotionActivities, a3);
}

- (NSMutableArray)timerStack
{
  return self->_timerStack;
}

- (void)setTimerStack:(id)a3
{
  objc_storeStrong((id *)&self->_timerStack, a3);
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSString)resultsPath
{
  return self->_resultsPath;
}

- (double)etaScaleFactor
{
  return self->_etaScaleFactor;
}

- (double)muteMapsExpectedETA
{
  return self->_muteMapsExpectedETA;
}

- (double)muteRouteDeviationTriggerWithinThreshold
{
  return self->_muteRouteDeviationTriggerWithinThreshold;
}

- (double)minDistanceETAUpdateThreshold
{
  return self->_minDistanceETAUpdateThreshold;
}

- (double)crowFliesWalkingSpeed
{
  return self->_crowFliesWalkingSpeed;
}

- (CLLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (BOOL)noProgressTriggered
{
  return self->_noProgressTriggered;
}

- (BOOL)routeDeviationTriggered
{
  return self->_routeDeviationTriggered;
}

- (BOOL)predominantMotionActivitySet
{
  return self->_predominantMotionActivitySet;
}

- (void)setPredominantMotionActivitySet:(BOOL)a3
{
  self->_predominantMotionActivitySet = a3;
}

- (BOOL)muteTriggers
{
  return self->_muteTriggers;
}

- (void)setMuteTriggers:(BOOL)a3
{
  self->_muteTriggers = a3;
}

- (RTLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
  objc_storeStrong((id *)&self->_locationSmoother, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_resultsPath, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_timerStack, 0);
  objc_storeStrong((id *)&self->_mockMotionActivities, 0);
  objc_storeStrong((id *)&self->_locationToEtaDictionary, 0);
  objc_storeStrong((id *)&self->_mockLocations, 0);
  objc_storeStrong((id *)&self->_replayEvents, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
