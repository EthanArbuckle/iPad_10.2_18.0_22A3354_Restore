@implementation RTIntermittentGNSSManagerMetrics

- (void)updateSessionLocationCount:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__RTIntermittentGNSSManagerMetrics_updateSessionLocationCount___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

_BYTE *__63__RTIntermittentGNSSManagerMetrics_updateSessionLocationCount___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[8])
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "setCurrentSessionNumLocationsReceived:", *(int *)(a1 + 40) + objc_msgSend(result, "currentSessionNumLocationsReceived"));
  return result;
}

- (RTIntermittentGNSSManagerMetrics)initWithDefaultsManager:(id)a3 timerManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTIntermittentGNSSManagerMetrics *v10;
  id *p_isa;
  id *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  RTIntermittentGNSSManagerMetrics *v17;
  id v18;
  dispatch_queue_t v19;
  id v20;
  uint64_t v21;
  id v22;
  objc_super v24;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: defaultsManager";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTIntermittentGNSSManagerMetrics;
  v10 = -[RTIntermittentGNSSManagerMetrics init](&v24, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultsManager, a3);
    objc_storeStrong(p_isa + 3, a4);
    v12 = p_isa;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v12);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v18, "UTF8String");

    }
    v19 = dispatch_queue_create(v14, v13);

    v20 = v12[5];
    v12[5] = v19;

    v21 = objc_opt_new();
    v22 = v12[4];
    v12[4] = (id)v21;

    objc_msgSend(v12, "setup");
  }
  self = p_isa;
  v17 = self;
LABEL_13:

  return v17;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RTIntermittentGNSSManagerMetrics_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__RTIntermittentGNSSManagerMetrics_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  void *v3;

  self->_mostRecentSignalSwitch = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_powerLogEventDictionary, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Enabled"));
  +[RTIntermittentGNSSManagerMetrics signalCategoryToString:](RTIntermittentGNSSManagerMetrics, "signalCategoryToString:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_powerLogEventDictionary, "setObject:forKeyedSubscript:", v3, CFSTR("Reason"));

  -[RTIntermittentGNSSManagerMetrics _clearSessionMetrics](self, "_clearSessionMetrics");
  -[RTIntermittentGNSSManagerMetrics _clearStreakMetrics](self, "_clearStreakMetrics");
}

- (void)shutdown
{
  NSObject *v3;
  _QWORD block[5];

  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__RTIntermittentGNSSManagerMetrics_shutdown__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __44__RTIntermittentGNSSManagerMetrics_shutdown__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "streakMetricsTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setStreakMetricsTimer:", 0);
}

- (double)_getCurrentSessionDuration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSLastRegistrationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  return v9;
}

- (id)getLastRegistrationDate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__44;
  v11 = __Block_byref_object_dispose__44;
  v12 = 0;
  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__RTIntermittentGNSSManagerMetrics_getLastRegistrationDate__block_invoke;
  v6[3] = &unk_1E929A690;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__RTIntermittentGNSSManagerMetrics_getLastRegistrationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getLastRegistrationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getLastRegistrationDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSLastRegistrationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)signalCategoryToString:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("RTIntermittentGNSSManagerSignalCategoryUnknown");
  else
    return off_1E929BA48[a3 - 1];
}

- (void)updateMetricsForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__RTIntermittentGNSSManagerMetrics_updateMetricsForKey___block_invoke;
    v7[3] = &unk_1E9297540;
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
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", buf, 2u);
    }

  }
}

