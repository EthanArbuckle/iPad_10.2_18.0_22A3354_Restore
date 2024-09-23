@implementation SMAnomalyAlertManager

- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6
{
  return -[SMAnomalyAlertManager initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:toneDelay:](self, "initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:toneDelay:", a3, a4, a5, a6, 0.7);
}

- (SMAnomalyAlertManager)initWithQueue:(id)a3 anomalyState:(id)a4 defaultsManager:(id)a5 carPlayAlertManager:(id)a6 toneDelay:(double)a7
{
  OS_dispatch_queue *v12;
  id v13;
  id v14;
  id v15;
  SMAnomalyAlertManager *v16;
  SMAnomalyAlertManager *v17;
  uint64_t v18;
  SMSessionManagerState *anomalyState;
  RTXPCTimerAlarm *secondAlertAlarm;
  RTXPCTimerAlarm *thirdAlertAlarm;
  SMAnomalyAlertManager *v22;
  NSObject *v23;
  objc_class *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = (OS_dispatch_queue *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13 && (objc_msgSend(v13, "isPromptState") & 1) != 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMAnomalyAlertManager;
    v16 = -[SMAnomalyAlertManager init](&v27, sel_init);
    v17 = v16;
    if (v16)
    {
      v16->_queue = v12;
      v18 = objc_msgSend(v13, "copy");
      anomalyState = v17->_anomalyState;
      v17->_anomalyState = (SMSessionManagerState *)v18;

      objc_storeStrong((id *)&v17->_defaultsManager, a5);
      v17->_toneDelay = a7;
      secondAlertAlarm = v17->_secondAlertAlarm;
      v17->_secondAlertAlarm = 0;

      thirdAlertAlarm = v17->_thirdAlertAlarm;
      v17->_thirdAlertAlarm = 0;

      objc_storeStrong((id *)&v17->_carPlayAlertManager, a6);
    }
    self = v17;
    v22 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v29 = v26;
      v30 = 2080;
      v31 = "-[SMAnomalyAlertManager initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:toneDelay:]";
      v32 = 2112;
      v33 = v13;
      v34 = 2048;
      v35 = a7;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %s, init invalid param, anomalyState, %@, toneDelay, %f", buf, 0x2Au);

    }
    v22 = 0;
  }

  return v22;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[SMAnomalyAlertManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SMAnomalyAlertManager_start__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __30__SMAnomalyAlertManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  -[SMAnomalyAlertManager _executeAlertForAlertOrdinal:](self, "_executeAlertForAlertOrdinal:", 1);
  -[SMAnomalyAlertManager _scheduleSecondAlert](self, "_scheduleSecondAlert");
  -[SMAnomalyAlertManager _scheduleThirdAlert](self, "_scheduleThirdAlert");
}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[SMAnomalyAlertManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SMAnomalyAlertManager_resume__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __31__SMAnomalyAlertManager_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resume");
}

- (void)_resume
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SMAnomalyAlertManager _targetAlertDateForAlertOrdinal:](self, "_targetAlertDateForAlertOrdinal:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _targetAlertDateForAlertOrdinal:](self, "_targetAlertDateForAlertOrdinal:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v7;
    v18 = 2080;
    v19 = "-[SMAnomalyAlertManager _resume]";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@, %s, resume, second alarm target, %@, third alarm target, %@", (uint8_t *)&v16, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v3);
  v12 = v11;

  if (v12 < 10.0)
    -[SMAnomalyAlertManager _scheduleSecondAlert](self, "_scheduleSecondAlert");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v4);
  v15 = v14;

  if (v15 < 10.0)
    -[SMAnomalyAlertManager _scheduleThirdAlert](self, "_scheduleThirdAlert");

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[SMAnomalyAlertManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SMAnomalyAlertManager_stop__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __29__SMAnomalyAlertManager_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)_stop
{
  void *v3;
  void *v4;

  -[SMAnomalyAlertManager _stopTLAlert](self, "_stopTLAlert");
  -[SMAnomalyAlertManager secondAlertAlarm](self, "secondAlertAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  -[SMAnomalyAlertManager thirdAlertAlarm](self, "thirdAlertAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _invalidateTimer:](self, "_invalidateTimer:", v4);

  -[SMAnomalyAlertManager setSecondAlertAlarm:](self, "setSecondAlertAlarm:", 0);
  -[SMAnomalyAlertManager setThirdAlertAlarm:](self, "setThirdAlertAlarm:", 0);
}

