@implementation RTXPCActivityManager

- (RTXPCActivityManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_diagnostics_timerManager_identifier_);
}

- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  RTXPCActivityManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[RTXPCActivityManager initWithDefaultsManager:diagnostics:timerManager:identifier:](self, "initWithDefaultsManager:diagnostics:timerManager:identifier:", v10, v9, v11, v8);

  return v12;
}

- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 timerManager:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  RTXPCActivityManager *v16;
  RTXPCActivityManager *v17;
  uint64_t v18;
  NSMutableDictionary *registrants;
  uint64_t v20;
  NSMutableArray *pendingTasks;
  RTXPCActivityManager *v22;
  NSObject *v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: defaultsManager";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: identifer";
      goto LABEL_16;
    }
LABEL_17:

    v22 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTXPCActivityManager;
  v16 = -[RTNotifier init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_diagnostics, a4);
    objc_storeStrong((id *)&v17->_timerManager, a5);
    v18 = objc_opt_new();
    registrants = v17->_registrants;
    v17->_registrants = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    pendingTasks = v17->_pendingTasks;
    v17->_pendingTasks = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v17->_identifier, a6);
    -[RTService setup](v17, "setup");
  }
  self = v17;
  v22 = self;
LABEL_18:

  return v22;
}

+ (id)lastAttemptDateKeyForIdentifier:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(CFSTR("XPCActivityLastAttemptDate"), "stringByAppendingPathExtension:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[RTXPCActivityManager lastAttemptDateKeyForIdentifier:]";
      v8 = 1024;
      v9 = 377;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }
  return v3;
}

+ (id)lastCompleteDateKeyForIdentifier:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(CFSTR("XPCActivityLastCompleteDate"), "stringByAppendingPathExtension:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[RTXPCActivityManager lastCompleteDateKeyForIdentifier:]";
      v8 = 1024;
      v9 = 388;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }
  return v3;
}

- (void)deleteDefaultsForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTXPCActivityManager lastAttemptDateKeyForIdentifier:](RTXPCActivityManager, "lastAttemptDateKeyForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", 0, v6);

    -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
    v7 = objc_claimAutoreleasedReturnValue();
    +[RTXPCActivityManager lastCompleteDateKeyForIdentifier:](RTXPCActivityManager, "lastCompleteDateKeyForIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", 0, v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v9, 2u);
    }
  }

}

- (void)_setup
{
  +[RTXPCActivityManager xpcActivityUnregisterIdentifier:](RTXPCActivityManager, "xpcActivityUnregisterIdentifier:", "RTLocationAwarenessManagerXPCActivityIdentifierHourly");
}

