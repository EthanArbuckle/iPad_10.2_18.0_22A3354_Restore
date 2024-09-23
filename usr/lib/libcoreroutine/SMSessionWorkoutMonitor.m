@implementation SMSessionWorkoutMonitor

- (SMSessionWorkoutMonitor)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 locationManager:(id)a6 healthKitManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 noMovementMonitor:(id)a12
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
  void *v26;
  NSObject *v27;
  SMSessionWorkoutMonitor *v28;
  SMSessionWorkoutMonitor *v29;
  uint64_t v30;
  NSMutableDictionary *timerIdentifierToTimers;
  SMSessionWorkoutMonitor *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  objc_super v48;
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v39 = a4;
  v18 = a4;
  v40 = a5;
  v46 = a5;
  v42 = a6;
  v19 = a6;
  v41 = a7;
  v20 = a7;
  v43 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v44 = v17;
  v45 = v25;
  if (v17)
  {
    if (v18)
    {
      v26 = v46;
      if (v46)
      {
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v24)
                  {
                    if (v25)
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v50 = "-[SMSessionWorkoutMonitor initWithQueue:defaultsManager:distanceCalculator:locationManager"
                              ":healthKitManager:platform:sessionMetricManager:sessionStore:timerManager:noMovementMonitor:]";
                        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
                      }

                      v48.receiver = self;
                      v48.super_class = (Class)SMSessionWorkoutMonitor;
                      v28 = -[SMSessionWorkoutMonitor init](&v48, sel_init);
                      v29 = v28;
                      if (v28)
                      {
                        objc_storeStrong((id *)&v28->_queue, a3);
                        objc_storeStrong((id *)&v29->_defaultsManager, v39);
                        objc_storeStrong((id *)&v29->_distanceCalculator, v40);
                        objc_storeStrong((id *)&v29->_healthKitManager, v41);
                        objc_storeStrong((id *)&v29->_locationManager, v42);
                        objc_storeStrong((id *)&v29->_platform, v43);
                        objc_storeStrong((id *)&v29->_sessionMetricManager, a9);
                        objc_storeStrong((id *)&v29->_sessionStore, a10);
                        objc_storeStrong((id *)&v29->_timerManager, a11);
                        v30 = objc_opt_new();
                        timerIdentifierToTimers = v29->_timerIdentifierToTimers;
                        v29->_timerIdentifierToTimers = (NSMutableDictionary *)v30;

                        objc_storeStrong((id *)&v29->_noMovementMonitor, a12);
                        -[SMSessionWorkoutMonitor setup](v29, "setup");
                      }
                      v32 = v29;
                      self = v32;
                      goto LABEL_39;
                    }
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v36 = "Invalid parameter not satisfying: noMovementMonitor";
                      goto LABEL_37;
                    }
LABEL_38:

                    v32 = 0;
LABEL_39:
                    v34 = v44;
                    goto LABEL_40;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v35 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
                *(_WORD *)buf = 0;
                v36 = "Invalid parameter not satisfying: sessionMetricManager";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v35 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                goto LABEL_38;
              *(_WORD *)buf = 0;
              v36 = "Invalid parameter not satisfying: platform";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              goto LABEL_38;
            *(_WORD *)buf = 0;
            v36 = "Invalid parameter not satisfying: healthKitManager";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
          *(_WORD *)buf = 0;
          v36 = "Invalid parameter not satisfying: locationManager";
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        *(_WORD *)buf = 0;
        v36 = "Invalid parameter not satisfying: distanceCalculator";
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v35 = objc_claimAutoreleasedReturnValue();
      v26 = v46;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_WORD *)buf = 0;
      v36 = "Invalid parameter not satisfying: defaultsManager";
    }
LABEL_37:
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
  }

  v32 = 0;
  v34 = 0;
  v26 = v46;