- (void)_scheduleSecondAlert
{
  void *v3;
  id v4;

  -[SMAnomalyAlertManager secondAlertAlarm](self, "secondAlertAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  -[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:](self, "_scheduleAlertForAlertOrdinal:", 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager setSecondAlertAlarm:](self, "setSecondAlertAlarm:", v4);

}

- (void)_scheduleThirdAlert
{
  void *v3;
  id v4;

  -[SMAnomalyAlertManager thirdAlertAlarm](self, "thirdAlertAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  -[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:](self, "_scheduleAlertForAlertOrdinal:", 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager setThirdAlertAlarm:](self, "setThirdAlertAlarm:", v4);

}

- (id)_scheduleAlertForAlertOrdinal:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  RTXPCTimerAlarm *v11;
  void *v12;
  RTXPCTimerAlarm *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  RTXPCTimerAlarm *v21;
  NSObject *v22;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32[2];
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[SMAnomalyAlertManager _targetAlertDateForAlertOrdinal:](self, "_targetAlertDateForAlertOrdinal:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _alarmIdentifierForAlertOrdinal:](self, "_alarmIdentifierForAlertOrdinal:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = v9;
    v36 = 2080;
    v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
    v38 = 2048;
    v39 = a3;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%@, %s, ordinal, %lu, fireDate, %@, alarmIdentifier, %@", buf, 0x34u);

  }
  if (v5 && v6)
  {
    objc_initWeak(&location, self);
    v11 = [RTXPCTimerAlarm alloc];
    -[SMAnomalyAlertManager queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__SMAnomalyAlertManager__scheduleAlertForAlertOrdinal___block_invoke;
    v31[3] = &unk_1E92A1498;
    objc_copyWeak(v32, &location);
    v32[1] = (id)a3;
    v31[4] = self;
    v13 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v11, "initWithIdentifier:queue:handler:", v6, v12, v31);

    v30 = 0;
    -[RTXPCTimerAlarm fireWithDate:error:](v13, "fireWithDate:error:", v5, &v30);
    v14 = v30;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[RTXPCTimerAlarm identifier](v13, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = v17;
      v36 = 2080;
      v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
      v38 = 2112;
      v39 = (int64_t)v18;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "%@, %s, %@, timer set with end date, %@", buf, 0x2Au);

    }
    if (v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        -[RTXPCTimerAlarm identifier](v13, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = v27;
        v36 = 2080;
        v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
        v38 = 2112;
        v39 = (int64_t)v28;
        v40 = 2112;
        v41 = v29;
        _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "%@, %s, %@, fireWithDate hit error: %@", buf, 0x2Au);

      }
      v21 = 0;
    }
    else
    {
      v21 = v13;
    }

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v25;
      v36 = 2080;
      v37 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]";
      v38 = 2048;
      v39 = a3;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, %s, ordinal, %lu, invalid fireDate or alarmIdentifier", buf, 0x20u);

    }
    v21 = 0;
  }

  return v21;
}

void __55__SMAnomalyAlertManager__scheduleAlertForAlertOrdinal___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_alarmForAlertOrdinal:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2080;
    v11 = "-[SMAnomalyAlertManager _scheduleAlertForAlertOrdinal:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%@, %s, %@, expired", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(WeakRetained, "_invalidateTimer:", v3);
  objc_msgSend(WeakRetained, "_executeAlertForAlertOrdinal:", *(_QWORD *)(a1 + 48));

}

- (void)_executeAlertForAlertOrdinal:(int64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  dispatch_time_t v17;
  NSObject *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    v22 = 2080;
    v23 = "-[SMAnomalyAlertManager _executeAlertForAlertOrdinal:]";
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@, %s, executing alert for ordinal, %lu", buf, 0x20u);

  }
  -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager _updateActivityWithState:](self, "_updateActivityWithState:", v8);

  v9 = objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeForAnomalyManagerAlertOrdinal:", a3);
  -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "sessionType") == 1)
  {
    -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isTimerExtensionValid:", *MEMORY[0x1E0D8BC90]);

    if (!v13)
      v9 = 4;
  }
  else
  {

  }
  -[SMAnomalyAlertManager carPlayAlertManager](self, "carPlayAlertManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postCarPlayNotificationForNotificationType:sessionManagerState:handler:", v9, v15, 0);

  if (objc_msgSend(MEMORY[0x1E0D8B8F0], "hasActivity"))
  {
    -[SMAnomalyAlertManager toneDelay](self, "toneDelay");
    v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    -[SMAnomalyAlertManager queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__SMAnomalyAlertManager__executeAlertForAlertOrdinal___block_invoke;
    v19[3] = &unk_1E9297BF0;
    v19[4] = self;
    v19[5] = a3;
    dispatch_after(v17, v18, v19);

  }
}

uint64_t __54__SMAnomalyAlertManager__executeAlertForAlertOrdinal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playTLAlertForAlertOrdinal:", *(_QWORD *)(a1 + 40));
}

- (void)_updateActivityWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  -[SMAnomalyAlertManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[SMAnomalyAlertManager defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsSessionManagerSeparatedLowPowerModeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B990]), "initWithUnsupportedDeviceSeparationState:userDisabledConnectivity:separatedLPMConnectivityWarningState:", v7, 0, v10);
  objc_msgSend(MEMORY[0x1E0D8B8F0], "updateActivityWithState:localState:shouldNotify:", v4, v11, 1);

}

