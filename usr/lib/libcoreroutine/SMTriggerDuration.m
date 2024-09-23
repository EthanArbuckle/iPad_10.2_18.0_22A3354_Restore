@implementation SMTriggerDuration

- (SMTriggerDuration)initWithQueue:(id)a3 defaultsManager:(id)a4 sessionStore:(id)a5
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  char *v16;
  void *v17;
  SMTriggerDuration *v18;
  SMTriggerDuration *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMTriggerDuration initWithQueue:defaultsManager:sessionStore:]";
      v24 = 1024;
      LODWORD(v25) = 39;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, initializing", buf, 0x16u);

  }
  v21.receiver = self;
  v21.super_class = (Class)SMTriggerDuration;
  v18 = -[SMTriggerDuration init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_defaultsManager, a4);
    objc_storeStrong((id *)&v19->_sessionStore, a5);
    -[SMTriggerDuration setup](v19, "setup");
  }

  return v19;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMTriggerDuration queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SMTriggerDuration_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__SMTriggerDuration_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_initializeTimers
{
  RTXPCTimerAlarm *v3;
  void *v4;
  RTXPCTimerAlarm *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = [RTXPCTimerAlarm alloc];
  -[SMTriggerDuration queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__SMTriggerDuration__initializeTimers__block_invoke;
  v9[3] = &unk_1E92977B8;
  v9[4] = self;
  v5 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v3, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.triggerDuration"), v4, v9);
  -[SMTriggerDuration setXpcTimerAlarm:](self, "setXpcTimerAlarm:", v5);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[SMTriggerDuration xpcTimerAlarm](self, "xpcTimerAlarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[SMTriggerDuration _initializeTimers]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, initialized xpcTimerAlarm, %@", buf, 0x16u);

  }
}

void __38__SMTriggerDuration__initializeTimers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SMTriggerDuration__initializeTimers__block_invoke_2;
  block[3] = &unk_1E92977B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __38__SMTriggerDuration__initializeTimers__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  SMTriggerNotification *v5;
  void *v6;
  SMTriggerNotification *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "xpcTimerAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "timer %@ expired", (uint8_t *)&v9, 0xCu);

  }
  v5 = [SMTriggerNotification alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v5, "initWithTriggerCategory:SOSState:triggerName:date:details:", 7, 1, CFSTR("DurationTrigger"), v6, MEMORY[0x1E0C9AA70]);

  objc_msgSend(*(id *)(a1 + 32), "sessionMonitorDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onTriggerNotification:", v7);

}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  SEL v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeBound");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMTriggerDuration queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SMTriggerDuration_startMonitoringWithConfiguration_handler___block_invoke;
    block[3] = &unk_1E9297590;
    block[4] = self;
    v17 = v7;
    v19 = a2;
    v18 = v8;
    dispatch_async(v11, block);

  }
  else if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("endDate is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v8 + 2))(v8, v15);
  }

}

void __62__SMTriggerDuration_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeBound");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "_startMonitoringWithConfig:error:", v4, &v14);
  v5 = v14;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeBound");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, endDate, %@, error, %@", buf, 0x2Au);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);

}

- (BOOL)_startMonitoringWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[SMTriggerDuration xpcTimerAlarm](self, "xpcTimerAlarm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[SMTriggerDuration _initializeTimers](self, "_initializeTimers");
    -[SMTriggerDuration xpcTimerAlarm](self, "xpcTimerAlarm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v9, "fireWithDate:error:", v7, &v19);
    v10 = v19;

    if (a4)
      v11 = v10 == 0;
    else
      v11 = 1;
    v12 = v11;
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v17;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v10;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a4 = objc_retainAutorelease(v10);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMTriggerDuration queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SMTriggerDuration_stopMonitoringWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __47__SMTriggerDuration_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_stopMonitoring");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v7, 0x16u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)_stopMonitoring
{
  void *v3;

  -[SMTriggerDuration xpcTimerAlarm](self, "xpcTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SMTriggerDuration setXpcTimerAlarm:](self, "setXpcTimerAlarm:", 0);
  return 1;
}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMTriggerDuration queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SMTriggerDuration_modifyMonitoringWithConfiguration_handler___block_invoke;
  v12[3] = &unk_1E92994E0;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

uint64_t __63__SMTriggerDuration_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "xpcTimerAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && *(_QWORD *)(a1 + 48))
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D18598];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Can not modify a duration trigger that has not been initialized yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "stopMonitoringWithHandler:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "startMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v12, 0x16u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
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

- (RTXPCTimerAlarm)xpcTimerAlarm
{
  return self->_xpcTimerAlarm;
}

- (void)setXpcTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_xpcTimerAlarm, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_xpcTimerAlarm, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end