uint64_t __56__RTIntermittentGNSSManagerMetrics_updateMetricsForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMetricsForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_updateMetricsForKey:(id)a3
{
  id v4;
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
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  void *v65;
  RTIntermittentGNSSManagerMetrics *v66;
  id v67;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", (uint8_t *)location, 2u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("register")))
  {
    -[RTIntermittentGNSSManagerMetrics setCurrentSessionOngoing:](self, "setCurrentSessionOngoing:", 1);
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("RTDefaultsIntermittentGNSSLastRegistrationDate"));

    -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Enabled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Reason"));

    -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogRegisteredEvent();

    -[RTIntermittentGNSSManagerMetrics setCurrentSessionActivationCriteria:](self, "setCurrentSessionActivationCriteria:", -[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch"));
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSLastUnregistrationDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSLastRegistrationDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13
      && (objc_msgSend(v15, "timeIntervalSinceDate:", v13),
          -[RTIntermittentGNSSManagerMetrics setCurrentSessionTimeSinceLastSession:](self, "setCurrentSessionTimeSinceLastSession:"), -[RTIntermittentGNSSManagerMetrics currentSessionTimeSinceLastSession](self, "currentSessionTimeSinceLastSession"), v16 <= 1200.0))
    {
      -[RTIntermittentGNSSManagerMetrics setCurrentStreakNumSessions:](self, "setCurrentStreakNumSessions:", -[RTIntermittentGNSSManagerMetrics currentStreakNumSessions](self, "currentStreakNumSessions") + 1);
    }
    else
    {
      if (-[RTIntermittentGNSSManagerMetrics currentStreakOngoing](self, "currentStreakOngoing"))
        -[RTIntermittentGNSSManagerMetrics _submitStreakMetricsToCoreAnalytics](self, "_submitStreakMetricsToCoreAnalytics");
      -[RTIntermittentGNSSManagerMetrics setCurrentStreakOngoing:](self, "setCurrentStreakOngoing:", 1);
      -[RTIntermittentGNSSManagerMetrics setCurrentStreakNumSessions:](self, "setCurrentStreakNumSessions:", -[RTIntermittentGNSSManagerMetrics currentStreakNumSessions](self, "currentStreakNumSessions") + 1);
      -[RTIntermittentGNSSManagerMetrics setCurrentStreakActivationCriteria:](self, "setCurrentStreakActivationCriteria:", -[RTIntermittentGNSSManagerMetrics currentSessionActivationCriteria](self, "currentSessionActivationCriteria"));
    }

    goto LABEL_32;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("unregister")))
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[RTIntermittentGNSSManagerMetrics _updateMetricsForKey:]";
      _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%s, command not recognized for metrics update", (uint8_t *)location, 0xCu);
    }