- (void)_playTLAlertForAlertOrdinal:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SMAnomalyAlertManager _stopTLAlert](self, "_stopTLAlert");
  -[SMAnomalyAlertManager _tlAlertConfigurationForAlertOrdinal:](self, "_tlAlertConfigurationForAlertOrdinal:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMAnomalyAlertManager setTlAlert:](self, "setTlAlert:", v6);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SMAnomalyAlertManager _playTLAlertForAlertOrdinal:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%s,playing alertConfiguration,%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[SMAnomalyAlertManager tlAlert](self, "tlAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SMAnomalyAlertManager__playTLAlertForAlertOrdinal___block_invoke;
  v9[3] = &unk_1E92A2B58;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v8, "playWithCompletionHandler:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __53__SMAnomalyAlertManager__playTLAlertForAlertOrdinal___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromTLAlertPlaybackCompletionType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2080;
    v13 = "-[SMAnomalyAlertManager _playTLAlertForAlertOrdinal:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@, %s, play completion called, playbackCompletionType, %@, error, %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_msgSend(WeakRetained, "setTlAlert:", 0);

}

- (void)_stopTLAlert
{
  void *v3;
  void *v4;

  -[SMAnomalyAlertManager tlAlert](self, "tlAlert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMAnomalyAlertManager tlAlert](self, "tlAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

    -[SMAnomalyAlertManager setTlAlert:](self, "setTlAlert:", 0);
  }
}

- (id)_tlAlertConfigurationForAlertOrdinal:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", 18);
  v6 = 0;
  v7 = 0;
  v8 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level1_urgent_ML.plist");
  v9 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level1_urgent_ML.wav");
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      goto LABEL_4;
    case 2:
      v6 = 1;
      v8 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level2_urgent_ML.plist");
      v9 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level2_urgent_ML.wav");
      goto LABEL_4;
    case 3:
      v6 = 1;
      v8 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.plist");
      v9 = CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.wav");
LABEL_4:
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExternalToneFileURL:", v10);

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExternalVibrationPatternFileURL:", v11);

      objc_msgSend(v5, "setShouldIgnoreRingerSwitch:", v6);
      break;
    default:
      break;
  }
  -[SMAnomalyAlertManager defaultsManager](self, "defaultsManager", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsSessionManagerShouldIgnoreRingerSwitchKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v5, "setShouldIgnoreRingerSwitch:", objc_msgSend(v13, "BOOLValue"));
  v7 = v5;

LABEL_8:
  return v7;
}

- (void)_invalidateTimer:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[SMAnomalyAlertManager _invalidateTimer:]";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, invalidating timer with identifier, %@", (uint8_t *)&v6, 0x16u);

    }
    objc_msgSend(v3, "invalidate");
  }

}

- (id)_alarmForAlertOrdinal:(int64_t)a3
{
  void *v3;

  if (a3 == 3)
  {
    -[SMAnomalyAlertManager thirdAlertAlarm](self, "thirdAlertAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[SMAnomalyAlertManager secondAlertAlarm](self, "secondAlertAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_alarmIdentifierForAlertOrdinal:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.routined.safetyMonitor.sessionManager.smAnomalyAlertManager.thirdAlarm");
  if (a3 != 3)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("com.apple.routined.safetyMonitor.sessionManager.smAnomalyAlertManager.secondAlarm");
  else
    return (id)v3;
}

- (id)_targetAlertDateForAlertOrdinal:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  if ((unint64_t)a3 < 2)
  {
    -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionStateTransitionDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return v3;
  }
  if (a3 == 3)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionStateTransitionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 600.0;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[SMAnomalyAlertManager anomalyState](self, "anomalyState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionStateTransitionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 300.0;
LABEL_7:
    objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  return v3;
}

+ (unint64_t)carPlayNotificationTypeForAnomalyManagerAlertOrdinal:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 2;
  else
    return qword_1D1EEDC70[a3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SMSessionManagerState)anomalyState
{
  return self->_anomalyState;
}

- (RTXPCTimerAlarm)secondAlertAlarm
{
  return self->_secondAlertAlarm;
}

- (void)setSecondAlertAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_secondAlertAlarm, a3);
}

- (RTXPCTimerAlarm)thirdAlertAlarm
{
  return self->_thirdAlertAlarm;
}

- (void)setThirdAlertAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_thirdAlertAlarm, a3);
}

- (TLAlert)tlAlert
{
  return self->_tlAlert;
}

- (void)setTlAlert:(id)a3
{
  objc_storeStrong((id *)&self->_tlAlert, a3);
}

- (double)toneDelay
{
  return self->_toneDelay;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (SMCarPlayAlertManager)carPlayAlertManager
{
  return self->_carPlayAlertManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayAlertManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_tlAlert, 0);
  objc_storeStrong((id *)&self->_thirdAlertAlarm, 0);
  objc_storeStrong((id *)&self->_secondAlertAlarm, 0);
  objc_storeStrong((id *)&self->_anomalyState, 0);
}

@end
