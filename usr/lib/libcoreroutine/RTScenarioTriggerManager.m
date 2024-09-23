@implementation RTScenarioTriggerManager

+ (id)settledStateName:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Settled");
  if (a3 == 1)
    return CFSTR("Unsettled");
  else
    return (id)v3;
}

+ (id)scenarioTriggerTypeToNotificationName:(unint64_t)a3
{
  __objc2_class *v4;
  void *v5;
  NSObject *v6;
  int v8;
  unint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  if (a3 == 2)
  {
    v4 = RTScenarioTriggerManagerNotificationUnsettled;
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 134218498;
      v9 = a3;
      v10 = 2080;
      v11 = "+[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:]";
      v12 = 1024;
      v13 = 91;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unhandled scenario trigger type, %lu (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }

    goto LABEL_10;
  }
  v4 = RTScenarioTriggerManagerNotificationSettled;
LABEL_6:
  -[__objc2_class notificationName](v4, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (RTScenarioTriggerManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationStore_motionActivityManager_settledStateTransitionStore_wifiFootprintMonitor_platform_);
}

- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 platform:(id)a5 settledState:(unint64_t)a6 settledStateTransitionStore:(id)a7 wifiFootprintMonitor:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTScenarioTriggerManager *v19;
  RTScenarioTriggerManager *v20;
  RTScenarioTriggerManager *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v28 = a7;
  v18 = a8;
  if (!v15)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: locationStore";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: platform";
    goto LABEL_17;
  }
  if (!v28)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: settledStateTransitionStore";
      goto LABEL_17;
    }
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  v27 = v18;
  if (v18)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTScenarioTriggerManager;
    v19 = -[RTNotifier init](&v29, sel_init);
    v20 = v19;
    if (v19)
    {
      v19->_monitoredScenarioTriggerTypes = 0;
      objc_storeStrong((id *)&v19->_motionActivityManager, a4);
      v20->_motionSettledState = 0;
      objc_storeStrong((id *)&v20->_platform, a5);
      v20->_settledState = a6;
      objc_storeStrong((id *)&v20->_settledStateTransitionStore, a7);
      objc_storeStrong((id *)&v20->_locationStore, a3);
      objc_storeStrong((id *)&v20->_wifiFootprintMonitor, a8);
    }
    self = v20;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiFootprintMonitor", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_19:

  return v21;
}

- (RTScenarioTriggerManager)initWithLocationStore:(id)a3 motionActivityManager:(id)a4 settledStateTransitionStore:(id)a5 wifiFootprintMonitor:(id)a6 platform:(id)a7
{
  return -[RTScenarioTriggerManager initWithLocationStore:motionActivityManager:platform:settledState:settledStateTransitionStore:wifiFootprintMonitor:](self, "initWithLocationStore:motionActivityManager:platform:settledState:settledStateTransitionStore:wifiFootprintMonitor:", a3, a4, a7, 0, a5, a6);
}

- (void)dealloc
{
  objc_super v3;

  self->_wiFiFootprintState = -1;
  -[RTNotifier removeObserver:](self->_motionActivityManager, "removeObserver:", self);
  -[RTNotifier removeObserver:](self->_wifiFootprintMonitor, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RTScenarioTriggerManager;
  -[RTScenarioTriggerManager dealloc](&v3, sel_dealloc);
}

- (void)setInterestedInSettledState:(unint64_t)a3
{
  unint64_t interestedInSettledState;
  RTMotionActivityManager *v5;
  RTMotionActivityManager *motionActivityManager;
  void *v7;
  id v8;

  interestedInSettledState = self->_interestedInSettledState;
  if (interestedInSettledState != a3)
  {
    self->_interestedInSettledState = a3;
    if (!a3 || interestedInSettledState)
    {
      if (!a3)
      {
        if (interestedInSettledState)
        {
          motionActivityManager = self->_motionActivityManager;
          +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTNotifier removeObserver:fromNotification:](motionActivityManager, "removeObserver:fromNotification:", self, v7);

          -[RTScenarioTriggerManager setSettledStateAndSubmitMetricsForSettledState:](self, "setSettledStateAndSubmitMetricsForSettledState:", 0);
        }
      }
    }
    else
    {
      v5 = self->_motionActivityManager;
      +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](v5, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotification_, v8);

    }
  }
}

