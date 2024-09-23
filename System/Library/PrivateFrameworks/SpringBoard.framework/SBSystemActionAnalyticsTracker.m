@implementation SBSystemActionAnalyticsTracker

+ (id)sharedTracker
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBSystemActionAnalyticsTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedTracker_onceToken != -1)
    dispatch_once(&sharedTracker_onceToken, block);
  return (id)sharedTracker_tracker;
}

void __47__SBSystemActionAnalyticsTracker_sharedTracker__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTracker_tracker;
  sharedTracker_tracker = (uint64_t)v1;

}

- (SBSystemActionAnalyticsTracker)init
{
  SBSystemActionAnalyticsTracker *v2;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *powerLogSendQueue;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSystemActionAnalyticsTracker;
  v2 = -[SBSystemActionAnalyticsTracker init](&v9, sel_init);
  if (v2)
  {
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    powerLogSendQueue = v2->_powerLogSendQueue;
    v2->_powerLogSendQueue = (OS_dispatch_queue *)SerialWithQoS;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("SBSignificantTimeChangedNotification"), 0, v6, &__block_literal_global_284);

  }
  return v2;
}

void __38__SBSystemActionAnalyticsTracker_init__block_invoke()
{
  id v0;

  +[SBSystemActionAnalyticsTracker sharedTracker]();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_logSignificantTimeChanged");

}

- (void)trackInteractionWithType:(void *)a3 forAction:(void *)a4 suppressionStatus:
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (!a1)
  {
LABEL_10:

    return;
  }
  if (v22)
  {
    v7 = objc_msgSend(v22, "analyticsData");
    v8 = (void *)v7;
    v10 = v9;
    if (v7)
      v11 = (__CFString *)v7;
    else
      v11 = CFSTR("null");
    objc_storeStrong((id *)(a1 + 16), v11);
    if (v10)
      v12 = v10;
    else
      v12 = CFSTR("null");
    objc_storeStrong((id *)(a1 + 24), v12);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBSAnalyticsActionButtonInteractionType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("type"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 16), CFSTR("action"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 24), CFSTR("param_value"));
    v17 = (void *)objc_msgSend(v15, "copy");
    NSStringFromAnalyticsEventType();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_sendEventToPowerLog:payload:", v18, v17);

    -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SBAddSuppressionMetricsIntoEventPayload(v15, v19, 0);

    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emitEvent:withPayload:", 63, v15);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("action != ((void *)0)"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:].cold.1(sel_trackInteractionWithType_forAction_suppressionStatus_);
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)trackPerformedAction:(double)a3 executionTime:
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = (__CFString *)objc_msgSend(v5, "analyticsData");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("null");
    v15[0] = CFSTR("action");
    v15[1] = CFSTR("param_value");
    if (v7)
      v12 = v7;
    else
      v12 = CFSTR("null");
    if (v9)
      v11 = v9;
    v16[0] = v12;
    v16[1] = v11;
    v15[2] = CFSTR("execution_time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emitEvent:withPayload:", 67, v14);

  }
}

- (void)trackSuppressionStatusUpdate:(uint64_t)a1
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a2;
  if (!a1)
  {
LABEL_10:

    return;
  }
  if (v4)
  {
    v20 = v4;
    v5 = *(id *)(a1 + 8);
    objc_storeStrong((id *)(a1 + 8), a2);
    if (v5)
    {
      if (*(_QWORD *)(a1 + 16))
      {
        if (*(_QWORD *)(a1 + 32))
        {
          v6 = -[SBCameraActivationManager workspace]((uint64_t)v20) != 1;
          if (((v6 ^ (-[SBCameraActivationManager workspace]((uint64_t)v5) == 1)) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
            v9 = v8;

            if (v9 <= 0.5)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 16), CFSTR("action"));
              objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 24), CFSTR("param_value"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("time_delta"));

              v12 = -[SBCameraActivationManager workspace]((uint64_t)v20);
              NSStringFromSBSystemActionSuppressionState(v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("state"));

              -[SBHomeScreenConfigurationServer listener]((uint64_t)v20);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              SBAddSuppressionMetricsIntoEventPayload(v10, v14, 0);

              v15 = -[SBCameraActivationManager workspace]((uint64_t)v5);
              NSStringFromSBSystemActionSuppressionState(v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("prev_state"));

              -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              SBAddSuppressionMetricsIntoEventPayload(v10, v17, CFSTR("prev_"));

              objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "emitEvent:withPayload:", 66, v10);

            }
          }
        }
      }
    }

    v4 = v20;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("status != ((void *)0)"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionAnalyticsTracker trackSuppressionStatusUpdate:].cold.1(sel_trackSuppressionStatusUpdate_);
  objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)trackSelectedActionChanged:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "analyticsData");
    v7 = (void *)v5;
    v8 = (__CFString *)v6;
    v9 = CFSTR("null");
    v14[0] = CFSTR("action");
    v14[1] = CFSTR("param_value");
    if (v5)
      v10 = (const __CFString *)v5;
    else
      v10 = CFSTR("null");
    if (v6)
      v9 = v6;
    v15[0] = v10;
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emitEvent:withPayload:", 65, v11);

    NSStringFromAnalyticsEventType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sendEventToPowerLog:payload:", v13, v11);

  }
}

