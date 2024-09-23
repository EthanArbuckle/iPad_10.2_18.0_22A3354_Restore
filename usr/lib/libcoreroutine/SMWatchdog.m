@implementation SMWatchdog

- (SMWatchdog)initWithDefaultsManager:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  SMWatchdog *v9;
  SMWatchdog *v10;
  SMWatchdog *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  SMWatchdog *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  id handler;
  uint64_t v21;
  RTTimerManager *timerManager;
  uint64_t v23;
  NSMutableArray *records;
  RTTimer *watchdogTimer;
  NSDate *watchdogTimerFireDate;
  RTDefaultsManager *defaultsManager;
  double v28;
  void *v29;
  void *v30;
  double v31;
  NSObject *v32;
  double heartbeatInterval;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMWatchdog;
    v9 = -[SMWatchdog init](&v35, sel_init);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (const char *)-[SMWatchdog UTF8String](objc_retainAutorelease(v11), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v11);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (const char *)objc_msgSend(v16, "UTF8String");

      }
      v17 = dispatch_queue_create(v13, v12);

      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v17;

      v19 = MEMORY[0x1D8232094](v8);
      handler = v11->_handler;
      v11->_handler = (id)v19;

      objc_storeStrong((id *)&v11->_defaultsManager, a3);
      v21 = objc_opt_new();
      timerManager = v11->_timerManager;
      v11->_timerManager = (RTTimerManager *)v21;

      v23 = objc_opt_new();
      records = v11->_records;
      v11->_records = (NSMutableArray *)v23;

      watchdogTimer = v11->_watchdogTimer;
      v11->_watchdogTimer = 0;

      watchdogTimerFireDate = v11->_watchdogTimerFireDate;
      v11->_watchdogTimerFireDate = 0;

      defaultsManager = v11->_defaultsManager;
      v28 = *MEMORY[0x1E0D8BBA8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D8BBA8]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager objectForKey:value:](defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSMHeartbeatInterval"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v11->_heartbeatInterval = v31;

      if (v11->_heartbeatInterval != v28)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          heartbeatInterval = v11->_heartbeatInterval;
          *(_DWORD *)buf = 136316162;
          v37 = "-[SMWatchdog initWithDefaultsManager:handler:]";
          v38 = 2080;
          v39 = "overriding safety monitor heartbeat interval";
          v40 = 2048;
          v41 = v28;
          v42 = 2048;
          v43 = heartbeatInterval;
          v44 = 2112;
          v45 = CFSTR("RTDefaultsSMHeartbeatInterval");
          _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }

      }
    }
    self = v10;
    v15 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SMWatchdog onSessionResumedWithState:forActiveDevice:]";
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, state, %@, activeDevice, %d", (uint8_t *)&v8, 0x1Cu);
  }

  -[SMWatchdog handleStateChange:forActiveDevice:](self, "handleStateChange:forActiveDevice:", v6, v4);
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SMWatchdog onSessionStateChanged:forActiveDevice:]";
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, state, %@, activeDevice, %d", (uint8_t *)&v8, 0x1Cu);
  }

  -[SMWatchdog handleStateChange:forActiveDevice:](self, "handleStateChange:forActiveDevice:", v6, v4);
}

- (void)handleStateChange:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (objc_msgSend(v6, "sessionState") == 1 || !objc_msgSend(v7, "sessionState"))
    {
      -[SMWatchdog shutdownWithHandler:](self, "shutdownWithHandler:", &__block_literal_global_64);
      goto LABEL_10;
    }
    -[SMWatchdog mostRecentRecord](self, "mostRecentRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if (!v10)
    {
      -[SMWatchdog queue](self, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke_9;
      v14[3] = &unk_1E9297540;
      v14[4] = self;
      v15 = v7;
      dispatch_async(v13, v14);

      goto LABEL_10;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMWatchdog handleStateChange:forActiveDevice:]";
      v12 = "%s, received duplicate state change ";
LABEL_13:
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMWatchdog handleStateChange:forActiveDevice:]";
      v12 = "%s, received state change for non-active device";
      goto LABEL_13;
    }
  }

LABEL_10:
}

void __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[SMWatchdog handleStateChange:forActiveDevice:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, shutdown watchdog with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addStateToWatchdog:", *(_QWORD *)(a1 + 40));
}