- (void)setMotionSettledState:(unint64_t)a3
{
  if (self->_motionSettledState != a3)
  {
    self->_motionSettledState = a3;
    -[RTScenarioTriggerManager _evaluateSettledState](self, "_evaluateSettledState");
  }
}

- (void)_evaluateSettledState
{
  if (self->_motionSettledState - 1 <= 1)
    -[RTScenarioTriggerManager setSettledStateAndSubmitMetricsForSettledState:](self, "setSettledStateAndSubmitMetricsForSettledState:");
}

+ (int64_t)settledStateTypeForScenarioTriggerSettledState:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (void)setSettledStateAndSubmitMetricsForSettledState:(unint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  RTSettledStateTransition *v8;
  void *v9;
  RTSettledStateTransition *v10;
  NSObject *v11;
  RTSettledStateTransition *v12;
  _QWORD block[4];
  RTSettledStateTransition *v14;
  RTScenarioTriggerManager *v15;
  SEL v16;

  if (self->_settledState != a3)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "settledStateTypeForScenarioTriggerSettledState:", self->_settledState);
    v7 = objc_msgSend((id)objc_opt_class(), "settledStateTypeForScenarioTriggerSettledState:", a3);
    -[RTScenarioTriggerManager setSettledState:](self, "setSettledState:", a3);
    v8 = [RTSettledStateTransition alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTSettledStateTransition initWithDate:transitionFromType:transitionToType:](v8, "initWithDate:transitionFromType:transitionToType:", v9, v6, v7);

    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke;
    block[3] = &unk_1E9297BC8;
    v14 = v10;
    v15 = self;
    v16 = a2;
    v12 = v10;
    dispatch_async(v11, block);

  }
}

void __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[RTSettledStateMetrics submitSettledStateMetricsForSettledStateTransition:settledStateTransitionStore:locationStore:](RTSettledStateMetrics, "submitSettledStateMetricsForSettledStateTransition:settledStateTransitionStore:locationStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke_2;
  v4[3] = &unk_1E9297628;
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "storeSettledStateTransitions:handler:", v3, v4);

}

void __75__RTScenarioTriggerManager_setSettledStateAndSubmitMetricsForSettledState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, settledStateTransition, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)setSettledState:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  unint64_t settledState;
  void *v7;
  RTScenarioTriggerManagerNotificationSettled *v8;
  void *v9;
  RTScenarioTriggerManagerNotificationUnsettled *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_settledState != a3)
  {
    self->_settledState = a3;
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", self->_settledState);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "set settled state to %@", (uint8_t *)&v11, 0xCu);

    }
    settledState = self->_settledState;
    if (settledState == 2)
    {
      if ((self->_monitoredScenarioTriggerTypes & 1) == 0)
        return;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18478]), "initWithType:", 1);
      v8 = -[RTScenarioTriggerNotification initWithScenarioTrigger:]([RTScenarioTriggerManagerNotificationSettled alloc], "initWithScenarioTrigger:", v7);
      -[RTNotifier postNotification:](self, "postNotification:", v8);

      settledState = self->_settledState;
    }
    if (settledState == 1 && (self->_monitoredScenarioTriggerTypes & 2) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18480]), "initWithType:", 2);
      v10 = -[RTScenarioTriggerNotification initWithScenarioTrigger:]([RTScenarioTriggerManagerNotificationUnsettled alloc], "initWithScenarioTrigger:", v9);
      -[RTNotifier postNotification:](self, "postNotification:", v10);

    }
  }
}

- (void)setInterestedInConstantFootprint:(unint64_t)a3
{
  unint64_t interestedInConstantFootprint;
  RTWiFiFootprintMonitor *v5;
  RTWiFiFootprintMonitor *wifiFootprintMonitor;
  void *v7;
  id v8;

  interestedInConstantFootprint = self->_interestedInConstantFootprint;
  if (interestedInConstantFootprint != a3)
  {
    self->_interestedInConstantFootprint = a3;
    if (!a3 || interestedInConstantFootprint)
    {
      if (!a3)
      {
        if (interestedInConstantFootprint)
        {
          wifiFootprintMonitor = self->_wifiFootprintMonitor;
          +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTNotifier removeObserver:fromNotification:](wifiFootprintMonitor, "removeObserver:fromNotification:", self, v7);

          -[RTScenarioTriggerManager setWiFiFootprintState:](self, "setWiFiFootprintState:", -1);
        }
      }
    }
    else
    {
      v5 = self->_wifiFootprintMonitor;
      +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](v5, "addObserver:selector:name:", self, sel_onWiFiFootprintStateNotification_, v8);

    }
  }
}