- (void)_shutdownWithHandler:(id)a3
{
  RTTimer *timer;
  void *v5;
  id v6;

  v6 = a3;
  -[RTTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (id)_lastAttemptDateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lastAttemptDateKeyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateLastAttemptDateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lastAttemptDateKeyForIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

- (id)_lastCompleteDateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lastCompleteDateKeyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateLastCompleteDateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lastCompleteDateKeyForIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[RTXPCActivityManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

+ (id)criteriaDictionaryWithCriteria:(id)a3
{
  id v3;
  xpc_object_t v4;
  double v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  xpc_object_t v18;
  id *v19;
  const char *v20;
  void *v21;
  const char *v22;
  double v23;
  _Unwind_Exception *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  if (v3)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    objc_msgSend(v3, "interval");
    v6 = v5;
    if (v5 > 0.0)
    {
      v7 = (const char *)*MEMORY[0x1E0C807A8];
      objc_msgSend(v3, "interval");
      xpc_dictionary_set_int64(v4, v7, (uint64_t)v8);
    }
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], v6 > 0.0);
    v9 = (const char *)*MEMORY[0x1E0C80760];
    objc_msgSend(v3, "delay");
    xpc_dictionary_set_int64(v4, v9, (uint64_t)v10);
    v11 = (const char *)*MEMORY[0x1E0C80790];
    objc_msgSend(v3, "gracePeriod");
    xpc_dictionary_set_int64(v4, v11, (uint64_t)v12);
    v13 = (const char *)*MEMORY[0x1E0C80878];
    v14 = (const char *)objc_msgSend((id)objc_opt_class(), "convertPriority:", objc_msgSend(v3, "priority"));
    xpc_dictionary_set_string(v4, v13, v14);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], objc_msgSend(v3, "allowBattery"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808D0], objc_msgSend(v3, "requireNetworkConnectivity"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808C8], objc_msgSend(v3, "requireInexpensiveNetworkConnectivity"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80868], objc_msgSend(v3, "powerNap"));
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80858], objc_msgSend(v3, "networkTransferUploadSize"));
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80818], objc_msgSend(v3, "networkTransferDownloadSize"));
    objc_msgSend(v3, "requireBatteryLevel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (const char *)*MEMORY[0x1E0C808C0];
      objc_msgSend(v3, "requireBatteryLevel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_int64(v4, v16, objc_msgSend(v17, "integerValue"));

      v18 = xpc_dictionary_create(0, 0, 0);
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v19 = (id *)_MergedGlobals_6;
      v30 = _MergedGlobals_6;
      if (!_MergedGlobals_6)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke;
        v26[3] = &unk_1E9298BF8;
        v26[4] = &v27;
        __get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke((uint64_t)v26);
        v19 = (id *)v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v19)
      {
        dlerror();
        v25 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v27, 8);
        _Unwind_Resume(v25);
      }
      v20 = (const char *)objc_msgSend(objc_retainAutorelease(*v19), "cStringUsingEncoding:", 4);
      objc_msgSend(v3, "requireBatteryLevel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_int64(v18, v20, objc_msgSend(v21, "integerValue"));

      xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E0C80778], v18);
    }
    objc_msgSend(v3, "expectedDuration");
    v22 = (const char *)*MEMORY[0x1E0C80788];
    objc_msgSend(v3, "expectedDuration");
    xpc_dictionary_set_int64(v4, v22, (uint64_t)v23);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808F8], objc_msgSend(v3, "userRequestedBackgroundTask"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80758], objc_msgSend(v3, "cpuIntensive"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80860], objc_msgSend(v3, "postInstall"));
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808A0], objc_msgSend(v3, "requiresBuddyComplete"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  RTXPCActivityRegistrant *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        v11 = -[RTXPCActivityRegistrant initWithIdentifier:criteria:handler:]([RTXPCActivityRegistrant alloc], "initWithIdentifier:criteria:handler:", v8, v9, v10);
        if (v11)
        {
          v12 = v11;
          -[RTXPCActivityManager registrants](self, "registrants");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v12, v14);

          objc_msgSend(v12, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTXPCActivityManager _lastAttemptDateForIdentifier:](self, "_lastAttemptDateForIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            -[RTXPCActivityManager identifier](self, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringFromDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v16;
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "timeIntervalSinceDate:", v20);
            *(_DWORD *)buf = 138413058;
            v33 = v18;
            v34 = 2112;
            v35 = v12;
            v36 = 2112;
            v37 = v31;
            v38 = 2048;
            v39 = v21;
            _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "manager, %@, register activity, registrant, %@, lastAttemptDate, %@, intervalSinceLastAttempt, %.2f", buf, 0x2Au);
            if (!v16)

          }
          v22 = -[RTXPCActivityManager _registerRegistrant:](self, "_registerRegistrant:", v12);
        }
        else
        {
          v28 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *MEMORY[0x1E0D18598];
          v40 = *MEMORY[0x1E0CB2D50];
          v41 = CFSTR("requires a valid registrant.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 7, v16);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v30);

          v12 = 0;
        }
        goto LABEL_15;
      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0D18598];
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = CFSTR("requires a valid criteria.");
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v43;
      v27 = &v42;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0D18598];
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = CFSTR("requires a valid identifier range.");
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = (const __CFString **)v45;
      v27 = &v44;
    }
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 7, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v16);
LABEL_15:

  }
}

- (void)_runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTXPCActivityTask *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[RTXPCActivityTask initWithIdentifier:activity:handler:]([RTXPCActivityTask alloc], "initWithIdentifier:activity:handler:", v8, v10, v9);

  if (v11)
  {
    -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    -[RTXPCActivityManager _startDeferCheckTimer](self, "_startDeferCheckTimer");
    -[RTXPCActivityManager _scheduleNextTask](self, "_scheduleNextTask");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[RTXPCActivityManager identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "manager, %@, unable to create task for identifier, %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__RTXPCActivityManager_runRegistrantWithIdentifier_activity_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __69__RTXPCActivityManager_runRegistrantWithIdentifier_activity_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runRegistrantWithIdentifier:activity:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_startDeferCheckTimer
{
  void *v3;
  void *v4;
  uint64_t v5;
  RTTimerManager *timerManager;
  void *v7;
  RTTimer *v8;
  RTTimer *timer;
  _QWORD v10[5];

  if (!self->_timer)
  {
    -[RTXPCActivityManager runningTask](self, "runningTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (!v5)
        return;
    }
    timerManager = self->_timerManager;
    -[RTNotifier queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__RTXPCActivityManager__startDeferCheckTimer__block_invoke;
    v10[3] = &unk_1E92977B8;
    v10[4] = self;
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("deferTimer"), v7, v10);
    v8 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v8;

    -[RTTimer fireAfterDelay:interval:](self->_timer, "fireAfterDelay:interval:", 5.0, 5.0);
    -[RTTimer resume](self->_timer, "resume");
  }
}

uint64_t __45__RTXPCActivityManager__startDeferCheckTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeferCheckTimer");
}

- (void)_stopDeferCheckTimer
{
  void *timer;
  void *v4;
  uint64_t v5;

  if (self->_timer)
  {
    -[RTXPCActivityManager runningTask](self, "runningTask");
    timer = (void *)objc_claimAutoreleasedReturnValue();
    if (timer)
    {
LABEL_3:

      return;
    }
    -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[RTTimer invalidate](self->_timer, "invalidate");
      timer = self->_timer;
      self->_timer = 0;
      goto LABEL_3;
    }
  }
}

