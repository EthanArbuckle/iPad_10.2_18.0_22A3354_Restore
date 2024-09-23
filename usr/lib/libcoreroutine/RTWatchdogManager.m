@implementation RTWatchdogManager

- (RTWatchdogManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTimerManager_lifeCycleManager_defaultsManager_platform_);
}

- (RTWatchdogManager)initWithLifeCycleManager:(id)a3 defaultsManager:(id)a4 platform:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  RTWatchdogManager *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v17;
  __int16 v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v12 = 0;
      goto LABEL_8;
    }
    v18 = 0;
    v14 = "Invalid parameter not satisfying: lifecycleManager";
    v15 = (uint8_t *)&v18;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v17 = 0;
    v14 = "Invalid parameter not satisfying: defaultsManager";
    v15 = (uint8_t *)&v17;
    goto LABEL_10;
  }
  v11 = (void *)objc_opt_new();
  self = -[RTWatchdogManager initWithTimerManager:lifeCycleManager:defaultsManager:platform:](self, "initWithTimerManager:lifeCycleManager:defaultsManager:platform:", v11, v8, v9, v10);

  v12 = self;
LABEL_8:

  return v12;
}

- (RTWatchdogManager)initWithTimerManager:(id)a3 lifeCycleManager:(id)a4 defaultsManager:(id)a5 platform:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTWatchdogManager *v15;
  id *p_isa;
  id *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  RTWatchdogManager *v22;
  id v23;
  dispatch_queue_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id *v32;
  uint64_t v33;
  id v34;
  _QWORD v36[4];
  id *v37;
  objc_super v38;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: lifecycleManager";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_13;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: defaultsManager";
      goto LABEL_13;
    }
LABEL_14:

    v22 = 0;
    goto LABEL_18;
  }
  v38.receiver = self;
  v38.super_class = (Class)RTWatchdogManager;
  v15 = -[RTWatchdogManager init](&v38, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lifecycleManager, a4);
    objc_storeStrong(p_isa + 2, a3);
    objc_storeStrong(p_isa + 6, a5);
    v17 = p_isa;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v17);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = (const char *)objc_msgSend(v23, "UTF8String");

    }
    v24 = dispatch_queue_create(v19, v18);

    v25 = v17[7];
    v17[7] = v24;

    v26 = objc_opt_new();
    v27 = v17[4];
    v17[4] = (id)v26;

    v28 = objc_opt_new();
    v29 = v17[5];
    v17[5] = (id)v28;

    objc_storeStrong(v17 + 8, a6);
    objc_msgSend(v17, "setTimeoutAndFireInterval");
    v30 = p_isa[2];
    objc_msgSend(v17, "queue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __84__RTWatchdogManager_initWithTimerManager_lifeCycleManager_defaultsManager_platform___block_invoke;
    v36[3] = &unk_1E92977B8;
    v32 = v17;
    v37 = v32;
    objc_msgSend(v30, "timerWithIdentifier:queue:handler:", CFSTR("RTWatchdogHeartbeatTimer"), v31, v36);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v32[1];
    v32[1] = (id)v33;

    objc_msgSend(v32[1], "fireWithInterval:", *((double *)v32 + 9));
    objc_msgSend(v32[1], "resume");

  }
  self = p_isa;
  v22 = self;
LABEL_18:

  return v22;
}

uint64_t __84__RTWatchdogManager_initWithTimerManager_lifeCycleManager_defaultsManager_platform___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onTimerExpiry");
}

- (void)setTimeoutAndFireInterval
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  NSObject *v7;
  double timeout;
  double fireInterval;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&self->_fireInterval = xmmword_1D1EED890;
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWatchdogManagerFireIntervalKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      self->_fireInterval = v4;
    }
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWatchdogManagerTimeoutKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      self->_timeout = v6;
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    fireInterval = self->_fireInterval;
    timeout = self->_timeout;
    v10 = 134218240;
    v11 = timeout;
    v12 = 2048;
    v13 = fireInterval;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Setting RTWatchdogManager default timeout, %f, fireInterval, %f", (uint8_t *)&v10, 0x16u);
  }

}