- (void)_updateTimerBasedOnRecords
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_records, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SMWatchdog records](self, "records", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        v9 = v3;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
          objc_msgSend(v10, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeout");
          objc_msgSend(v11, "dateByAddingTimeInterval:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "earlierDate:", v12);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          ++v8;
          v9 = v3;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v6);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "stringFromDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMWatchdog _updateTimerBasedOnRecords]";
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, Updating earliest fire date, %@", buf, 0x16u);

    }
    -[SMWatchdog _updateTimerIfNeeded:](self, "_updateTimerIfNeeded:", v3);

  }
  else
  {
    -[SMWatchdog _shutdownWithHandler:](self, "_shutdownWithHandler:", &__block_literal_global_11);
  }
}

void __40__SMWatchdog__updateTimerBasedOnRecords__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[SMWatchdog _updateTimerBasedOnRecords]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v0, OS_LOG_TYPE_INFO, "%s, Removing timer as there are no records left", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_updateTimerIfNeeded:(id)a3
{
  id v4;
  NSDate *watchdogTimerFireDate;
  BOOL v6;
  void *v7;
  id v8;

  v4 = a3;
  watchdogTimerFireDate = self->_watchdogTimerFireDate;
  v8 = v4;
  if (!watchdogTimerFireDate
    || (v6 = -[NSDate isEqualToDate:](watchdogTimerFireDate, "isEqualToDate:", v4), v7 = v8, !v6))
  {
    -[SMWatchdog _setUpWatchdogTimerToFireWithDate:](self, "_setUpWatchdogTimerToFireWithDate:", v8);
    v7 = v8;
  }

}

- (void)_setUpWatchdogTimerToFireWithDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  RTTimerManager *timerManager;
  void *v10;
  RTTimer *v11;
  RTTimer *watchdogTimer;
  RTTimer *v13;
  double v14;
  NSDate *v15;
  NSDate *watchdogTimerFireDate;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "stringFromDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[SMWatchdog _setUpWatchdogTimerToFireWithDate:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Set up watchdog timer with date, %@", buf, 0x16u);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToDate:", v7);

    if ((v8 & 1) == 0)
    {
      -[RTTimer invalidate](self->_watchdogTimer, "invalidate");
      objc_initWeak((id *)buf, self);
      timerManager = self->_timerManager;
      -[SMWatchdog queue](self, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __48__SMWatchdog__setUpWatchdogTimerToFireWithDate___block_invoke;
      v17[3] = &unk_1E92983E8;
      objc_copyWeak(&v18, (id *)buf);
      -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("SMWatchdogHeartbeatTimer"), v10, v17);
      v11 = (RTTimer *)objc_claimAutoreleasedReturnValue();
      watchdogTimer = self->_watchdogTimer;
      self->_watchdogTimer = v11;

      objc_msgSend(v4, "timeIntervalSinceNow");
      v13 = self->_watchdogTimer;
      if (v14 <= 0.0)
      {
        -[RTTimer fireAfterDelay:](self->_watchdogTimer, "fireAfterDelay:", 0.0);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "timeIntervalSinceNow");
        -[RTTimer fireAfterDelay:](v13, "fireAfterDelay:");
        v15 = (NSDate *)v4;
      }
      watchdogTimerFireDate = self->_watchdogTimerFireDate;
      self->_watchdogTimerFireDate = v15;

      -[RTTimer resume](self->_watchdogTimer, "resume");
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __48__SMWatchdog__setUpWatchdogTimerToFireWithDate___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "watchdogTimer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

  objc_msgSend(WeakRetained, "setWatchdogTimerFireDate:", 0);
  objc_msgSend(WeakRetained, "_checkInAllRecords");

}

- (void)addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMWatchdog queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__SMWatchdog_addRecord___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __24__SMWatchdog_addRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SMWatchdog _addRecord:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Adding record, %@", (uint8_t *)&v8, 0x16u);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStartDate:", v7);

    -[NSMutableArray addObject:](self->_records, "addObject:", v4);
    -[SMWatchdog _updateTimerBasedOnRecords](self, "_updateTimerBasedOnRecords");
  }

}

- (void)removeRecord:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[SMWatchdog queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__SMWatchdog_removeRecord___block_invoke;
    v6[3] = &unk_1E9297540;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __27__SMWatchdog_removeRecord___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeRecord:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateTimerBasedOnRecords");
}

