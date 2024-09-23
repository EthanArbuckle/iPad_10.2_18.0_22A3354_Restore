@implementation SCLSchoolModeServer

- (SCLSchoolModeServer)initWithQueue:(id)a3 suppressionManager:(id)a4 wakeScheduler:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  SCLSchoolModeServer *v12;
  SCLSchoolModeServer *v13;
  uint64_t v14;
  NSHashTable *observers;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SCLSchoolModeServer;
  v12 = -[SCLSchoolModeServer init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_targetQueue, a3);
    objc_storeStrong((id *)&v13->_suppressionManager, a4);
    objc_storeStrong((id *)&v13->_wakeScheduler, a5);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = dispatch_queue_create_with_target_V2("com.apple.schooltime.schoolmodeserver", v17, v9);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

  }
  return v13;
}

- (SCLState)currentState
{
  void *v2;
  void *v3;

  -[SCLSchoolModeServer schedulingEngine](self, "schedulingEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SCLState *)v3;
}

- (void)startWithScheduleSettings:(id)a3 shouldStartManuallyActive:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_block_t v17;
  _QWORD block[4];
  id v19;
  SCLSchoolModeServer *v20;
  os_signpost_id_t v21;
  BOOL v22;
  _QWORD handler[4];
  id v24;
  id buf;
  int out_token;

  v6 = a3;
  -[SCLSchoolModeServer targetQueue](self, "targetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  scl_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  scl_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "startWithScheduleSettings", (const char *)&unk_21E4DC639, (uint8_t *)&buf, 2u);
  }

  out_token = -1;
  objc_initWeak(&buf, self);
  -[SCLSchoolModeServer queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke;
  handler[3] = &unk_24E29BAC8;
  objc_copyWeak(&v24, &buf);
  notify_register_dispatch("SignificantTimeChangeNotification", &out_token, v12, handler);

  -[SCLSchoolModeServer setTimeChangeToken:](self, "setTimeChangeToken:", out_token);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_handleLocaleChange, *MEMORY[0x24BDBCA70], 0);

  -[SCLSchoolModeServer suppressionManager](self, "suppressionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:", self);

  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_2;
  block[3] = &unk_24E29BB18;
  v19 = v6;
  v20 = self;
  v22 = a4;
  v21 = v9;
  v16 = v6;
  v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async((dispatch_queue_t)self->_queue, v17);
  dispatch_activate((dispatch_object_t)self->_queue);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&buf);
}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleSignificantTimeChange");

}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  SCLSchedulingEngine *v6;
  id v7;
  uint64_t v8;
  SCLSchedulingEngine *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  os_activity_scope_state_s buf;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  scl_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LODWORD(buf.opaque[0]) = 67109120;
    HIDWORD(buf.opaque[0]) = qos_class_self();
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "School Mode Server Initial Evaluation", "qosClass: 0x%x", (uint8_t *)&buf, 8u);
  }

  v6 = [SCLSchedulingEngine alloc];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_6;
  v21[3] = &unk_24E29BAF0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v22 = v7;
  v23 = v8;
  v9 = -[SCLSchedulingEngine initWithParametersBlock:shouldStartManuallyActive:](v6, "initWithParametersBlock:shouldStartManuallyActive:", v21, *(unsigned __int8 *)(a1 + 56));
  -[SCLSchedulingEngine setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setSchedulingEngine:", v9);
  v10 = _os_activity_create(&dword_21E4AD000, "School Mode Server Initial Evaluation", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v10, &buf);
  scl_framework_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_21E4AD000, v11, OS_LOG_TYPE_DEFAULT, "Initial server evaluation", v20, 2u);
  }

  v12 = *(void **)(a1 + 40);
  -[SCLSchedulingEngine state](v9, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchedulingEngine nextEvaluationDate](v9, "nextEvaluationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "schedulingEngine:didUpdateState:fromState:nextEvaluationDate:", v9, v13, 0, v14);

  scl_framework_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v16, OS_SIGNPOST_INTERVAL_END, v3, "School Mode Server Initial Evaluation", (const char *)&unk_21E4DC639, v20, 2u);
  }

  scl_framework_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 48);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v18, OS_SIGNPOST_INTERVAL_END, v19, "startWithScheduleSettings", (const char *)&unk_21E4DC639, v20, 2u);
  }

  os_activity_scope_leave(&buf);
}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setScheduleSettings:", v3);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationDate:", v6);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "suppressionManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureParameters:forSuppressionStatus:", v4, objc_msgSend(v8, "status"));

}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  if (-[SCLSchoolModeServer timeChangeToken](self, "timeChangeToken") != -1)
    notify_cancel(-[SCLSchoolModeServer timeChangeToken](self, "timeChangeToken"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDBCA70], 0);

  -[SCLSchoolModeServer queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SCLSchoolModeServer_invalidate__block_invoke;
  block[3] = &unk_24E29BB40;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __33__SCLSchoolModeServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleTimerForDate:", 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[SCLSchoolModeServer targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SCLSchoolModeServer observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[SCLSchoolModeServer targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SCLSchoolModeServer observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)setActive:(BOOL)a3
{
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  BOOL v8;

  -[SCLSchoolModeServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SCLSchoolModeServer_setActive___block_invoke;
  v7[3] = &unk_24E29BB88;
  v7[4] = self;
  v8 = a3;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async(v5, v6);

}

void __33__SCLSchoolModeServer_setActive___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "schedulingEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__SCLSchoolModeServer_setActive___block_invoke_2;
  v3[3] = &__block_descriptor_33_e35_v16__0___SCLSchedulingParameters__8l;
  v4 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "updateParametersWithBlock:", v3);

}