- (void)setWiFiFootprintState:(int64_t)a3
{
  if (self->_wiFiFootprintState != a3)
  {
    self->_wiFiFootprintState = a3;
    if ((self->_monitoredScenarioTriggerTypes & 3) != 0)
      -[RTScenarioTriggerManager _evaluateSettledState](self, "_evaluateSettledState");
  }
}

- (void)_startMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D18470], "scenarioTriggerTypeToString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring scenario trigger, %@", (uint8_t *)&v7, 0xCu);

  }
  if (a3 - 1 <= 1)
    -[RTScenarioTriggerManager setInterestedInSettledState:](self, "setInterestedInSettledState:", -[RTScenarioTriggerManager interestedInSettledState](self, "interestedInSettledState") + 1);
}

- (void)_stopMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D18470], "scenarioTriggerTypeToString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring scenario trigger, %@", (uint8_t *)&v7, 0xCu);

  }
  if (a3 - 1 <= 1)
    -[RTScenarioTriggerManager setInterestedInSettledState:](self, "setInterestedInSettledState:", -[RTScenarioTriggerManager interestedInSettledState](self, "interestedInSettledState") - 1);
}

- (void)setMonitoredScenarioTriggerTypes:(unint64_t)a3
{
  unint64_t monitoredScenarioTriggerTypes;
  unint64_t v5;
  unint64_t v6;

  monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
  if (monitoredScenarioTriggerTypes != a3)
  {
    self->_monitoredScenarioTriggerTypes = a3;
    v5 = monitoredScenarioTriggerTypes ^ a3;
    if (monitoredScenarioTriggerTypes != a3)
    {
      v6 = 1;
      do
      {
        if ((v6 & v5) != 0)
        {
          if ((self->_monitoredScenarioTriggerTypes & v6) != 0)
            -[RTScenarioTriggerManager _startMonitoringScenarioTriggerOfType:](self, "_startMonitoringScenarioTriggerOfType:", v6);
          else
            -[RTScenarioTriggerManager _stopMonitoringScenarioTriggerOfType:](self, "_stopMonitoringScenarioTriggerOfType:", v6);
        }
        v6 *= 2;
      }
      while (v6 <= v5);
    }
  }
}