LABEL_40:

  return v32;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionWorkoutMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SMSessionWorkoutMonitor_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __32__SMSessionWorkoutMonitor_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  void *v3;
  NSDate *v4;
  NSDate *endWorkoutReminderDate;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  double endWorkoutReminderTimeoutSettingEnabled;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  double endWorkoutReminderTimeoutSettingDisabled;
  void *v16;
  NSDate *v17;
  NSDate *latestWorkoutManualPauseDate;
  void *v19;
  void *v20;
  double v21;
  NSObject *v22;
  double workoutManualPauseTimeout;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"));
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endWorkoutReminderDate = self->_endWorkoutReminderDate;
  self->_endWorkoutReminderDate = v4;

  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:value:", CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingEnabled"), &unk_1E932D150);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  self->_endWorkoutReminderTimeoutSettingEnabled = v8;

  if (self->_endWorkoutReminderTimeoutSettingEnabled != 900.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      endWorkoutReminderTimeoutSettingEnabled = self->_endWorkoutReminderTimeoutSettingEnabled;
      v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      v30 = 2080;
      v31 = "overriding end workout reminder timeout - setting enabled";
      v32 = 2048;
      v33 = 0x408C200000000000;
      v34 = 2048;
      v35 = endWorkoutReminderTimeoutSettingEnabled;
      v36 = 2112;
      v37 = CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingEnabled");
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }

  }
  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:value:", CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingDisabled"), &unk_1E932D160);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  self->_endWorkoutReminderTimeoutSettingDisabled = v13;

  if (self->_endWorkoutReminderTimeoutSettingDisabled != 3600.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      endWorkoutReminderTimeoutSettingDisabled = self->_endWorkoutReminderTimeoutSettingDisabled;
      v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      v30 = 2080;
      v31 = "overriding end workout reminder timeout - setting disabled";
      v32 = 2048;
      v33 = 0x40AC200000000000;
      v34 = 2048;
      v35 = endWorkoutReminderTimeoutSettingDisabled;
      v36 = 2112;
      v37 = CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingDisabled");
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }

  }
  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"));
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  latestWorkoutManualPauseDate = self->_latestWorkoutManualPauseDate;
  self->_latestWorkoutManualPauseDate = v17;

  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:value:", CFSTR("SMDefaultsSessionWorkoutMonitorWorkoutManualPauseTimeout"), &unk_1E932D170);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  self->_workoutManualPauseTimeout = v21;

  if (self->_workoutManualPauseTimeout != 7200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      workoutManualPauseTimeout = self->_workoutManualPauseTimeout;
      v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      v30 = 2080;
      v31 = "overriding workout manual pause timeout";
      v32 = 2048;
      v33 = 0x40BC200000000000;
      v34 = 2048;
      v35 = workoutManualPauseTimeout;
      v36 = 2112;
      v37 = CFSTR("SMDefaultsSessionWorkoutMonitorWorkoutManualPauseTimeout");
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (self->_endWorkoutReminderSettingEnabled)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    -[NSDate stringFromDate](self->_endWorkoutReminderDate, "stringFromDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_latestWorkoutManualPauseDate, "stringFromDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315906;
    v29 = "-[SMSessionWorkoutMonitor _setup]";
    v30 = 2112;
    v31 = (const char *)v25;
    v32 = 2112;
    v33 = (uint64_t)v26;
    v34 = 2112;
    v35 = *(double *)&v27;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, endWorkoutReminderSettingEnabled, %@, endWorkoutReminderDate, %@, latestWorkoutManualPauseDate, %@", (uint8_t *)&v28, 0x2Au);

  }
}

- (void)_addObservers
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
    v7 = "-[SMSessionWorkoutMonitor _addObservers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionWorkoutMonitor noMovementMonitor](self, "noMovementMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMCMNoMovementStateUpdateNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_onNoMovementMonitorNotification_, v5);

}

- (void)_removeObservers
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
    v7 = "-[SMSessionWorkoutMonitor _removeObservers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionWorkoutMonitor healthKitManager](self, "healthKitManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SMSessionWorkoutMonitor noMovementMonitor](self, "noMovementMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)_bootstrap
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[SMSessionWorkoutMonitor _bootstrap]";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, bootstrapping not yet supported, called with configuration, %@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
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
  -[SMSessionWorkoutMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SMSessionWorkoutMonitor_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__SMSessionWorkoutMonitor_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "sessionType") != 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
      v47 = 1024;
      LODWORD(v48) = 209;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeWorkoutBound (in %s:%d)", buf, 0x12u);
    }

  }
  -[SMSessionWorkoutMonitor _addObservers](self, "_addObservers");
  -[SMSessionWorkoutMonitor setSessionConfiguration:](self, "setSessionConfiguration:", v6);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
    v47 = 2112;
    v48 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  if (v7)
  {
    +[SMDateUtility date](SMDateUtility, "date");
    v10 = objc_claimAutoreleasedReturnValue();
    -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAfterDate:", v10);

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sessionStartDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringFromDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate](v10, "stringFromDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
        v47 = 2112;
        v48 = v41;
        v49 = 2112;
        v50 = v42;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, sessionStartDate, %@, larger than currentDate, %@", buf, 0x20u);

      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("sessionStartDate is larger than currentDate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v18);
      goto LABEL_27;
    }
    -[SMSessionWorkoutMonitor endWorkoutReminderDate](self, "endWorkoutReminderDate");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[SMSessionWorkoutMonitor endWorkoutReminderDate](self, "endWorkoutReminderDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sessionStartDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isAfterDate:", v23))
      {
        -[SMSessionWorkoutMonitor endWorkoutReminderDate](self, "endWorkoutReminderDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isBeforeDate:", v10);

        if (!v25)
          goto LABEL_20;
        -[SMSessionWorkoutMonitor _workoutEndReminderTimeout](self, "_workoutEndReminderTimeout");
        v27 = v26;
        -[SMSessionWorkoutMonitor endWorkoutReminderDate](self, "endWorkoutReminderDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v20);
        -[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier"), v27 - v28);
      }
      else
      {

      }
    }
LABEL_20:
    -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sessionStartDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "isAfterDate:", v33))
      {

        goto LABEL_25;
      }
      -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isBeforeDate:", v10);

      if (v35)
      {
        -[SMSessionWorkoutMonitor workoutManualPauseTimeout](self, "workoutManualPauseTimeout");
        v37 = v36;
        -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v30);
        -[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier"), v37 - v38);
LABEL_25:

      }
    }
    -[SMSessionWorkoutMonitor setSessionConfiguration:](self, "setSessionConfiguration:", v6);
    v7[2](v7, 0);
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, invalid handler", buf, 0xCu);
  }
