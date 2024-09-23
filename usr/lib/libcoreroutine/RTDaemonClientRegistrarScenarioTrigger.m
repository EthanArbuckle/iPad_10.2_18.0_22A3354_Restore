@implementation RTDaemonClientRegistrarScenarioTrigger

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTDaemonClientRegistrarScenarioTrigger)initWithScenarioTriggerManager:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  RTDaemonClientRegistrarScenarioTrigger *v9;
  RTDaemonClientRegistrarScenarioTrigger *v10;
  uint64_t v11;
  NSMutableDictionary *pendingScenarioInvocations;
  RTInvocationDispatcher *v13;
  RTInvocationDispatcher *dispatcher;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  v9 = -[RTDaemonClientRegistrarScenarioTrigger init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_scenarioTriggerManager, a3);
    v11 = objc_opt_new();
    pendingScenarioInvocations = v10->_pendingScenarioInvocations;
    v10->_pendingScenarioInvocations = (NSMutableDictionary *)v11;

    v10->_monitoredScenarioTriggerTypes = 0;
    v13 = -[RTInvocationDispatcher initWithQueue:]([RTInvocationDispatcher alloc], "initWithQueue:", v10->_queue);
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v13;

  }
  return v10;
}

- (RTDaemonClientRegistrarScenarioTrigger)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithScenarioTriggerManager_queue_);
}

- (RTDaemonClientRegistrarScenarioTrigger)initWithCoder:(id)a3
{
  id v4;
  RTDaemonClientRegistrarScenarioTrigger *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  v5 = -[RTDaemonClientRegistrar initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_monitoredScenarioTriggerTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("monitoredScenarioTriggerTypes"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTDaemonClientRegistrarScenarioTrigger;
  v4 = a3;
  -[RTDaemonClientRegistrar encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_monitoredScenarioTriggerTypes, CFSTR("monitoredScenarioTriggerTypes"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMonitoringForScenarioTriggerType:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[RTDaemonClientRegistrarScenarioTrigger invocationsPending](self, "invocationsPending"))
    -[RTInvocationDispatcher dispatchPendingInvocations](self->_dispatcher, "dispatchPendingInvocations");
  for (; a3; a3 &= a3 - 1)
  {
    v5 = a3 & -(uint64_t)a3;
    if ((self->_monitoredScenarioTriggerTypes & v5) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 & -(uint64_t)a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_pendingScenarioInvocations, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[NSMutableDictionary objectForKey:](self->_pendingScenarioInvocations, "objectForKey:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        -[NSMutableDictionary objectForKey:](self->_pendingScenarioInvocations, "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllObjects");

        objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_96);
      }
    }
    else
    {
      +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:](RTScenarioTriggerManager, "scenarioTriggerTypeToNotificationName:", a3 & -(uint64_t)a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        self->_monitoredScenarioTriggerTypes |= v5;
        -[RTNotifier addObserver:selector:name:](self->_scenarioTriggerManager, "addObserver:selector:name:", self, sel_onScenarioTriggerManagerNotification_, v6);
      }
    }

  }
  -[RTDaemonClientRegistrarScenarioTrigger _logMonitoredScenarioTriggers:](self, "_logMonitoredScenarioTriggers:", self->_monitoredScenarioTriggerTypes);
}

uint64_t __80__RTDaemonClientRegistrarScenarioTrigger_startMonitoringForScenarioTriggerType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invoke");
}

- (void)onScenarioTriggerManagerNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RTDaemonClientRegistrarScenarioTrigger *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__RTDaemonClientRegistrarScenarioTrigger_onScenarioTriggerManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __79__RTDaemonClientRegistrarScenarioTrigger_onScenarioTriggerManagerNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onScenarioTriggerManagerNotification:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412802;
      v5 = v3;
      v6 = 2080;
      v7 = "-[RTDaemonClientRegistrarScenarioTrigger onScenarioTriggerManagerNotification:]_block_invoke";
      v8 = 1024;
      v9 = 113;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "unknown notification with name received, %@ (in %s:%d)", (uint8_t *)&v4, 0x1Cu);

    }
  }
}