LABEL_10:

    goto LABEL_32;
  }
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionOngoing:](self, "setCurrentSessionOngoing:", 0);
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("RTDefaultsIntermittentGNSSLastUnregistrationDate"));

  -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("Reason"));

  -[RTIntermittentGNSSManagerMetrics powerLogEventDictionary](self, "powerLogEventDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogRegisteredEvent();

  -[RTIntermittentGNSSManagerMetrics _getCurrentSessionDuration](self, "_getCurrentSessionDuration");
  v25 = v24;
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "intValue");

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  if (v31 == 0.0)
    v32 = 0.0;
  else
    v32 = v31;

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 + v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v28 + 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKey:", v36, CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  if (v39 == 0.0)
    v40 = 0.0;
  else
    v40 = v39;

  if (v25 > v40)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKey:", v42, CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));

  }
  if (v25 >= 1200.0)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "intValue");

    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v45 + 1));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));

  }
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionDuration:](self, "setCurrentSessionDuration:", v25);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionDeactivationCriteria:](self, "setCurrentSessionDeactivationCriteria:", -[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch"));
  -[RTIntermittentGNSSManagerMetrics currentStreakDuration](self, "currentStreakDuration");
  v49 = v48;
  -[RTIntermittentGNSSManagerMetrics currentSessionDuration](self, "currentSessionDuration");
  -[RTIntermittentGNSSManagerMetrics setCurrentStreakDuration:](self, "setCurrentStreakDuration:", v49 + v50);
  -[RTIntermittentGNSSManagerMetrics currentSessionTimeSinceLastSession](self, "currentSessionTimeSinceLastSession");
  if (v51 <= 1200.0)
  {
    -[RTIntermittentGNSSManagerMetrics currentStreakDuration](self, "currentStreakDuration");
    v53 = v52;
    -[RTIntermittentGNSSManagerMetrics currentSessionTimeSinceLastSession](self, "currentSessionTimeSinceLastSession");
    -[RTIntermittentGNSSManagerMetrics setCurrentStreakDuration:](self, "setCurrentStreakDuration:", v53 + v54);
  }
  -[RTIntermittentGNSSManagerMetrics setCurrentStreakDeactivationCriteria:](self, "setCurrentStreakDeactivationCriteria:", -[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch"));
  -[RTIntermittentGNSSManagerMetrics _submitSessionMetricsToCoreAnalytics](self, "_submitSessionMetricsToCoreAnalytics");
  -[RTIntermittentGNSSManagerMetrics streakMetricsTimer](self, "streakMetricsTimer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[RTIntermittentGNSSManagerMetrics streakMetricsTimer](self, "streakMetricsTimer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "invalidate");

    -[RTIntermittentGNSSManagerMetrics setStreakMetricsTimer:](self, "setStreakMetricsTimer:", 0);
  }
  objc_initWeak(location, self);
  -[RTIntermittentGNSSManagerMetrics timerManager](self, "timerManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = MEMORY[0x1E0C809B0];
  v63 = 3221225472;
  v64 = __57__RTIntermittentGNSSManagerMetrics__updateMetricsForKey___block_invoke;
  v65 = &unk_1E9298210;
  objc_copyWeak(&v67, location);
  v66 = self;
  objc_msgSend(v57, "timerWithIdentifier:queue:handler:", CFSTR("RTIntermittentGNSSStreakMetricsTimer"), v58, &v62);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManagerMetrics setStreakMetricsTimer:](self, "setStreakMetricsTimer:", v59, v62, v63, v64, v65);

  -[RTIntermittentGNSSManagerMetrics streakMetricsTimer](self, "streakMetricsTimer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "fireAfterDelay:", 1200.0);

  -[RTIntermittentGNSSManagerMetrics streakMetricsTimer](self, "streakMetricsTimer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "resume");

  objc_destroyWeak(&v67);
  objc_destroyWeak(location);
LABEL_32:

}

void __57__RTIntermittentGNSSManagerMetrics__updateMetricsForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "streakMetricsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "streakMetricsTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(WeakRetained, "setStreakMetricsTimer:", 0);
  }
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[RTIntermittentGNSSManagerMetrics _updateMetricsForKey:]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("RTIntermittentGNSSStreakMetricsTimer");
    v10 = 2048;
    v11 = 0x4034000000000000;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, time between session threshold for streak metric has been exceeded, timerIdentifier, %@, threshold in minutes, %.2f", (uint8_t *)&v6, 0x20u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "currentStreakOngoing"))
    objc_msgSend(*(id *)(a1 + 32), "_submitStreakMetricsToCoreAnalytics");

}

- (void)processSignalSwitch:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__RTIntermittentGNSSManagerMetrics_processSignalSwitch___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __56__RTIntermittentGNSSManagerMetrics_processSignalSwitch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMostRecentSignalSwitch:", *(_QWORD *)(a1 + 40));
}

- (id)_collectDailyMetrics
{
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_opt_new();
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

  }
  else
  {
    v14 = 0;
  }

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

  }
  else
  {
    v19 = 0;
  }

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

  }
  else
  {
    v25 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v26, &unk_1E932C2B0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("_totalDailyDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v28, &unk_1E932C2C8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("_numDailyRequests"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v30, &unk_1E932C2E0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("_numLongSessions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v32, &unk_1E932C2F8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("_longestSessionDuration"));

  return v3;
}

- (id)_collectSessionMetrics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[RTIntermittentGNSSManagerMetrics currentSessionDuration](self, "currentSessionDuration");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v6 = v5 / 60.0;
  -[RTIntermittentGNSSManagerMetrics currentSessionDuration](self, "currentSessionDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v7, &unk_1E932C310);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("_duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics currentSessionActivationCriteria](self, "currentSessionActivationCriteria"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_activationCriteria"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics currentSessionDeactivationCriteria](self, "currentSessionDeactivationCriteria"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("_deactivationCriteria"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[RTIntermittentGNSSManagerMetrics currentSessionTimeSinceLastSession](self, "currentSessionTimeSinceLastSession");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v12, &unk_1E932C328);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_timeSinceLastSession"));

  if (v6 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)-[RTIntermittentGNSSManagerMetrics currentSessionNumLocationsReceived](self, "currentSessionNumLocationsReceived")/ v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v14, &unk_1E932C340);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("_numLocationsPerMin"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics currentSessionNumLocationsReceived](self, "currentSessionNumLocationsReceived"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("_numLocationsPerMin"));
  }

  return v3;
}

