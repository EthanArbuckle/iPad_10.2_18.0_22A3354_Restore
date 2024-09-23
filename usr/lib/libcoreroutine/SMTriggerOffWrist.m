@implementation SMTriggerOffWrist

- (SMTriggerOffWrist)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 sessionStore:(id)a6 wristStateManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  void *v27;
  SMTriggerOffWrist *v28;
  SMTriggerOffWrist *v29;
  id v32;
  id v33;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v32 = a4;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v33 = a7;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[SMTriggerOffWrist initWithQueue:defaultsManager:dataProtectionManager:sessionStore:wristStateManager:]";
      v38 = 1024;
      LODWORD(v39) = 46;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = v15;
    v20 = a5;
    v21 = v12;
    v22 = a6;
    v23 = v14;
    v24 = a7;
    v25 = v13;
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, initializing triggerOffWrist", buf, 0x16u);

    v13 = v25;
    a7 = v24;
    v14 = v23;
    a6 = v22;
    v12 = v21;
    a5 = v20;
    v15 = v19;
  }

  v35.receiver = self;
  v35.super_class = (Class)SMTriggerOffWrist;
  v28 = -[SMTriggerOffWrist init](&v35, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_queue, a3);
    objc_storeStrong((id *)&v29->_defaultsManager, v32);
    objc_storeStrong((id *)&v29->_dataProtectionManager, a5);
    objc_storeStrong((id *)&v29->_sessionStore, a6);
    objc_storeStrong((id *)&v29->_wristStateManager, a7);
    -[SMTriggerOffWrist setup](v29, "setup");
  }

  return v29;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMTriggerOffWrist queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SMTriggerOffWrist_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__SMTriggerOffWrist_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SMTriggerOffWrist _setup]";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v3, 0xCu);
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
  -[SMTriggerOffWrist queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMTriggerOffWrist_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__SMTriggerOffWrist_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, start monitoring wrist state notifications", (uint8_t *)&v19, 0x16u);

    }
    -[SMTriggerOffWrist wristStateManager](self, "wristStateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTWatchWristStateManagerWristStateChangedNotification, "notificationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:", self, sel_onWristStateChangedNotification_, v15);

    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    if (v10)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, configuration is nil, monitoring cannot be started without valid configuration", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMTriggerOffWrist queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SMTriggerOffWrist_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__SMTriggerOffWrist_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, stop monitoring for wrist state notifications", (uint8_t *)&v11, 0x16u);

  }
  -[SMTriggerOffWrist wristStateManager](self, "wristStateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  if (v5)
    v5[2](v5, 0);

}

- (void)onWristStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMTriggerOffWrist queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SMTriggerOffWrist_onWristStateChangedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SMTriggerOffWrist_onWristStateChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWristStateChangedNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWristStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  RTXPCTimerAlarm *v11;
  void *v12;
  RTXPCTimerAlarm *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SMTriggerOffWrist defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSMTriggerOffWristSuppressNotifications"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        +[RTNotification notificationName](RTWatchWristStateManagerWristStateChangedNotification, "notificationName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v27 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]";
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, device configured to suppress %@", buf, 0x16u);

      }
    }
    else
    {
      v8 = v4;
      if (-[NSObject wristState](v8, "wristState") == 1)
      {
        -[SMTriggerOffWrist offWristThresholdTimerAlarm](self, "offWristThresholdTimerAlarm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_initWeak(&location, self);
          v11 = [RTXPCTimerAlarm alloc];
          -[SMTriggerOffWrist queue](self, "queue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __54__SMTriggerOffWrist__onWristStateChangedNotification___block_invoke;
          v23[3] = &unk_1E9299C38;
          v23[4] = self;
          objc_copyWeak(&v24, &location);
          v13 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v11, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.safetyMonitor.triggerOffWrist.offWristThresholdTimerAlarm"), v12, v23);
          -[SMTriggerOffWrist setOffWristThresholdTimerAlarm:](self, "setOffWristThresholdTimerAlarm:", v13);

          -[SMTriggerOffWrist offWristThresholdTimerAlarm](self, "offWristThresholdTimerAlarm");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dateByAddingTimeInterval:", 30.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          objc_msgSend(v14, "fireWithDate:error:", v16, &v22);
          v17 = v22;

          if (v17)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "description");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v27 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]";
              v28 = 2112;
              v29 = v21;
              _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%s watch separation buffer timer setup failed with error, %@", buf, 0x16u);

            }
          }

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
      }
      else if (-[NSObject wristState](v8, "wristState") == 2)
      {
        -[SMTriggerOffWrist offWristThresholdTimerAlarm](self, "offWristThresholdTimerAlarm");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[SMTriggerOffWrist offWristThresholdTimerAlarm](self, "offWristThresholdTimerAlarm");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "invalidate");

          -[SMTriggerOffWrist setOffWristThresholdTimerAlarm:](self, "setOffWristThresholdTimerAlarm:", 0);
        }
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTWatchWristStateManagerWristStateChangedNotification class]]", buf, 2u);
    }
  }

}

void __54__SMTriggerOffWrist__onWristStateChangedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
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
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "offWristThresholdTimerAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]_block_invoke";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired", (uint8_t *)&v11, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "offWristThresholdTimerAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7 = [SMTriggerNotification alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v7, "initWithTriggerCategory:SOSState:triggerName:date:details:", 19, 1, CFSTR("SMTriggerOffWrist"), v8, MEMORY[0x1E0C9AA70]);

  objc_msgSend(WeakRetained, "sessionMonitorDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onTriggerNotification:", v9);

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

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_wristStateManager, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (RTXPCTimerAlarm)offWristThresholdTimerAlarm
{
  return self->_offWristThresholdTimerAlarm;
}

- (void)setOffWristThresholdTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_offWristThresholdTimerAlarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offWristThresholdTimerAlarm, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end