LABEL_27:

}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionWorkoutMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionWorkoutMonitor_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SMSessionWorkoutMonitor_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SMSessionWorkoutMonitor _stopMonitoringWithHandler:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[SMSessionWorkoutMonitor _removeObservers](self, "_removeObservers");
  -[SMSessionWorkoutMonitor _removeTimers](self, "_removeTimers");
  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", 0, CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"));

  -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", 0, CFSTR("SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"));

  if (v4)
    v4[2](v4, 0);

}

- (void)onWorkoutTriggerControlUpdate:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionWorkoutMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SMSessionWorkoutMonitor_onWorkoutTriggerControlUpdate___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __57__SMSessionWorkoutMonitor_onWorkoutTriggerControlUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWorkoutTriggerControlUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_onWorkoutTriggerControlUpdate:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[SMSessionWorkoutMonitor _onWorkoutTriggerControlUpdate:]";
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, control, %lu", (uint8_t *)&v16, 0x16u);
  }

  if (a3 == 2)
  {
    -[SMSessionWorkoutMonitor setIsWorkoutPaused:](self, "setIsWorkoutPaused:", 0);
    -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", 0, CFSTR("SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"));

    v14 = CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier");
  }
  else
  {
    if (a3 != 1)
      return;
    -[SMSessionWorkoutMonitor setIsWorkoutPaused:](self, "setIsWorkoutPaused:", 1);
    -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_7;
    v7 = (void *)v6;
    -[SMSessionWorkoutMonitor latestWorkoutManualPauseDate](self, "latestWorkoutManualPauseDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isBeforeDate:", v10);

    if (v11)
    {
LABEL_7:
      -[SMSessionWorkoutMonitor defaultsManager](self, "defaultsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"));

      -[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier"), self->_workoutManualPauseTimeout);
    }
    v14 = CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier");
  }
  -[SMSessionWorkoutMonitor _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", v14);
}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
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
  -[SMSessionWorkoutMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SMSessionWorkoutMonitor_modifyMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __69__SMSessionWorkoutMonitor_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "sessionType") != 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
      v25 = 1024;
      LODWORD(v26) = 342;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeWorkoutBound (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, Configuration did not change", buf, 0xCu);
    }
  }
  else
  {
    -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __70__SMSessionWorkoutMonitor__modifyMonitoringWithConfiguration_handler___block_invoke;
      v21[3] = &unk_1E9297568;
      v17 = v7;
      v22 = v17;
      -[SMSessionWorkoutMonitor _stopMonitoringWithHandler:](self, "_stopMonitoringWithHandler:", v21);
      -[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:](self, "_startMonitoringWithConfiguration:handler:", v6, v17);
      v12 = v22;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[SMSessionWorkoutMonitor sessionConfiguration](self, "sessionConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sessionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, Configuartion modified for wrong session, current config sessionID, %@, modified config sessionID, %@", buf, 0x20u);

      }
    }
  }

}