- (void)trackPocketStateQueryWithExecutionTime:(double)a3 error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("execution_time"));

    if (v12)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("error"));

    }
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emitEvent:withPayload:", 68, v5);

  }
}

- (uint64_t)trackPressDownForLatencyMeasurement:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    *(double *)(result + 40) = a2;
    result = BSAbsoluteMachTimeNow();
    *(_QWORD *)(v2 + 48) = v3;
  }
  return result;
}

- (void)trackPressUpForLatencyMeasurement:(int)a3 cancelled:(int)a4 longPressTriggered:(void *)a5 selectedActionIdentifier:
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
  double v19;
  NSObject *v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (a1 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BSAbsoluteMachTimeNow();
    v12 = v11;
    v13 = a1[6];
    v14 = a1 + 5;
    v15 = v13 - a1[5];
    v16 = -[SBCameraActivationManager workspace]((uint64_t)v9);
    objc_msgSend(a1, "_openCameraActionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "containsString:", v17);

    if (v15 > 0.0)
    {
      v19 = v12 - v13;
      AnalyticsSendEventLazy();
      SBLogButtonsRinger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219264;
        v22 = v15;
        v23 = 2048;
        v24 = v19;
        v25 = 1024;
        v26 = a3;
        v27 = 2048;
        v28 = v16;
        v29 = 1024;
        v30 = a4;
        v31 = 1024;
        v32 = v18;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Action Button press event delivery latency analytics: %f, duration: %f, cancelled: %{BOOL}d, suppression state: %lu, longPressTriggered: %{BOOL}d, cameraActionSelected: %{BOOL}d", buf, 0x32u);
      }

    }
    *v14 = 0;
    v14[1] = 0;
  }

}

id __122__SBSystemActionAnalyticsTracker_trackPressUpForLatencyMeasurement_cancelled_longPressTriggered_selectedActionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("deliveryLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("pressDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("canceled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("suppressionState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("longPressTriggered");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  v10[5] = CFSTR("cameraActionSelected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 58));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_logSignificantTimeChanged
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "systemActionControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFString *)-[SBSystemActionControl selectedActionAnalyticsData]((uint64_t)v3);
  v6 = v5;

  if (v4)
    v7 = v4;
  else
    v7 = CFSTR("null");
  v12[0] = CFSTR("action");
  v12[1] = CFSTR("param_value");
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR("null");
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEvent:withPayload:", 64, v9);

  NSStringFromAnalyticsEventType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionAnalyticsTracker _sendEventToPowerLog:payload:](self, "_sendEventToPowerLog:payload:", v11, v9);

}

- (void)_sendEventToPowerLog:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  NSObject *powerLogSendQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  powerLogSendQueue = self->_powerLogSendQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SBSystemActionAnalyticsTracker__sendEventToPowerLog_payload___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(powerLogSendQueue, v11);

}

uint64_t __63__SBSystemActionAnalyticsTracker__sendEventToPowerLog_payload___block_invoke()
{
  uint64_t result;

  result = PLShouldLogRegisteredEvent();
  if ((_DWORD)result)
    return PLLogRegisteredEvent();
  return result;
}

- (id)_openCameraActionIdentifier
{
  if (_openCameraActionIdentifier___onceToken != -1)
    dispatch_once(&_openCameraActionIdentifier___onceToken, &__block_literal_global_87);
  return (id)_openCameraActionIdentifier___openCameraActionIdentifier;
}

void __61__SBSystemActionAnalyticsTracker__openCameraActionIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("com.apple.springboard"), "stringByAppendingFormat:", CFSTR(".%@"), *MEMORY[0x1E0DAACC0]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_openCameraActionIdentifier___openCameraActionIdentifier;
  _openCameraActionIdentifier___openCameraActionIdentifier = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogSendQueue, 0);
  objc_storeStrong((id *)&self->_lastQueryTimestamp, 0);
  objc_storeStrong((id *)&self->_lastQueriedParameterValueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastQueriedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_suppressionStatus, 0);
}

- (void)trackInteractionWithType:(const char *)a1 forAction:suppressionStatus:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)trackSuppressionStatusUpdate:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