- (void)_removeRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMWatchdog records](self, "records");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "-[SMWatchdog _removeRecord:]";
    v17 = 2112;
    v18 = (uint64_t)v6;
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Removing record, %@, Remaining records, %lu", buf, 0x20u);

  }
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __28__SMWatchdog__removeRecord___block_invoke;
    v13[3] = &unk_1E929F218;
    v14 = v4;
    objc_msgSend(v8, "predicateWithBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filterUsingPredicate:](self->_records, "filterUsingPredicate:", v9);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[SMWatchdog records](self, "records");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 136315394;
      v16 = "-[SMWatchdog _removeRecord:]";
      v17 = 2048;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, Remaining records, %lu", buf, 0x16u);

    }
  }

}

uint64_t __28__SMWatchdog__removeRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (void)_checkInAllRecords
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SMWatchdog records](self, "records");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[SMWatchdog _checkInAllRecords]";
    v32 = 2048;
    v33 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Checking in all records, %lu", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D20];
  -[SMWatchdog records](self, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v27;
    *(_QWORD *)&v11 = 138412802;
    v25 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "startDate", v25, (_QWORD)v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceDate:", v16);
        v18 = v17;

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "description");
          v23 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeout");
          *(_DWORD *)buf = v25;
          v31 = v23;
          v32 = 2048;
          v33 = v24;
          v34 = 2048;
          v35 = v18;
          _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "Checking on record, %@, timeout, %f, time since check in started, %f", buf, 0x20u);

        }
        objc_msgSend(v15, "timeout");
        if (v18 >= v20)
        {
          -[SMWatchdog handler](self, "handler");
          v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "state");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v22, 0);

          -[SMWatchdog _removeRecord:](self, "_removeRecord:", v15);
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v12);
  }

  -[SMWatchdog _updateTimerBasedOnRecords](self, "_updateTimerBasedOnRecords");
}

- (void)_addStateToWatchdog:(id)a3
{
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SMWatchdog _fetchTimeoutValueForState:](self, "_fetchTimeoutValueForState:", objc_msgSend(v8, "sessionState"));
  if (v4 > 0.0)
  {
    -[SMWatchdog _createRecord:timeoutLimit:](self, "_createRecord:timeoutLimit:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[SMWatchdog mostRecentRecord](self, "mostRecentRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMWatchdog _removeRecord:](self, "_removeRecord:", v7);

      -[SMWatchdog _updateTimerBasedOnRecords](self, "_updateTimerBasedOnRecords");
      -[SMWatchdog _addRecord:](self, "_addRecord:", v6);
      -[SMWatchdog setMostRecentRecord:](self, "setMostRecentRecord:", v6);

    }
  }

}