- (void)_onScenarioTriggerManagerNotification:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  unint64_t monitoredScenarioTriggerTypes;
  NSObject *v9;
  const char *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "scenarioTrigger");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
      if ((-[NSObject type](v6, "type") & monitoredScenarioTriggerTypes) != 0)
      {
        v12[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "scenarioTriggerRegistrar:didReceiveScenarioTriggers:error:", self, v9, 0);
LABEL_12:

        goto LABEL_13;
      }
      _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)v11 = 0;
      v10 = "trigger type is not monitored for, returning.";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)v11 = 0;
      v10 = "received nil scenario trigger in notification, returning.";
    }
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "no delegate or does not respond to selector, returning", v11, 2u);
  }
LABEL_13:

}

- (void)stopMonitoringForScenarioTriggerType:(unint64_t)a3
{
  unint64_t v5;
  unint64_t monitoredScenarioTriggerTypes;
  void *v7;

  -[RTInvocationDispatcher removeAllPendingInvocations](self->_dispatcher, "removeAllPendingInvocations");
  if (a3)
  {
    v5 = ~a3;
    do
    {
      monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
      if ((monitoredScenarioTriggerTypes & a3 & -(uint64_t)a3) != 0)
      {
        self->_monitoredScenarioTriggerTypes = monitoredScenarioTriggerTypes & v5;
        +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:](RTScenarioTriggerManager, "scenarioTriggerTypeToNotificationName:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          -[RTNotifier removeObserver:fromNotification:](self->_scenarioTriggerManager, "removeObserver:fromNotification:", self, v7);

      }
      a3 &= a3 - 1;
    }
    while (a3);
  }
  -[RTDaemonClientRegistrarScenarioTrigger _logMonitoredScenarioTriggers:](self, "_logMonitoredScenarioTriggers:", self->_monitoredScenarioTriggerTypes);
}

- (void)_logMonitoredScenarioTriggers:(unint64_t)a3
{
  unint64_t monitoredScenarioTriggerTypes;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
    v5 = (void *)objc_opt_new();
    while (monitoredScenarioTriggerTypes)
    {
      objc_msgSend(MEMORY[0x1E0D18470], "scenarioTriggerTypeToString:", monitoredScenarioTriggerTypes & -(uint64_t)monitoredScenarioTriggerTypes);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v5, "addObject:", v6);
      monitoredScenarioTriggerTypes &= monitoredScenarioTriggerTypes - 1;

    }
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend(v5, "count"))
        objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      else
        objc_msgSend(MEMORY[0x1E0D18470], "scenarioTriggerTypeToString:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_monitoredScenarioTriggerTypes;
      v10 = 138412802;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      v14 = 2048;
      v15 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "monitored scenario triggers, %@, bitmask, %lu, count, %lu", (uint8_t *)&v10, 0x20u);

    }
  }
}

- (void)addPendingScenarioTriggerBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
  -[RTInvocationDispatcher enqueueBlock:failureBlock:description:](self->_dispatcher, "enqueueBlock:failureBlock:description:", a3, a4, CFSTR("%@"), a5);
}

- (int64_t)countOfPendingInvocations
{
  return -[RTInvocationDispatcher countOfPendingInvocations](self->_dispatcher, "countOfPendingInvocations");
}

- (BOOL)invocationsPending
{
  return -[RTInvocationDispatcher countOfPendingInvocations](self->_dispatcher, "countOfPendingInvocations") != 0;
}

- (BOOL)registered
{
  return self->_monitoredScenarioTriggerTypes != 0;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (RTDaemonClientRegistrarScenarioTriggerProtocol)delegate
{
  return (RTDaemonClientRegistrarScenarioTriggerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)pendingScenarioInvocations
{
  return self->_pendingScenarioInvocations;
}

- (void)setPendingScenarioInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingScenarioInvocations, a3);
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (void)setScenarioTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggerManager, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_pendingScenarioInvocations, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