- (unint64_t)_notificationNameToScenarioTriggerType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "notification, %@, does not map to scenario trigger type", (uint8_t *)&v11, 0xCu);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  unint64_t settledState;
  void *v9;
  int v10;
  void *v11;
  RTScenarioTriggerManagerNotificationSettled *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  RTScenarioTriggerManagerNotificationUnsettled *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[RTPlatform lowEndHardware](self->_platform, "lowEndHardware")
    || !-[RTPlatform supportsScenarioTriggers](self->_platform, "supportsScenarioTriggers"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, not supported on this platform", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) == 1)
      -[RTScenarioTriggerManager setMonitoredScenarioTriggerTypes:](self, "setMonitoredScenarioTriggerTypes:", -[RTScenarioTriggerManager monitoredScenarioTriggerTypes](self, "monitoredScenarioTriggerTypes") | -[RTScenarioTriggerManager _notificationNameToScenarioTriggerType:](self, "_notificationNameToScenarioTriggerType:", v7));
    settledState = self->_settledState;
    if (settledState == 2)
    {
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18478]), "initWithType:", 1);
        v12 = -[RTScenarioTriggerNotification initWithScenarioTrigger:]([RTScenarioTriggerManagerNotificationSettled alloc], "initWithScenarioTrigger:", v11);

      }
      else
      {
        v12 = 0;
      }
      settledState = self->_settledState;
    }
    else
    {
      v12 = 0;
    }
    if (settledState == 1)
    {
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "isEqualToString:", v14);

      if (v15)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18480]), "initWithType:", 2);
        v17 = -[RTScenarioTriggerNotification initWithScenarioTrigger:]([RTScenarioTriggerManagerNotificationUnsettled alloc], "initWithScenarioTrigger:", v16);

        v12 = (RTScenarioTriggerManagerNotificationSettled *)v17;
      }
    }
    if (v12)
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v12, v6);

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[RTPlatform lowEndHardware](self->_platform, "lowEndHardware")
    || !-[RTPlatform supportsScenarioTriggers](self->_platform, "supportsScenarioTriggers"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[RTPlatform productType](self->_platform, "productType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@ is not supported on %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
  {
    -[RTScenarioTriggerManager setMonitoredScenarioTriggerTypes:](self, "setMonitoredScenarioTriggerTypes:", -[RTScenarioTriggerManager monitoredScenarioTriggerTypes](self, "monitoredScenarioTriggerTypes") & ~-[RTScenarioTriggerManager _notificationNameToScenarioTriggerType:](self, "_notificationNameToScenarioTriggerType:", v5));
  }

}

- (void)_onMotionActivityManagerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTScenarioTriggerManager setMotionSettledState:](self, "setMotionSettledState:", objc_msgSend(v4, "settledState"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)onMotionActivityManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__RTScenarioTriggerManager_onMotionActivityManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__RTScenarioTriggerManager_onMotionActivityManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMotionActivityManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWiFiFootprintStateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWiFiFootprintStateNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTScenarioTriggerManager setWiFiFootprintState:](self, "setWiFiFootprintState:", objc_msgSend(v4, "state"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)onWiFiFootprintStateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__RTScenarioTriggerManager_onWiFiFootprintStateNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__RTScenarioTriggerManager_onWiFiFootprintStateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWiFiFootprintStateNotification:", *(_QWORD *)(a1 + 40));
}

- (void)postScenarioTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__RTScenarioTriggerManager_postScenarioTriggerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__RTScenarioTriggerManager_postScenarioTriggerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postScenarioTriggerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_postScenarioTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "post %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    -[RTNotifier postNotification:](self, "postNotification:", v4);

}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v2 - 1) < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "settledStateTransitionStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_38;
    v7[3] = &unk_1E9297568;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "clearWithHandler:", v7);

    v4 = v8;
LABEL_5:

    return;
  }
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "settledStateTransitionStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v9[3] = &unk_1E9299358;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "purgeSettledStateTransitionsPredating:handler:", v10, v9);

    v4 = v10;
    goto LABEL_5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "purge entries from the settled state transition store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__RTScenarioTriggerManager_performPurgeOfType_referenceDate_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityScenarioTrigger);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "cleared the settled state transition store with error, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (unint64_t)interestedInConstantFootprint
{
  return self->_interestedInConstantFootprint;
}

- (unint64_t)interestedInSettledState
{
  return self->_interestedInSettledState;
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (unint64_t)motionSettledState
{
  return self->_motionSettledState;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (RTSettledStateTransitionStore)settledStateTransitionStore
{
  return self->_settledStateTransitionStore;
}

- (RTWiFiFootprintMonitor)wifiFootprintMonitor
{
  return self->_wifiFootprintMonitor;
}

- (int64_t)wiFiFootprintState
{
  return self->_wiFiFootprintState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFootprintMonitor, 0);
  objc_storeStrong((id *)&self->_settledStateTransitionStore, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
}

- (void)simulateScenarioTrigger:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  RTScenarioTriggerManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTScenarioTriggerManager_Internal__simulateScenarioTrigger_handler___block_invoke;
  block[3] = &unk_1E9298DC0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __70__RTScenarioTriggerManager_Internal__simulateScenarioTrigger_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      +[RTScenarioTriggerManager scenarioTriggerTypeToNotificationName:](RTScenarioTriggerManager, "scenarioTriggerTypeToNotificationName:", objc_msgSend(v2, "type"));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      v4 = NSClassFromString(v3);
      if (v4)
      {
        v5 = (void *)objc_msgSend([v4 alloc], "initWithScenarioTrigger:", *(_QWORD *)(a1 + 32));
        if (v5)
          objc_msgSend(*(id *)(a1 + 40), "_postScenarioTriggerNotification:", v5);

        v6 = 0;
      }
      else
      {
        v9 = *MEMORY[0x1E0CB2D50];
        v10[0] = CFSTR("Unknown scenario trigger type.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
}

@end