- (double)_fetchTimeoutValueForState:(unint64_t)a3
{
  double result;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  double v27;
  double v28;
  double *v29;

  result = 0.0;
  switch(a3)
  {
    case 2uLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSMWatchdogMonitoringStateTimeout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogMonitoringStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCE8];
      return *v29;
    case 4uLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsSMWatchdogCacheReleaseStateTimeout"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogCacheReleaseStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCC8];
      return *v29;
    case 7uLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsSMWatchdogDestinationAnomalyStateTimeout"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogDestinationAnomalyStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCD0];
      return *v29;
    case 8uLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("RTDefaultsSMWatchdogRoundTripAnomalyStateTimeout"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogRoundTripAnomalyStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCF8];
      return *v29;
    case 9uLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("RTDefaultsSMWatchdogTimerEndedPromptStateTimeout"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogTimerEndedPromptStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BD00];
      return *v29;
    case 0xAuLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", CFSTR("RTDefaultsSMWatchdogInitializingStateTimeout"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogInitializingStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCE0];
      return *v29;
    case 0xBuLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", CFSTR("RTDefaultsSMWatchdogReadyStateTimeout"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogReadyStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCF0];
      return *v29;
    case 0xCuLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("RTDefaultsSMWatchdogEndAwarenessStateTimeout"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogEndAwarenessStateTimeout");
        goto LABEL_20;
      }
      v29 = (double *)MEMORY[0x1E0D8BCD8];
      return *v29;
    case 0xEuLL:
      -[SMWatchdog defaultsManager](self, "defaultsManager", 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", CFSTR("RTDefaultsSMWatchdogWorkoutAnomalyStateTimeoutKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[SMWatchdog defaultsManager](self, "defaultsManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("RTDefaultsSMWatchdogWorkoutAnomalyStateTimeoutKey");
LABEL_20:
        objc_msgSend(v7, "objectForKey:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        v28 = v27;

        return v28;
      }
      else
      {
        v29 = (double *)MEMORY[0x1E0D8BD08];
        return *v29;
      }
    default:
      return result;
  }
}

- (id)_createRecord:(id)a3 timeoutLimit:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SMWatchdogRecord *v16;

  v6 = a3;
  objc_msgSend(v6, "sessionStateTransitionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = v8;

  v10 = v9 + a4;
  -[SMWatchdog mostRecentRecord](self, "mostRecentRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (objc_msgSend(v6, "sessionState") == 10 || objc_msgSend(v6, "sessionState") == 11)
    {
      -[SMWatchdog heartbeatInterval](self, "heartbeatInterval");
      if (v10 < v12 + v12)
      {
        -[SMWatchdog heartbeatInterval](self, "heartbeatInterval");
        v10 = v13 + v13;
      }
    }
    if (objc_msgSend(v6, "isPromptState"))
    {
      -[SMWatchdog heartbeatInterval](self, "heartbeatInterval");
      if (v10 < v14)
      {
        -[SMWatchdog heartbeatInterval](self, "heartbeatInterval");
        v10 = v15;
      }
    }
  }
  v16 = -[SMWatchdogRecord initWithState:timeout:]([SMWatchdogRecord alloc], "initWithState:timeout:", v6, v10);

  return v16;
}

- (void)receiveHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SMWatchdog receiveHeartbeatForSessionID:handler:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, sessionID, %@", buf, 0x16u);
  }

  -[SMWatchdog queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SMWatchdog_receiveHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_1E9299330;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

void __51__SMWatchdog_receiveHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "watchdogTimerFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D8BB70];
    v48 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Watchdog is not active"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (void **)v49;
    v17 = &v48;
LABEL_12:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v23 = v13;
    v24 = 11;
LABEL_13:
    v25 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, v24, v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D8BB70];
    v46 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No Watchdog record to modify"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v47;
    v17 = &v46;
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 40);
  if (!v4)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
LABEL_8:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v33 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "state");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sessionID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "-[SMWatchdog receiveHeartbeatForSessionID:handler:]_block_invoke";
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v37;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);

    }
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D8BB70];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s cannot be completed since sessionID passed in does not match current sessionID"), "-[SMWatchdog receiveHeartbeatForSessionID:handler:]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    v23 = v20;
    v24 = 7;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "sessionState") == 10)
  {

LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSessionStateTransitionDate:", v32);

    objc_msgSend(*(id *)(a1 + 32), "_addStateToWatchdog:", v31);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "mostRecentRecord");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "state");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "sessionState");

  if (v28 == 11)
    goto LABEL_15;
LABEL_16:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
}

- (void)shutdownWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMWatchdog queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SMWatchdog_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __34__SMWatchdog_shutdownWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  RTTimer *watchdogTimer;
  NSDate *watchdogTimerFireDate;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[SMWatchdog records](self, "records");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SMWatchdog _shutdownWithHandler:]";
    v11 = 2048;
    v12 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, records count, %lu", (uint8_t *)&v9, 0x16u);

  }
  -[SMWatchdog setMostRecentRecord:](self, "setMostRecentRecord:", 0);
  -[RTTimer invalidate](self->_watchdogTimer, "invalidate");
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = 0;

  watchdogTimerFireDate = self->_watchdogTimerFireDate;
  self->_watchdogTimerFireDate = 0;

  -[NSMutableArray removeAllObjects](self->_records, "removeAllObjects");
  if (v4)
    v4[2](v4, 0);

}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SMWatchdogRecord)mostRecentRecord
{
  return self->_mostRecentRecord;
}

- (void)setMostRecentRecord:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentRecord, a3);
}

- (double)heartbeatInterval
{
  return self->_heartbeatInterval;
}

- (void)setHeartbeatInterval:(double)a3
{
  self->_heartbeatInterval = a3;
}

- (RTTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogTimer, a3);
}

- (NSDate)watchdogTimerFireDate
{
  return self->_watchdogTimerFireDate;
}

- (void)setWatchdogTimerFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogTimerFireDate, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_watchdogTimerFireDate, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentRecord, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