void __70__SMSessionWorkoutMonitor__modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%s, modify workout bound session with configuration failed in stop monitoring with error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)onHealthKitNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionWorkoutMonitor *v9;

  v4 = a3;
  -[SMSessionWorkoutMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SMSessionWorkoutMonitor_onHealthKitNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__SMSessionWorkoutMonitor_onHealthKitNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  SMTriggerNotification *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v25 = 136315394;
    v26 = "-[SMSessionWorkoutMonitor onHealthKitNotification:]_block_invoke";
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, processing, %@", (uint8_t *)&v25, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTHealthKitManagerWorkoutEndReminderShowAlertNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldPromptEndWorkoutReminderTriggerWithReason:", objc_msgSend(v13, "reason")))
    {
      v14 = [SMTriggerNotification alloc];
      +[SMDateUtility date](SMDateUtility, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v14, "initWithTriggerCategory:SOSState:triggerName:date:details:", 20, 1, CFSTR("SMTriggerWorkout"), v15, MEMORY[0x1E0C9AA70]);

      objc_msgSend(*(id *)(a1 + 40), "sessionMonitorDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "onTriggerNotification:", v16);
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  objc_msgSend(v13, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTHealthKitManagerWorkoutSuggestedStopWorkoutNotification, "notificationName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTHealthKitManagerWorkoutResumedNotification, "notificationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqualToString:", v22);

    if (!v23)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 32), "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = (const char *)v17;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "unhandled notification, %@", (uint8_t *)&v25, 0xCu);
LABEL_8:

LABEL_15:
      return;
    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", 0, CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"));

    objc_msgSend(*(id *)(a1 + 40), "_tearDownTimerWithIdentifier:", CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier"));
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "endWorkoutReminderSettingEnabled") & 1) == 0)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"));

    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "_workoutEndReminderTimeout");
    objc_msgSend(v9, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier"));
  }
}

- (void)onNoMovementMonitorNotification:(id)a3
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
  SMSessionWorkoutMonitor *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__SMSessionWorkoutMonitor_onNoMovementMonitorNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[SMSessionWorkoutMonitor queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __59__SMSessionWorkoutMonitor_onNoMovementMonitorNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  SMTriggerNotification *v7;
  void *v8;
  SMTriggerNotification *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](SMCMNoMovementStateUpdateNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SMSessionWorkoutMonitor onNoMovementMonitorNotification:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%s, onNoMovementMonitorNotification, %@", (uint8_t *)&v11, 0x16u);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "_shouldPromptNoMovementTrigger:", v5))
    {
      v7 = [SMTriggerNotification alloc];
      +[SMDateUtility date](SMDateUtility, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v7, "initWithTriggerCategory:SOSState:triggerName:date:details:", 21, 1, CFSTR("SMTriggerWorkout"), v8, MEMORY[0x1E0C9AA70]);

      objc_msgSend(*(id *)(a1 + 40), "sessionMonitorDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "onTriggerNotification:", v9);

    }
  }
}

- (BOOL)_shouldPromptNoMovementTrigger:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[SMSessionWorkoutMonitor isWorkoutPaused](self, "isWorkoutPaused") && objc_msgSend(v4, "state") == 2;

  return v5;
}

- (BOOL)_shouldPromptEndWorkoutReminderTriggerWithReason:(unint64_t)a3
{
  return a3 == 5;
}

- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  RTTimerManager *timerManager;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]";
    v26 = 2112;
    v27 = v6;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.1f", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  +[SMDateUtility date](SMDateUtility, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  timerManager = self->_timerManager;
  -[SMSessionWorkoutMonitor queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__SMSessionWorkoutMonitor__initializeTimerWithIdentifier_fireAfterDelay___block_invoke;
  v19[3] = &unk_1E92A2468;
  v11 = v6;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  objc_copyWeak(&v22, &location);
  -[RTTimerManager xpcTimerAlarmWithIdentifier:queue:handler:](timerManager, "xpcTimerAlarmWithIdentifier:queue:handler:", v11, v10, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, v11);

  objc_msgSend(v12, "dateByAddingTimeInterval:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v13, "fireWithDate:error:", v15, &v18);
  v16 = v18;

  if (v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]";
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
    }

  }
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __73__SMSessionWorkoutMonitor__initializeTimerWithIdentifier_fireAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[SMDateUtility date](SMDateUtility, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v7 = 136315650;
    v8 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]_block_invoke";
    v9 = 2112;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v7, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_onTimerExpiryForTimerIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_onTimerExpiryForTimerIdentifier:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  SMTriggerNotification *v7;
  void *v8;
  uint64_t v9;
  SMTriggerNotification *v10;
  uint64_t v11;
  SMTriggerNotification *v12;
  SMTriggerNotification *v13;
  int v14;
  const char *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[SMSessionWorkoutMonitor _onTimerExpiryForTimerIdentifier:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v14, 0x16u);
  }

  -[SMSessionWorkoutMonitor sessionMonitorDelegate](self, "sessionMonitorDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier"))
  {
    v12 = [SMTriggerNotification alloc];
    +[SMDateUtility date](SMDateUtility, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C9AA70];
    v10 = v12;
    v11 = 20;
    goto LABEL_7;
  }
  if (v4 == CFSTR("com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier"))
  {
    v7 = [SMTriggerNotification alloc];
    +[SMDateUtility date](SMDateUtility, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C9AA70];
    v10 = v7;
    v11 = 22;
LABEL_7:
    v13 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v10, "initWithTriggerCategory:SOSState:triggerName:date:details:", v11, 1, CFSTR("SMTriggerWorkout"), v8, v9);

    objc_msgSend(v6, "onTriggerNotification:", v13);
  }
  -[SMSessionWorkoutMonitor _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", v4);

}