void __33__SCLSchoolModeServer_setActive___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 32))
    v2 = 1;
  else
    v2 = 2;
  v3 = a2;
  objc_msgSend(v3, "setActivationSetting:", v2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEvaluationDate:", v4);

}

- (void)applySchedule:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SCLSchoolModeServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SCLSchoolModeServer_applySchedule___block_invoke;
  v8[3] = &unk_24E29BBB0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(v5, v7);

}

void __37__SCLSchoolModeServer_applySchedule___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "schedulingEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__SCLSchoolModeServer_applySchedule___block_invoke_2;
  v3[3] = &unk_24E29B9E0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "updateParametersWithBlock:", v3);

}

void __37__SCLSchoolModeServer_applySchedule___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v5 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvaluationDate:", v4);

  objc_msgSend(v5, "setScheduleSettings:", *(_QWORD *)(a1 + 32));
}

- (void)handleSignificantTimeChange
{
  NSObject *v3;
  id v4;

  -[SCLSchoolModeServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SCLSchoolModeServer schedulingEngine](self, "schedulingEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateParametersWithBlock:", &__block_literal_global_4);

}

void __50__SCLSchoolModeServer_handleSignificantTimeChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEvaluationDate:", v4);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v5);

}

- (void)handleLocaleChange
{
  NSObject *v3;
  dispatch_block_t v4;
  _QWORD block[5];

  -[SCLSchoolModeServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCLSchoolModeServer_handleLocaleChange__block_invoke;
  block[3] = &unk_24E29BB40;
  block[4] = self;
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);

}

void __41__SCLSchoolModeServer_handleLocaleChange__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "schedulingEngine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateParametersWithBlock:", &__block_literal_global_11);

}

void __41__SCLSchoolModeServer_handleLocaleChange__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEvaluationDate:", v4);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v5);

}

- (void)timerFired
{
  NSObject *v3;
  void *v4;
  id v5;

  -[SCLSchoolModeServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SCLSchoolModeServer schedulingEngine](self, "schedulingEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reevaluateStateAtDate:", v4);

}

- (void)_scheduleTimerForDate:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_source *timerSource;
  OS_os_transaction *v7;
  OS_os_transaction *activeTransaction;
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  OS_os_transaction *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *v15;
  NSObject *v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  OS_os_transaction *v20;
  _QWORD handler[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  OS_os_transaction *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_timerSource)
  {
    scl_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_INFO, "Cancelling timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timerSource);
    timerSource = self->_timerSource;
    self->_timerSource = 0;

  }
  if (v4)
  {
    v7 = (OS_os_transaction *)os_transaction_create();
    activeTransaction = self->_activeTransaction;
    self->_activeTransaction = v7;

    scl_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "timeIntervalSinceNow");
      *(float *)&v11 = v11;
      *(float *)&v11 = roundf(*(float *)&v11);
      objc_msgSend(v10, "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_activeTransaction;
      *(_DWORD *)buf = 138412546;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_INFO, "Setting timer for duration: %@ with transaction %@", buf, 0x16u);

    }
    -[SCLSchoolModeWakeScheduler scheduleWakeForDate:](self->_wakeScheduler, "scheduleWakeForDate:", v4);
    v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v15 = self->_timerSource;
    self->_timerSource = v14;

    v16 = self->_timerSource;
    objc_msgSend(v4, "timeIntervalSinceNow");
    v18 = dispatch_walltime(0, (uint64_t)(v17 * 1000000000.0));
    dispatch_source_set_timer(v16, v18, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak((id *)buf, self);
    v19 = self->_timerSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__SCLSchoolModeServer__scheduleTimerForDate___block_invoke;
    handler[3] = &unk_24E29B8C0;
    objc_copyWeak(&v22, (id *)buf);
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SCLSchoolModeWakeScheduler cancelWake](self->_wakeScheduler, "cancelWake");
    v20 = self->_activeTransaction;
    self->_activeTransaction = 0;

  }
}

void __45__SCLSchoolModeServer__scheduleTimerForDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timerFired");

}

- (void)schedulingEngine:(id)a3 didUpdateState:(id)a4 fromState:(id)a5 nextEvaluationDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SCLSchoolModeServer targetQueue](self, "targetQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SCLSchoolModeServer _scheduleTimerForDate:](self, "_scheduleTimerForDate:", v11);
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    -[SCLSchoolModeServer observers](self, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "server:didUpdateState:fromState:", self, v9, v10, (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
}

- (void)assertionManager:(id)a3 didUpdateAssertionsStatus:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  _QWORD v8[6];

  -[SCLSchoolModeServer targetQueue](self, "targetQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SCLSchoolModeServer schedulingEngine](self, "schedulingEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SCLSchoolModeServer_assertionManager_didUpdateAssertionsStatus___block_invoke;
  v8[3] = &unk_24E29BC38;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "updateParametersWithBlock:", v8);

}

void __66__SCLSchoolModeServer_assertionManager_didUpdateAssertionsStatus___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v5 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvaluationDate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "configureParameters:forSuppressionStatus:", v5, *(_QWORD *)(a1 + 40));
}

- (void)configureParameters:(id)a3 forSuppressionStatus:(unint64_t)a4
{
  objc_msgSend(a3, "setSuppressed:", a4 == 1);
}

- (SCLSuppressSchoolModeAssertionManager)suppressionManager
{
  return self->_suppressionManager;
}

- (SCLSchoolModeWakeScheduler)wakeScheduler
{
  return self->_wakeScheduler;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (int)timeChangeToken
{
  return self->_timeChangeToken;
}

- (void)setTimeChangeToken:(int)a3
{
  self->_timeChangeToken = a3;
}

- (SCLSchedulingEngine)schedulingEngine
{
  return (SCLSchedulingEngine *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSchedulingEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (OS_os_transaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_schedulingEngine, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wakeScheduler, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

@end