- (void)_onDeferCheckTimer
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[RTXPCActivityManager identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTXPCActivityManager runningTask](self, "runningTask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "valueForKeyPath:", CFSTR("identifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v36 = v23;
    v37 = 2112;
    v38 = v24;
    v39 = 2112;
    v40 = v26;
    v41 = 2112;
    v42 = v29;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "manager, %@, %@, running task, %@, pending tasks, %@", buf, 0x2Au);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)-[NSMutableArray copy](self->_pendingTasks, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "activity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[RTXPCActivityManager xpcActivityShouldDeferActivity:](RTXPCActivityManager, "xpcActivityShouldDeferActivity:", v11);

        if (v12)
        {
          objc_msgSend(v10, "handler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "handler");
            v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v14[2](v14, 3, 0);

          }
          -[NSMutableArray removeObject:](self->_pendingTasks, "removeObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  -[RTXPCActivityManager runningTask](self, "runningTask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[RTXPCActivityManager runningTask](self, "runningTask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[RTXPCActivityManager xpcActivityShouldDeferActivity:](RTXPCActivityManager, "xpcActivityShouldDeferActivity:", v17);

    if (v18)
    {
      -[RTXPCActivityManager runningTask](self, "runningTask");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[RTXPCActivityManager runningTask](self, "runningTask");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handler");
        v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v22[2](v22, 5, 0);

      }
      -[RTXPCActivityManager setRunningTask:](self, "setRunningTask:", 0);
    }
  }
  -[RTXPCActivityManager _stopDeferCheckTimer](self, "_stopDeferCheckTimer");
}

- (void)_scheduleNextTask
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  RTDiagnostics *diagnostics;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
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
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  void *v50;
  _QWORD v51[4];
  id v52;
  RTXPCActivityManager *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  id location;
  uint64_t v58;
  const __CFString *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[RTXPCActivityManager runningTask](self, "runningTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[RTXPCActivityManager identifier](self, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v61 = v32;
        v62 = 2112;
        v63 = v33;
        _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "manager, %@, %@, no more tasks to run", buf, 0x16u);

      }
      goto LABEL_20;
    }
    -[RTXPCActivityManager pendingTasks](self, "pendingTasks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

    -[RTXPCActivityManager registrants](self, "registrants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __41__RTXPCActivityManager__scheduleNextTask__block_invoke;
      v51[3] = &unk_1E929CA78;
      objc_copyWeak(&v56, &location);
      v16 = v15;
      v52 = v16;
      v53 = self;
      v17 = v5;
      v54 = v17;
      v18 = v14;
      v55 = v18;
      v50 = (void *)MEMORY[0x1D8232094](v51);
      -[RTXPCActivityManager setRunningTask:](self, "setRunningTask:", v17);
      _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[RTXPCActivityManager identifier](self, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v18, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v61 = v20;
        v62 = 2112;
        v63 = v21;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "manager, %@, run started, identifier, %@", buf, 0x16u);

      }
      diagnostics = self->_diagnostics;
      v23 = (void *)MEMORY[0x1E0CB3940];
      -[NSObject identifier](v17, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Before identifier, %@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDiagnostics logDiagnosticStateWithReason:](diagnostics, "logDiagnosticStateWithReason:", v25);

      -[NSObject identifier](v18, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTXPCActivityManager _lastAttemptDateForIdentifier:](self, "_lastAttemptDateForIdentifier:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject identifier](v18, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTXPCActivityManager _lastCompleteDateForIdentifier:](self, "_lastCompleteDateForIdentifier:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "laterDate:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToDate:", v29))
          v31 = 1;
        else
          v31 = 2;

      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeIntervalSinceDate:", v27);
      v40 = v39;

      v41 = (void *)objc_opt_new();
      -[NSObject identifier](v18, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("identifier"));

      objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_1E9327F38, CFSTR("state"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("result"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v44, CFSTR("interval"));

      v45 = objc_alloc(MEMORY[0x1E0CB3940]);
      v46 = (void *)objc_msgSend(v45, "initWithCString:encoding:", RTAnalyticsEventXPCActivitySuccessRate, 1);
      log_analytics_submission(v46, v41);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      -[NSObject identifier](v18, "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTXPCActivityManager _updateLastAttemptDateForIdentifier:](self, "_updateLastAttemptDateForIdentifier:", v48);

      -[NSObject handler](v18, "handler");
      v49 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v49)[2](v49, v50, 0);

      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
    }
    else
    {
      -[NSObject handler](v5, "handler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v14 = 0;
        goto LABEL_20;
      }
      -[NSObject handler](v5, "handler");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v58 = *MEMORY[0x1E0CB2D50];
      v59 = CFSTR("no registrant with identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, 5, v37);

    }
LABEL_20:

    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[RTXPCActivityManager identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTXPCActivityManager runningTask](self, "runningTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v61 = v6;
    v62 = 2112;
    v63 = v7;
    v64 = 2112;
    v65 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "manager, %@, %@, defer next task until the current task is finished, %@", buf, 0x20u);

  }