- (void)addObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTWatchdogManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__RTWatchdogManager_addObject___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __31__RTWatchdogManager_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_addObject:(id)a3
{
  id v4;
  double timeout;
  double v6;
  RTWatchdogRecord *v7;
  NSObject *v8;
  int v9;
  RTWatchdogRecord *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  timeout = self->_timeout;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "timeout");
    timeout = v6;
  }
  v7 = -[RTWatchdogRecord initWithObject:timeout:]([RTWatchdogRecord alloc], "initWithObject:timeout:", v4, timeout);
  -[NSMutableArray addObject:](self->_records, "addObject:", v7);
  _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Adding record, %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)removeObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTWatchdogManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__RTWatchdogManager_removeObject___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __34__RTWatchdogManager_removeObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__RTWatchdogManager__removeObject___block_invoke;
  v8[3] = &unk_1E92A0008;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](self->_records, "filterUsingPredicate:", v7);

}

uint64_t __35__RTWatchdogManager__removeObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return a1 ^ 1;
}

- (id)_getRecordsWithCriteria:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RTWatchdogManager records](self, "records", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isPendingCheckIn") == v3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_checkInAllStartedRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  double v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412546;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "checkInStartDate", v18, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceDate:", v13);
        v15 = v14;

        objc_msgSend(v12, "timeout");
        if (v15 >= v16)
        {
          -[RTWatchdogManager _timeoutExceeded:](self, "_timeoutExceeded:", v12);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v18;
            v24 = v12;
            v25 = 2048;
            v26 = v15;
            _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "Pending check-in from record, %@, time since check in started, %f", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v9);
  }

}

- (void)_timeoutExceeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "Hung record, %@, exiting", (uint8_t *)&v11, 0xCu);
  }

  -[RTWatchdogManager metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLatency");
  objc_msgSend(v6, "submitToCoreAnalytics:type:duration:", v9, 2);

  -[RTWatchdogManager lifecycleManager](self, "lifecycleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exit");

}

- (void)_checkInAllStoppedRecords:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCheckInStartDate:", v10);

        objc_msgSend(v9, "setCheckInStopDate:", 0);
        objc_msgSend(v9, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke;
        v13[3] = &unk_1E929A538;
        v13[4] = self;
        v13[5] = v9;
        objc_msgSend(v11, "checkInWithHandler:", v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke_2;
  block[3] = &unk_1E92977B8;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v2, block);

}

void __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCheckInStopDate:", v2);

  _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "Checked in record, %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_checkInAllRecords
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[RTWatchdogManager _getRecordsWithCriteria:](self, "_getRecordsWithCriteria:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWatchdogManager _getRecordsWithCriteria:](self, "_getRecordsWithCriteria:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218240;
    v7 = objc_msgSend(v3, "count");
    v8 = 2048;
    v9 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "Checking in all records, %lu started, %lu stopped", (uint8_t *)&v6, 0x16u);
  }

  -[RTWatchdogManager _checkInAllStartedRecords:](self, "_checkInAllStartedRecords:", v3);
  -[RTWatchdogManager _checkInAllStoppedRecords:](self, "_checkInAllStoppedRecords:", v4);

}

- (void)shutdownWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTWatchdogManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__RTWatchdogManager_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __41__RTWatchdogManager_shutdownWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_shutdownWithHandler:(id)a3
{
  RTTimer *watchdogHeartbeatTimer;
  void *v5;
  id v6;

  v6 = a3;
  -[RTTimer invalidate](self->_watchdogHeartbeatTimer, "invalidate");
  watchdogHeartbeatTimer = self->_watchdogHeartbeatTimer;
  self->_watchdogHeartbeatTimer = 0;

  -[NSMutableArray removeAllObjects](self->_records, "removeAllObjects");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (RTTimer)watchdogHeartbeatTimer
{
  return self->_watchdogHeartbeatTimer;
}

- (void)setWatchdogHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogHeartbeatTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTLifeCycleManager)lifecycleManager
{
  return self->_lifecycleManager;
}

- (void)setLifecycleManager:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleManager, a3);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (RTHangsMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
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

- (RTPlatform)platform
{
  return self->_platform;
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (void)setFireInterval:(double)a3
{
  self->_fireInterval = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_watchdogHeartbeatTimer, 0);
}

@end