- (id)_collectStreakMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[RTIntermittentGNSSManagerMetrics currentStreakDuration](self, "currentStreakDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v5, &unk_1E932C358);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics currentStreakActivationCriteria](self, "currentStreakActivationCriteria"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_activationCriteria"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTIntermittentGNSSManagerMetrics currentStreakDeactivationCriteria](self, "currentStreakDeactivationCriteria"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("_deactivationCriteria"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTIntermittentGNSSManagerMetrics currentStreakNumSessions](self, "currentStreakNumSessions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v9, &unk_1E932C370);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("_numSessions"));

  return v3;
}

- (void)_clearDailyMetrics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E9327470, CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &unk_1E9327470, CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", &unk_1E9327470, CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));

  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", &unk_1E9327470, CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));

}

- (void)_clearSessionMetrics
{
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionDuration:](self, "setCurrentSessionDuration:", 0.0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionActivationCriteria:](self, "setCurrentSessionActivationCriteria:", 0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionDeactivationCriteria:](self, "setCurrentSessionDeactivationCriteria:", 0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionTimeSinceLastSession:](self, "setCurrentSessionTimeSinceLastSession:", -1.0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionNumLocationsReceived:](self, "setCurrentSessionNumLocationsReceived:", 0);
}

- (void)_clearStreakMetrics
{
  -[RTIntermittentGNSSManagerMetrics setCurrentStreakDuration:](self, "setCurrentStreakDuration:", 0.0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionActivationCriteria:](self, "setCurrentSessionActivationCriteria:", 0);
  -[RTIntermittentGNSSManagerMetrics setCurrentSessionDeactivationCriteria:](self, "setCurrentSessionDeactivationCriteria:", 0);
  -[RTIntermittentGNSSManagerMetrics setCurrentStreakNumSessions:](self, "setCurrentStreakNumSessions:", 0);
  -[RTIntermittentGNSSManagerMetrics setCurrentStreakOngoing:](self, "setCurrentStreakOngoing:", 0);
}

- (void)submitDailyMetricsToCoreAnalytics
{
  NSObject *v3;
  _QWORD block[5];

  -[RTIntermittentGNSSManagerMetrics queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTIntermittentGNSSManagerMetrics_submitDailyMetricsToCoreAnalytics__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __69__RTIntermittentGNSSManagerMetrics_submitDailyMetricsToCoreAnalytics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitDailyMetricsToCoreAnalytics");
}

- (void)_submitDailyMetricsToCoreAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManagerMetrics _collectDailyMetrics](self, "_collectDailyMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  if (v5)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v7 = v10;

  }
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailySessionCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v6 = v15;

  }
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 0;
  if (v17)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongSessionCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v19 = v22;

  }
  -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[RTIntermittentGNSSManagerMetrics defaultsManager](self, "defaultsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSDailyLongestSessionDuration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v18 = v27;

  }
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219010;
    v33 = v7;
    v34 = 2048;
    v35 = v6;
    v36 = 2048;
    v37 = v19;
    v38 = 2048;
    v39 = v18;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "submitting daily metrics for intermittent gnss, totalDuration, %.2f, sessionCount, %.2f, longSessionCount, %.2f, longSessionDuration, %.2f, metrics, %@", buf, 0x34u);
  }

  v29 = objc_alloc(MEMORY[0x1E0CB3940]);
  v30 = (void *)objc_msgSend(v29, "initWithCString:encoding:", RTAnalyticsEventIntermittentGNSSDailyMetrics, 1);
  log_analytics_submission(v30, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[RTIntermittentGNSSManagerMetrics _clearDailyMetrics](self, "_clearDailyMetrics");
}