LABEL_21:

}

void __41__RTXPCActivityManager__scheduleNextTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RTXPCActivityManager__scheduleNextTask__block_invoke_2;
  block[3] = &unk_1E929BF50;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = *(id *)(a1 + 56);
  v15 = v3;
  v9 = v3;
  dispatch_async(v5, block);

}

void __41__RTXPCActivityManager__scheduleNextTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("After identifier, %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logDiagnosticStateWithReason:", v8);

  _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2048;
    v32 = v4;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "manager, %@, run finished, identifier, %@, error, %@, latency, %.2f", buf, 0x2Au);

  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E9327F20, CFSTR("state"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E9327F38, CFSTR("result"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("interval"));

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = (void *)objc_msgSend(v16, "initWithCString:encoding:", RTAnalyticsEventXPCActivitySuccessRate, 1);
  log_analytics_submission(v17, v13);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  v19 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_updateLastCompleteDateForIdentifier:", v20);

  objc_msgSend(*(id *)(a1 + 40), "runningTask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 48);

  if (v21 == v22)
  {
    objc_msgSend(*(id *)(a1 + 48), "handler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 48), "handler");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v24[2](v24, 5, *(_QWORD *)(a1 + 64));

    }
    objc_msgSend(*(id *)(a1 + 40), "setRunningTask:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_scheduleNextTask");
  }

}

- (id)_registerRegistrant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  RTXPCActivityManager *v18;
  id v19;
  id v20;
  id location;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "criteria");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "criteriaDictionaryWithCriteria:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v4, "identifier");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __44__RTXPCActivityManager__registerRegistrant___block_invoke;
      v16[3] = &unk_1E929CAC8;
      v10 = v7;
      v17 = v10;
      v18 = self;
      v19 = v4;
      objc_copyWeak(&v20, &location);
      +[RTXPCActivityManager xpcActivityRegisterIdentifier:criteria:handler:](RTXPCActivityManager, "xpcActivityRegisterIdentifier:criteria:handler:", v9, *MEMORY[0x1E0C80748], v16);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      v11 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("requires a valid criteria.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("requires a valid registrant.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __44__RTXPCActivityManager__registerRegistrant___block_invoke(xpc_object_t *a1, void *a2)
{
  id v3;
  int64_t v4;
  int64_t v5;
  NSObject *WeakRetained;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  xpc_object_t v13;
  xpc_object_t v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  xpc_object_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = +[RTXPCActivityManager xpcActivityGetStateActivity:](RTXPCActivityManager, "xpcActivityGetStateActivity:", v3);
  if (v4 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v9;
      v31 = 2112;
      v32 = (int64_t)v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "manager, %@, run, identifier, %@", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(a1[6], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __44__RTXPCActivityManager__registerRegistrant___block_invoke_194;
    v25[3] = &unk_1E929CAA0;
    v12 = v3;
    v13 = a1[5];
    v14 = a1[6];
    v26 = v12;
    v27 = v13;
    v28 = v14;
    -[NSObject runRegistrantWithIdentifier:activity:handler:](WeakRetained, "runRegistrantWithIdentifier:activity:handler:", v11, v12, v25);

    if (!+[RTXPCActivityManager xpcActivitySetStateActivity:state:](RTXPCActivityManager, "xpcActivitySetStateActivity:state:", v12, 4))
    {
      _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1[5], "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v23;
        v31 = 2112;
        v32 = (int64_t)v24;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "manager, %@, run, identifier, %@, failed to set activity to state, XPC_ACTIVITY_STATE_CONTINUE", buf, 0x16u);

      }
    }

  }
  else
  {
    v5 = v4;
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1[5], "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "identifier");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v16;
        v31 = 2048;
        v32 = v5;
        v33 = 2112;
        v34 = v17;
        _os_log_error_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_ERROR, "manager, %@, unhandled state, %lu, identifier, %@", buf, 0x20u);

      }
    }
    else
    {
      +[RTXPCActivityManager xpcActivityCopyCriteriaActivity:](RTXPCActivityManager, "xpcActivityCopyCriteriaActivity:", v3);
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (WeakRetained && xpc_equal(a1[4], WeakRetained))
      {
        v7 = CFSTR("NO");
      }
      else
      {
        +[RTXPCActivityManager xpcActivitySetCriteriaActivity:criteria:](RTXPCActivityManager, "xpcActivitySetCriteriaActivity:criteria:", v3, a1[4]);
        v7 = CFSTR("YES");
      }
      _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1[5], "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "identifier");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        *(_DWORD *)buf = 138413058;
        v22 = CFSTR("YES");
        v30 = v19;
        if (!WeakRetained)
          v22 = CFSTR("NO");
        v31 = 2112;
        v32 = v20;
        v33 = 2112;
        v34 = v22;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "manager, %@, check-in, identifier, %@, existingCriteria, %@, setCriteria, %@", buf, 0x2Au);

      }
    }
  }

}

