@implementation SMTriggerSOS

- (SMTriggerSOS)initWithQueue:(id)a3 sessionStore:(id)a4
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  char *v13;
  void *v14;
  SMTriggerSOS *v15;
  SMTriggerSOS *v16;
  uint64_t v17;
  NSMutableDictionary *sosEvents;
  uint64_t v19;
  RTDarwinNotificationHelper *darwinSOSNotificationHelper;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *SOSNotifications;
  objc_super v29;
  _QWORD v30[5];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[SMTriggerSOS initWithQueue:sessionStore:]";
      v33 = 1024;
      LODWORD(v34) = 28;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v13;
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, initializing triggerSOS", buf, 0x16u);

  }
  v29.receiver = self;
  v29.super_class = (Class)SMTriggerSOS;
  v15 = -[SMTriggerSOS init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_sessionStore, a4);
    v17 = objc_opt_new();
    sosEvents = v16->_sosEvents;
    v16->_sosEvents = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    darwinSOSNotificationHelper = v16->_darwinSOSNotificationHelper;
    v16->_darwinSOSNotificationHelper = (RTDarwinNotificationHelper *)v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89878]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89888]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89890]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89880]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89870]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v26 = objc_claimAutoreleasedReturnValue();
    SOSNotifications = v16->_SOSNotifications;
    v16->_SOSNotifications = (NSArray *)v26;

  }
  return v16;
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
  -[SMTriggerSOS queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SMTriggerSOS_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__SMTriggerSOS_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SMTriggerSOS SOSNotifications](self, "SOSNotifications", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[SMTriggerSOS darwinSOSNotificationHelper](self, "darwinSOSNotificationHelper");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObserver:center:key:callback:info:suspensionBehavior:", self, CFNotificationCenterGetDarwinNotifyCenter(), v12, onSOSNotification, 0, 1);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, start monitoring SOS darwin notifications", buf, 0x16u);

  }
  if (v6)
    v6[2](v6, 0);

}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMTriggerSOS queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SMTriggerSOS_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __42__SMTriggerSOS_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SMTriggerSOS SOSNotifications](self, "SOSNotifications", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[SMTriggerSOS darwinSOSNotificationHelper](self, "darwinSOSNotificationHelper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), v11, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, stop monitoring for SOS darwin notifications", buf, 0x16u);

  }
  if (v5)
    v5[2](v5, 0);

}

- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMTriggerSOS queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SMTriggerSOS_onRemoteEmergencyContactsNotified___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __50__SMTriggerSOS_onRemoteEmergencyContactsNotified___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySOSTriggerWithCategory:", *(_QWORD *)(a1 + 40));
}

- (void)handleSOSNotificationForReason:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, handling SOS trigger notification for reason %@", buf, 0x20u);

  }
  -[SMTriggerSOS queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__SMTriggerSOS_handleSOSNotificationForReason___block_invoke;
  v12[3] = &unk_1E9297540;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_async(v10, v12);

}

uint64_t __47__SMTriggerSOS_handleSOSNotificationForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSOSNotificationForReason:", *(_QWORD *)(a1 + 40));
}

- (void)_handleSOSNotificationForReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SMTriggerSOS SOSNotifications](self, "SOSNotifications", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMTriggerSOS sosEvents](self, "sosEvents");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v4);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89878]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89888]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
    {
      v14 = 13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89880]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
      {
        v14 = 12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D89870]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v4, "isEqualToString:", v19);

        if (v20)
          v14 = 10;
        else
          v14 = 14;
      }
    }
  }
  -[SMTriggerSOS _notifySOSTriggerWithCategory:](self, "_notifySOSTriggerWithCategory:", v14);

}

- (void)_notifySOSTriggerWithCategory:(unint64_t)a3
{
  SMTriggerNotification *v5;
  void *v6;
  void *v7;
  SMTriggerNotification *v8;

  v5 = [SMTriggerNotification alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v5, "initWithTriggerCategory:SOSState:triggerName:date:details:", a3, 2, CFSTR("SMTriggerSOS"), v6, MEMORY[0x1E0C9AA70]);

  -[SMTriggerSOS sessionMonitorDelegate](self, "sessionMonitorDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "onTriggerNotification:", v8);

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

- (NSMutableDictionary)sosEvents
{
  return self->_sosEvents;
}

- (void)setSosEvents:(id)a3
{
  objc_storeStrong((id *)&self->_sosEvents, a3);
}

- (NSArray)SOSNotifications
{
  return self->_SOSNotifications;
}

- (void)setSOSNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_SOSNotifications, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (RTDarwinNotificationHelper)darwinSOSNotificationHelper
{
  return self->_darwinSOSNotificationHelper;
}

- (void)setDarwinSOSNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_darwinSOSNotificationHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinSOSNotificationHelper, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_SOSNotifications, 0);
  objc_storeStrong((id *)&self->_sosEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end
