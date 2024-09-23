@implementation SCLSettingsSyncCoordinator

- (SCLSettingsSyncCoordinator)initWithFileURL:(id)a3 pairingID:(id)a4 schedule:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SCLSettingsSyncCoordinator *v14;
  uint64_t v15;
  NSURL *contextURL;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *xpcActivityName;
  void *v21;
  void *v22;
  SCLSettingsSyncStateMachine *v23;
  SCLSettingsSyncStateMachine *stateMachine;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SCLSettingsSyncCoordinator;
  v14 = -[SCLSettingsSyncCoordinator init](&v26, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("SettingsSyncContext.plist"));
    v15 = objc_claimAutoreleasedReturnValue();
    contextURL = v14->_contextURL;
    v14->_contextURL = (NSURL *)v15;

    objc_storeStrong((id *)&v14->_schedule, a5);
    objc_storeStrong((id *)&v14->_queue, a6);
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("com.apple.schooltimed.settingssync-%@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    xpcActivityName = v14->_xpcActivityName;
    v14->_xpcActivityName = (NSString *)v19;

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v14->_contextURL);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v23 = -[SCLSettingsSyncStateMachine initWithContext:]([SCLSettingsSyncStateMachine alloc], "initWithContext:", v22);
    stateMachine = v14->_stateMachine;
    v14->_stateMachine = v23;

    -[SCLSettingsSyncStateMachine setDelegate:](v14->_stateMachine, "setDelegate:", v14);
    -[SCLSettingsSyncCoordinator registerActivityWithCriteria:](v14, "registerActivityWithCriteria:", *MEMORY[0x24BDAC5A0]);

  }
  return v14;
}

- (void)activate
{
  id v2;

  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)applySchedule:(id)a3
{
  id v4;
  NSObject *v5;
  SCLScheduleSettings *v6;
  SCLScheduleSettings *schedule;
  id v8;

  v4 = a3;
  -[SCLSettingsSyncCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (SCLScheduleSettings *)objc_msgSend(v4, "copy");
  schedule = self->_schedule;
  self->_schedule = v6;

  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsDidChange");

}

- (void)noteSignificantUserInteractionOccured
{
  NSObject *v3;
  id v4;

  -[SCLSettingsSyncCoordinator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "significantUserInteractionOccurred");

}

- (void)commitTimerFired
{
  NSObject *v3;
  NSObject *v4;
  id v5;

  -[SCLSettingsSyncCoordinator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v4);

  -[SCLSettingsSyncCoordinator setTimerSource:](self, "setTimerSource:", 0);
  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitSettings");

}

- (void)identifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v11 = a5;
  v8 = a3;
  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "messageDidSend:", v8);
  else
    objc_msgSend(v9, "message:failedWithError:", v8, v11);

}

- (void)didDeliverMessageWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWasDelivered:", v4);

}

- (void)beginActivity:(id)a3
{
  _xpc_activity_s *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _xpc_activity_s *v11;
  _QWORD v12[5];
  _xpc_activity_s *v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_activity_s *)a3;
  v5 = _os_activity_create(&dword_21E4AD000, "Settings Sync Activity", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_transport_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SCLSettingsSyncCoordinator xpcActivityName](self, "xpcActivityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Begin sync activity %@", buf, 0xCu);

  }
  if (!xpc_activity_set_state(v4, 4))
  {
    scl_persistence_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[SCLSettingsSyncCoordinator xpcActivityName](self, "xpcActivityName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLSettingsSyncCoordinator beginActivity:].cold.1(v9, (uint64_t)buf, v8);
    }

  }
  -[SCLSettingsSyncCoordinator queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke;
  v12[3] = &unk_24E29BBB0;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, v12);

  os_activity_scope_leave(&state);
}

void __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcActivityStarted");

  if (!xpc_activity_set_state(*(xpc_activity_t *)(v1 + 8), 5))
  {
    scl_transport_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke_cold_1((id *)v1, v3);

  }
}

- (void)stateMachine:(id)a3 didTransitionFromState:(id)a4 toState:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  id v27;
  id v28;

  v6 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(a3, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  if (v9)
  {
    scl_transport_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SCLSettingsSyncCoordinator stateMachine:didTransitionFromState:toState:].cold.2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    -[SCLSettingsSyncCoordinator contextURL](self, "contextURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v18 = objc_msgSend(v8, "writeToURL:options:error:", v17, 0x10000000, &v27);
    v9 = v27;

    scl_transport_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_21E4AD000, v10, OS_LOG_TYPE_INFO, "Saved state machine context", v26, 2u);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      -[SCLSettingsSyncCoordinator stateMachine:didTransitionFromState:toState:].cold.1((uint64_t)v9, v10, v20, v21, v22, v23, v24, v25);
    }
  }

}