void __44__RTXPCActivityManager__registerRegistrant___block_invoke_194(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!+[RTXPCActivityManager xpcActivitySetStateActivity:state:](RTXPCActivityManager, "xpcActivitySetStateActivity:state:", *(_QWORD *)(a1 + 32), a2))
  {
    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2048;
      v12 = a2;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "manager, %@, run, identifier, %@, failed to set activity to state, %ld", (uint8_t *)&v7, 0x20u);

    }
  }
}

- (void)registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__RTXPCActivityManager_registerActivityWithIdentifier_criteria_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __72__RTXPCActivityManager_registerActivityWithIdentifier_criteria_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerActivityWithIdentifier:criteria:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_unregisterActivityWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!v6)
    goto LABEL_11;
  -[RTXPCActivityManager registrants](self, "registrants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTXPCActivityManager registrants](self, "registrants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[RTXPCActivityManager identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      v13 = "manager, %@, unregister activity, registrant, %@";
LABEL_7:
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[RTXPCActivityManager identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      v13 = "manager, %@, unregister activity, identifier, %@. no existing registrant";
      goto LABEL_7;
    }
  }

  +[RTXPCActivityManager xpcActivityUnregisterIdentifier:](RTXPCActivityManager, "xpcActivityUnregisterIdentifier:", objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  if (v7)
    v7[2](v7, 0);

LABEL_11:
}

- (void)unregisterActivityWithIdentifier:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTXPCActivityManager_unregisterActivityWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__RTXPCActivityManager_unregisterActivityWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterActivityWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)xpcActivityRegisterIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  xpc_activity_register(a3, a4, a5);
}

+ (void)xpcActivityUnregisterIdentifier:(const char *)a3
{
  xpc_activity_unregister(a3);
}

+ (int64_t)xpcActivityGetStateActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

+ (BOOL)xpcActivitySetStateActivity:(id)a3 state:(int64_t)a4
{
  return xpc_activity_set_state((xpc_activity_t)a3, a4);
}

+ (id)xpcActivityCopyCriteriaActivity:(id)a3
{
  return xpc_activity_copy_criteria((xpc_activity_t)a3);
}

+ (void)xpcActivitySetCriteriaActivity:(id)a3 criteria:(id)a4
{
  xpc_activity_set_criteria((xpc_activity_t)a3, a4);
}

+ (BOOL)xpcActivityShouldDeferActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableDictionary)registrants
{
  return self->_registrants;
}

- (void)setRegistrants:(id)a3
{
  objc_storeStrong((id *)&self->_registrants, a3);
}

- (RTXPCActivityTask)runningTask
{
  return self->_runningTask;
}

- (void)setRunningTask:(id)a3
{
  objc_storeStrong((id *)&self->_runningTask, a3);
}

- (NSMutableArray)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTasks, 0);
  objc_storeStrong((id *)&self->_runningTask, 0);
  objc_storeStrong((id *)&self->_registrants, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