- (void)_tearDownTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SMSessionWorkoutMonitor _tearDownTimerWithIdentifier:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v11, 0x16u);
  }

  -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v4);

  }
}

- (void)_removeTimers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SMSessionWorkoutMonitor _removeTimers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invalidate");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[SMSessionWorkoutMonitor timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[SMSessionWorkoutMonitor setTimerIdentifierToTimers:](self, "setTimerIdentifierToTimers:", 0);
}

- (double)_workoutEndReminderTimeout
{
  NSObject *v3;
  double result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SMSessionWorkoutMonitor _workoutEndReminderTimeout]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (-[SMSessionWorkoutMonitor endWorkoutReminderSettingEnabled](self, "endWorkoutReminderSettingEnabled"))
    -[SMSessionWorkoutMonitor endWorkoutReminderTimeoutSettingEnabled](self, "endWorkoutReminderTimeoutSettingEnabled");
  else
    -[SMSessionWorkoutMonitor endWorkoutReminderTimeoutSettingDisabled](self, "endWorkoutReminderTimeoutSettingDisabled");
  return result;
}

- (SMTriggerManagerProtocol)sessionMonitorDelegate
{
  return (SMTriggerManagerProtocol *)objc_loadWeakRetained((id *)&self->sessionMonitorDelegate);
}

- (void)setSessionMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->sessionMonitorDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
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

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
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

- (SMSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (NSDate)endWorkoutReminderDate
{
  return self->_endWorkoutReminderDate;
}

- (void)setEndWorkoutReminderDate:(id)a3
{
  objc_storeStrong((id *)&self->_endWorkoutReminderDate, a3);
}

- (NSDate)latestWorkoutManualPauseDate
{
  return self->_latestWorkoutManualPauseDate;
}

- (void)setLatestWorkoutManualPauseDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestWorkoutManualPauseDate, a3);
}

- (NSMutableDictionary)timerIdentifierToTimers
{
  return self->_timerIdentifierToTimers;
}

- (void)setTimerIdentifierToTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, a3);
}

- (BOOL)isWorkoutPaused
{
  return self->_isWorkoutPaused;
}

- (void)setIsWorkoutPaused:(BOOL)a3
{
  self->_isWorkoutPaused = a3;
}

- (BOOL)endWorkoutReminderSettingEnabled
{
  return self->_endWorkoutReminderSettingEnabled;
}

- (void)setEndWorkoutReminderSettingEnabled:(BOOL)a3
{
  self->_endWorkoutReminderSettingEnabled = a3;
}

- (double)endWorkoutReminderTimeoutSettingEnabled
{
  return self->_endWorkoutReminderTimeoutSettingEnabled;
}

- (void)setEndWorkoutReminderTimeoutSettingEnabled:(double)a3
{
  self->_endWorkoutReminderTimeoutSettingEnabled = a3;
}

- (double)endWorkoutReminderTimeoutSettingDisabled
{
  return self->_endWorkoutReminderTimeoutSettingDisabled;
}

- (void)setEndWorkoutReminderTimeoutSettingDisabled:(double)a3
{
  self->_endWorkoutReminderTimeoutSettingDisabled = a3;
}

- (double)workoutManualPauseTimeout
{
  return self->_workoutManualPauseTimeout;
}

- (void)setWorkoutManualPauseTimeout:(double)a3
{
  self->_workoutManualPauseTimeout = a3;
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_noMovementMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, 0);
  objc_storeStrong((id *)&self->_latestWorkoutManualPauseDate, 0);
  objc_storeStrong((id *)&self->_endWorkoutReminderDate, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end