- (void)stateMachine:(id)a3 scheduleCommitTimerWithInterval:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  dispatch_source_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  scl_persistence_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_DEFAULT, "Sync coordinator start timer: %@", buf, 0xCu);

  }
  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v10);

    -[SCLSettingsSyncCoordinator setTimerSource:](self, "setTimerSource:", 0);
  }
  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    -[SCLSettingsSyncCoordinator queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v13);
    -[SCLSettingsSyncCoordinator setTimerSource:](self, "setTimerSource:", v14);

  }
  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_walltime(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak((id *)buf, self);
  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v17 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __75__SCLSettingsSyncCoordinator_stateMachine_scheduleCommitTimerWithInterval___block_invoke;
  handler[3] = &unk_24E29B8C0;
  objc_copyWeak(&v20, (id *)buf);
  dispatch_source_set_event_handler(v17, handler);

  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __75__SCLSettingsSyncCoordinator_stateMachine_scheduleCommitTimerWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "commitTimerFired");

}

- (void)cancelCommitTimerForStateMachine:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  scl_persistence_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "Sync coordinator cancel tiemr", v7, 2u);
  }

  -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SCLSettingsSyncCoordinator timerSource](self, "timerSource");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

  }
}

- (void)performSyncForStateMachine:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_21E4AD000, "Perform Settings Sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_persistence_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Sync coordinator perform sync", buf, 2u);
  }

  -[SCLSettingsSyncCoordinator transport](self, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncCoordinator schedule](self, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v9 = objc_msgSend(v7, "sendSchedule:identifier:error:", v8, &v16, &v15);
  v10 = v16;
  v11 = v15;

  if (v9)
  {
    scl_transport_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_21E4AD000, v12, OS_LOG_TYPE_DEFAULT, "Sent schedule settings with identifier %@", buf, 0xCu);
    }

    -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didEnqueueMessage:", v10);
  }
  else
  {
    scl_transport_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_21E4AD000, v14, OS_LOG_TYPE_DEFAULT, "Failed to send schedule settings with error: %@", buf, 0xCu);
    }

    -[SCLSettingsSyncCoordinator stateMachine](self, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enqueueFailedWithError:", v11);
  }

  os_activity_scope_leave(&state);
}

- (void)cancelRetryActivityForStateMachine:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  scl_persistence_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SCLSettingsSyncCoordinator xpcActivityName](self, "xpcActivityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "Sync coordinator cancel retry activity: %@", (uint8_t *)&v8, 0xCu);

  }
  -[SCLSettingsSyncCoordinator xpcActivityName](self, "xpcActivityName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);

  xpc_activity_unregister(v7);
}

- (void)stateMachine:(id)a3 scheduleRetryWithActivityCriteria:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  scl_persistence_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Sync coordinator schedule retry activity %@", (uint8_t *)&v7, 0xCu);
  }

  -[SCLSettingsSyncCoordinator registerActivityWithCriteria:](self, "registerActivityWithCriteria:", v5);
}

- (void)registerActivityWithCriteria:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  id v8;
  _QWORD handler[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[SCLSettingsSyncCoordinator xpcActivityName](self, "xpcActivityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke;
  handler[3] = &unk_24E29C1B0;
  v8 = v6;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  xpc_activity_register(v7, v4, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  xpc_object_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!xpc_activity_get_state(v3))
  {
    v5 = xpc_activity_copy_criteria(v3);
    if (v5)
      goto LABEL_13;
    scl_transport_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "No existing activity for checkin %@", (uint8_t *)&v11, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "beginActivity:", v3);
    goto LABEL_13;
  }
  scl_transport_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_2(a1, v8, v9);

  if (!xpc_activity_set_state(v3, 5))
  {
    scl_transport_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_1(a1, v6, v10);
    goto LABEL_12;
  }
LABEL_13:

}

- (SCLScheduleSettings)schedule
{
  return self->_schedule;
}

- (SCLSettingsSyncTransport)transport
{
  return (SCLSettingsSyncTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
  objc_storeWeak((id *)&self->_transport, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SCLSettingsSyncStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (NSURL)contextURL
{
  return self->_contextURL;
}

- (NSString)xpcActivityName
{
  return self->_xpcActivityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityName, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_schedule, 0);
}

- (void)beginActivity:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a3, (uint64_t)a3, "Failed to move activity %@ to CONTINUE state", (uint8_t *)a2);

}

void __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "xpcActivityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a2, v4, "Failed to move activity %@ to DONE state", (uint8_t *)&v5);

}

- (void)stateMachine:(uint64_t)a3 didTransitionFromState:(uint64_t)a4 toState:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21E4AD000, a2, a3, "Could not save state machine context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)stateMachine:(uint64_t)a3 didTransitionFromState:(uint64_t)a4 toState:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21E4AD000, a2, a3, "Could not generate data for state machine context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a2, a3, "Could not end %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a2, a3, "Could not start activity %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