- (void)_submitSessionMetricsToCoreAnalytics
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  -[RTIntermittentGNSSManagerMetrics _collectSessionMetrics](self, "_collectSessionMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventIntermittentGNSSSessionMetrics, 1);
  log_analytics_submission(v4, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[RTIntermittentGNSSManagerMetrics _clearSessionMetrics](self, "_clearSessionMetrics");
}

- (void)_submitStreakMetricsToCoreAnalytics
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  -[RTIntermittentGNSSManagerMetrics _collectStreakMetrics](self, "_collectStreakMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventIntermittentGNSSStreakMetrics, 1);
  log_analytics_submission(v4, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[RTIntermittentGNSSManagerMetrics _clearStreakMetrics](self, "_clearStreakMetrics");
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (NSMutableDictionary)powerLogEventDictionary
{
  return self->_powerLogEventDictionary;
}

- (void)setPowerLogEventDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_powerLogEventDictionary, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)mostRecentSignalSwitch
{
  return self->_mostRecentSignalSwitch;
}

- (void)setMostRecentSignalSwitch:(unint64_t)a3
{
  self->_mostRecentSignalSwitch = a3;
}

- (BOOL)currentSessionOngoing
{
  return self->_currentSessionOngoing;
}

- (void)setCurrentSessionOngoing:(BOOL)a3
{
  self->_currentSessionOngoing = a3;
}

- (unint64_t)currentSessionNumLocationsReceived
{
  return self->_currentSessionNumLocationsReceived;
}

- (void)setCurrentSessionNumLocationsReceived:(unint64_t)a3
{
  self->_currentSessionNumLocationsReceived = a3;
}

- (double)currentSessionDuration
{
  return self->_currentSessionDuration;
}

- (void)setCurrentSessionDuration:(double)a3
{
  self->_currentSessionDuration = a3;
}

- (double)currentSessionTimeSinceLastSession
{
  return self->_currentSessionTimeSinceLastSession;
}

- (void)setCurrentSessionTimeSinceLastSession:(double)a3
{
  self->_currentSessionTimeSinceLastSession = a3;
}

- (unint64_t)currentSessionActivationCriteria
{
  return self->_currentSessionActivationCriteria;
}

- (void)setCurrentSessionActivationCriteria:(unint64_t)a3
{
  self->_currentSessionActivationCriteria = a3;
}

- (unint64_t)currentSessionDeactivationCriteria
{
  return self->_currentSessionDeactivationCriteria;
}

- (void)setCurrentSessionDeactivationCriteria:(unint64_t)a3
{
  self->_currentSessionDeactivationCriteria = a3;
}

- (BOOL)currentStreakOngoing
{
  return self->_currentStreakOngoing;
}

- (void)setCurrentStreakOngoing:(BOOL)a3
{
  self->_currentStreakOngoing = a3;
}

- (int)currentStreakNumSessions
{
  return self->_currentStreakNumSessions;
}

- (void)setCurrentStreakNumSessions:(int)a3
{
  self->_currentStreakNumSessions = a3;
}

- (double)currentStreakDuration
{
  return self->_currentStreakDuration;
}

- (void)setCurrentStreakDuration:(double)a3
{
  self->_currentStreakDuration = a3;
}

- (unint64_t)currentStreakActivationCriteria
{
  return self->_currentStreakActivationCriteria;
}

- (void)setCurrentStreakActivationCriteria:(unint64_t)a3
{
  self->_currentStreakActivationCriteria = a3;
}

- (unint64_t)currentStreakDeactivationCriteria
{
  return self->_currentStreakDeactivationCriteria;
}

- (void)setCurrentStreakDeactivationCriteria:(unint64_t)a3
{
  self->_currentStreakDeactivationCriteria = a3;
}

- (RTTimer)streakMetricsTimer
{
  return self->_streakMetricsTimer;
}

- (void)setStreakMetricsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_streakMetricsTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streakMetricsTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_powerLogEventDictionary, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
