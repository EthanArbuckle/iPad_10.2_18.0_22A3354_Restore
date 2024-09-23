@implementation ATXMicrolocationRecordingTrigger

- (ATXMicrolocationRecordingTrigger)initWithInferredModeStream:(id)a3
{
  id v5;
  ATXMicrolocationRecordingTrigger *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  id v10;
  OS_dispatch_queue *v11;
  uint64_t v12;
  uint64_t v13;
  _PASSimpleCoalescingTimer *coalescingTimerForRecordingScans;
  id v15;
  OS_dispatch_queue *v16;
  uint64_t v17;
  _PASSimpleCoalescingTimer *coalescingTimerForHistoricalLabelDonations;
  void *v19;
  double v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXMicrolocationRecordingTrigger;
  v6 = -[ATXMicrolocationRecordingTrigger init](&v27, sel_init);
  if (v6)
  {
    objc_initWeak(&location, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.proactive.ProactiveContextClient.ATXMicrolocationRecordingTrigger.queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D81618]);
    v11 = v6->_queue;
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke;
    v24[3] = &unk_1E942DA58;
    objc_copyWeak(&v25, &location);
    v13 = objc_msgSend(v10, "initWithQueue:operation:", v11, v24);
    coalescingTimerForRecordingScans = v6->_coalescingTimerForRecordingScans;
    v6->_coalescingTimerForRecordingScans = (_PASSimpleCoalescingTimer *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D81618]);
    v16 = v6->_queue;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke_2;
    v22[3] = &unk_1E942DA58;
    objc_copyWeak(&v23, &location);
    v17 = objc_msgSend(v15, "initWithQueue:operation:", v16, v22);
    coalescingTimerForHistoricalLabelDonations = v6->_coalescingTimerForHistoricalLabelDonations;
    v6->_coalescingTimerForHistoricalLabelDonations = (_PASSimpleCoalescingTimer *)v17;

    objc_storeStrong((id *)&v6->_inferredModeStream, a3);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
    objc_msgSend(v19, "doubleForKey:", CFSTR("ATXMicrolocationRecordingTriggerTimeBufferKey"));
    if (v20 <= 0.0)
      v20 = 300.0;
    v6->_timeBuffer = v20;
    -[ATXMicrolocationRecordingTrigger _subscribeToModeChanges](v6, "_subscribeToModeChanges");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_userDidEnterModeOrModeWasPredicted");

}

void __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_userDidExitModeOrModeWasNoLongerPredicted");

}

- (void)_subscribeToModeChanges
{
  void *v4;
  void *v5;
  BMStream *v6;
  BMStream *userFocusComputedModeStream;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMBiomeScheduler *v15;
  BMBiomeScheduler *inferredModeScheduler;
  void *v17;
  BMBiomeScheduler *v18;
  BMBiomeScheduler *userComputedModeScheduler;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UserFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ComputedMode");
  v6 = (BMStream *)objc_claimAutoreleasedReturnValue();
  userFocusComputedModeStream = self->_userFocusComputedModeStream;
  self->_userFocusComputedModeStream = v6;

  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStream identifier](self->_inferredModeStream, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStream identifier](self->_userFocusComputedModeStream, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413058;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@] subscribing to %@ and %@ streams", (uint8_t *)&v22, 0x2Au);

  }
  -[BMStream identifier](self->_inferredModeStream, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMicrolocationRecordingTrigger _schedulerForStreamName:](self, "_schedulerForStreamName:", v14);
  v15 = (BMBiomeScheduler *)objc_claimAutoreleasedReturnValue();
  inferredModeScheduler = self->_inferredModeScheduler;
  self->_inferredModeScheduler = v15;

  -[BMStream identifier](self->_userFocusComputedModeStream, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMicrolocationRecordingTrigger _schedulerForStreamName:](self, "_schedulerForStreamName:", v17);
  v18 = (BMBiomeScheduler *)objc_claimAutoreleasedReturnValue();
  userComputedModeScheduler = self->_userComputedModeScheduler;
  self->_userComputedModeScheduler = v18;

  -[BMStream DSLPublisher](self->_inferredModeStream, "DSLPublisher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:](self, "_subscribeToStreamWithPublisher:scheduler:sink:", v20, self->_inferredModeScheduler, self->_inferredModeStreamSink);

  -[BMStream DSLPublisher](self->_userFocusComputedModeStream, "DSLPublisher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:](self, "_subscribeToStreamWithPublisher:scheduler:sink:", v21, self->_userComputedModeScheduler, self->_userComputedModeStreamSink);

}

- (void)dealloc
{
  objc_super v3;

  -[BPSSink cancel](self->_inferredModeStreamSink, "cancel");
  -[BPSSink cancel](self->_userComputedModeStreamSink, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)ATXMicrolocationRecordingTrigger;
  -[ATXMicrolocationRecordingTrigger dealloc](&v3, sel_dealloc);
}

- (void)_subscribeToStreamWithPublisher:(id)a3 scheduler:(id)a4 sink:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23[2];
  _QWORD v24[4];
  id v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rootStreamIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v14;
        v28 = 2112;
        v29 = v16;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1D2C00000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@] listening to stream %@ for mode start events", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      objc_msgSend(v9, "subscribeOn:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke;
      v24[3] = &unk_1E942DB10;
      objc_copyWeak(v25, (id *)buf);
      v25[1] = (id)a2;
      v21[0] = v19;
      v21[1] = 3221225472;
      v21[2] = __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_13;
      v21[3] = &unk_1E942DE18;
      objc_copyWeak(v23, (id *)buf);
      v23[1] = (id)a2;
      v22 = v9;
      objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v24, v21);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        __atxlog_handle_modes();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:].cold.2(v20);

      }
      objc_destroyWeak(v23);
      objc_destroyWeak(v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:].cold.1((uint64_t)self, a2, v13);

      v11 = 0;
    }
  }

}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = (void *)objc_opt_class();
    v8 = *(const char **)(a1 + 40);
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] successfully completed listening to mode events", (uint8_t *)&v11, 0x16u);

  }
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(const char **)(a1 + 48);
      v9 = v7;
      NSStringFromSelector(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rootStreamIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] mode event received from %@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(WeakRetained, "_triggerMicrolocationRecordingAtModeStartWithStoreEvent:", v3);
    objc_msgSend(WeakRetained, "_triggerHistoricalLabelDonationAtModeEndWithStoreEvent:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_13_cold_1(a1);

  }
}

- (void)_triggerMicrolocationRecordingAtModeStartWithStoreEvent:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  _BOOL4 v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v11, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[ATXMicrolocationRecordingTrigger _isUserFocusComputedModeEventEligibleForMicrolocationRecording:](self, "_isUserFocusComputedModeEventEligibleForMicrolocationRecording:", v6);

    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0
    || (objc_msgSend(v11, "eventBody"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[ATXMicrolocationRecordingTrigger _isInferredModeEventEligibleForMicrolocationRecording:](self, "_isInferredModeEventEligibleForMicrolocationRecording:", v9), v9, v10))
  {
LABEL_6:
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescingTimerForRecordingScans, "runAfterDelaySeconds:coalescingBehavior:", 1, self->_timeBuffer);
  }
LABEL_7:

}

- (void)_triggerHistoricalLabelDonationAtModeEndWithStoreEvent:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  _BOOL4 v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v11, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[ATXMicrolocationRecordingTrigger _isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:](self, "_isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:", v6);

    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0
    || (objc_msgSend(v11, "eventBody"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[ATXMicrolocationRecordingTrigger _isInferredModeEventEligibleForHistoricalLabelDonations:](self, "_isInferredModeEventEligibleForHistoricalLabelDonations:", v9), v9, v10))
  {
LABEL_6:
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescingTimerForHistoricalLabelDonations, "runAfterDelaySeconds:coalescingBehavior:", 1, 5.0);
  }
LABEL_7:

}

- (BOOL)_isUserFocusComputedModeEventEligibleForMicrolocationRecording:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "starting"))
    v4 = objc_msgSend(v3, "semanticType") == 6;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "starting") & 1) == 0 && objc_msgSend(v3, "semanticType") == 6;

  return v4;
}

- (BOOL)_isInferredModeEventEligibleForMicrolocationRecording:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isStart"))
    v4 = objc_msgSend(v3, "modeType") == 4;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isInferredModeEventEligibleForHistoricalLabelDonations:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isStart") & 1) == 0 && objc_msgSend(v3, "modeType") == 4;

  return v4;
}

- (id)_schedulerForStreamName:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB3898];
  v7 = a3;
  objc_msgSend(v6, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ATXMicrolocationRecordingTrigger.Modes.%@.%@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_modes();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v12;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1D2C00000, v11, OS_LOG_TYPE_INFO, "[%@][%@] scheduler identifier: %@", buf, 0x20u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", v10, self->_queue);
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    __atxlog_handle_modes();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v20;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1D2C00000, v18, OS_LOG_TYPE_ERROR, "[%@][%@] unable to initialize Biome Scheduler: %@", buf, 0x20u);

    }
  }

  return v16;
}

- (void)_userDidEnterModeOrModeWasPredicted
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  ATXUserFocusComputedMode *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ATXUserFocusInferredMode *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138412546;
    v39 = v5;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_INFO, "[%@][%@] Starting Microlocation recording scan", (uint8_t *)&v38, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = self->_timeBuffer + 1.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXUserFocusComputedMode initWithStream:]([ATXUserFocusComputedMode alloc], "initWithStream:", self->_userFocusComputedModeStream);
  -[ATXUserFocusComputedMode currentModeEvent](v10, "currentModeEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "eventBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXMicrolocationRecordingTrigger _isUserFocusComputedModeEventEligibleForMicrolocationRecording:](self, "_isUserFocusComputedModeEventEligibleForMicrolocationRecording:", v12))
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v11, "timestamp");
    v16 = v14 - v15;

    if (v16 < v8)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "eventBody");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType(objc_msgSend(v18, "semanticType"));
LABEL_10:
      objc_msgSend(v17, "numberWithInt:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {

  }
  v20 = -[ATXUserFocusInferredMode initWithStream:]([ATXUserFocusInferredMode alloc], "initWithStream:", self->_inferredModeStream);
  -[ATXUserFocusInferredMode currentMode](v20, "currentMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ATXMicrolocationRecordingTrigger _isInferredModeEventEligibleForMicrolocationRecording:](self, "_isInferredModeEventEligibleForMicrolocationRecording:", v18))
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v22 = v21;
    objc_msgSend(v18, "absoluteTimestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v25 = v22 - v24;

    if (v25 < v8)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v19 = objc_msgSend(v18, "modeType");
      goto LABEL_10;
    }
  }
  v26 = 0;
LABEL_12:

  if (v26)
  {
    v27 = objc_msgSend(v26, "integerValue");
    __atxlog_handle_modes();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_opt_class();
      v30 = v29;
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      BMUserFocusInferredModeTypeAsString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412802;
      v39 = v29;
      v40 = 2112;
      v41 = v31;
      v42 = 2114;
      v43 = *(double *)&v32;
      _os_log_impl(&dword_1D2C00000, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@] user entered mode: %{public}@", (uint8_t *)&v38, 0x20u);

    }
    -[ATXMicrolocationRecordingTrigger _triggerMicroLocationRecordingScan](self, "_triggerMicroLocationRecordingScan");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[ATXMicrolocationRecordingTrigger _truthLabelForMode:](self, "_truthLabelForMode:", v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXMicrolocationRecordingTrigger _donateTruthLabelForTriggerUUID:truthLabel:](self, "_donateTruthLabelForTriggerUUID:truthLabel:", v33, v34);

    }
  }
  else
  {
    __atxlog_handle_modes();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)objc_opt_class();
      v36 = v35;
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412802;
      v39 = v35;
      v40 = 2112;
      v41 = v37;
      v42 = 2048;
      v43 = v8;
      _os_log_error_impl(&dword_1D2C00000, v33, OS_LOG_TYPE_ERROR, "[%@][%@] Unable to find an inferred mode event or user focus computed mode event in the past %f seconds", (uint8_t *)&v38, 0x20u);

    }
  }

}

- (void)_userDidExitModeOrModeWasNoLongerPredicted
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (id)OUTLINED_FUNCTION_8();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D2C00000, v5, v6, "[%@][%@] Error: Expected to see at least two events in either the inferred mode stream or the user computed stream", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)_triggerMicroLocationHistoricalLabelDonationWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_modes();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Labeling scans between startDate: %@ and endDate: %@ with work label", buf, 0x2Au);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C9FC4298-DE04-494A-9791-71AB71B52E27"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke;
  v14[3] = &unk_1E942DE40;
  v14[4] = self;
  v14[5] = a2;
  objc_msgSend(MEMORY[0x1E0D4DE98], "donateMicroLocationTruthTagWithTagUUID:forRecordingEventsBetweenDate:andDate:handler:", v13, v7, v8, v14);

}

void __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully donated historical labels", (uint8_t *)&v10, 0x16u);

  }
}

- (id)_triggerMicroLocationRecordingScan
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke;
  v12[3] = &unk_1E942DE68;
  v12[4] = self;
  v12[5] = a2;
  objc_msgSend(MEMORY[0x1E0D4DE98], "getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:shouldForceRecording:handler:", 0, 0, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Generated triggerId: %@", buf, 0x20u);

    }
    v10 = v4;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXMicrolocationRecordingTrigger _triggerMicroLocationRecordingScan].cold.1((uint64_t)self, a2);

  }
  return v4;
}

void __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(const char **)(a1 + 40);
      v10 = v8;
      NSStringFromSelector(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]  Successfully requested MiLo recording scan", (uint8_t *)&v12, 0x16u);

    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke_cold_1();
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_donateTruthLabelForTriggerUUID:(id)a3 truthLabel:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_modes();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Donating truth label: %@ for triggerId: %@", buf, 0x2Au);

  }
  v13 = (void *)MEMORY[0x1E0D4DE98];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke;
  v16[3] = &unk_1E942DE90;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v19 = a2;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v13, "donateMicroLocationTruthTagWithTagUUID:correspondingToTriggerUUID:handler:", v15, v14, v16);

}

void __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (const char *)a1[7];
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v11 = a1[6];
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully donated MiLo label %@ for triggerId: %@", (uint8_t *)&v12, 0x2Au);

  }
}

- (id)_truthLabelForMode:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C9FC4298-DE04-494A-9791-71AB71B52E27"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("75BF0CD2-AB18-4E42-AD01-3D5CAADFDFF1"));
  v6 = v5;
  if (a3 == 4)
    v5 = v4;
  v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userComputedModeStreamSink, 0);
  objc_storeStrong((id *)&self->_userComputedModeScheduler, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModeStream, 0);
  objc_storeStrong((id *)&self->_inferredModeStreamSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_coalescingTimerForHistoricalLabelDonations, 0);
  objc_storeStrong((id *)&self->_coalescingTimerForRecordingScans, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_subscribeToStreamWithPublisher:(uint64_t)a1 scheduler:(const char *)a2 sink:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v5 = (void *)OUTLINED_FUNCTION_8();
  v6 = v5;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D2C00000, a3, OS_LOG_TYPE_ERROR, "[%@][%@] Publisher was unexpectedly nil", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_2_1();
}

- (void)_subscribeToStreamWithPublisher:(os_log_t)log scheduler:sink:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "ATXMicrolocationRecordingTrigger: sink is nil", v1, 2u);
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_opt_class();
  v4 = *(const char **)(a1 + 40);
  v5 = v3;
  NSStringFromSelector(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D2C00000, v7, v8, "[%@][%@] Error encountered while listening to mode events", v9, v10, v11, v12, 2u);

}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_13_cold_1(uint64_t a1)
{
  void *v2;
  const char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)objc_opt_class();
  v3 = *(const char **)(a1 + 48);
  v4 = v2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D2C00000, v6, v7, "[%@][%@] self is nil", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke_cold_1()
{
  void *v0;
  const char *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_7();
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = OUTLINED_FUNCTION_10(v2);
  NSStringFromSelector(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedDescription");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_9(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1D2C00000, v7, v8, "[%@][%@] Error encountered while donating historical labels: %{public}s", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

- (void)_triggerMicroLocationRecordingScan
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (id)OUTLINED_FUNCTION_8();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D2C00000, v5, v6, "[%@][%@] TriggerId was unexpectedly nil", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke_cold_1()
{
  void *v0;
  const char *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_7();
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = OUTLINED_FUNCTION_10(v2);
  NSStringFromSelector(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedDescription");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_9(v5, v6);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1D2C00000, v7, v8, "[%@][%@]  Error encountered while requesting MiLo recording scan: %{public}s", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

void __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const char *v3;
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_7();
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = *(const char **)(v0 + 56);
  v4 = v2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_9(v6, v7);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1D2C00000, v8, v9, "[%@][%@] Error encountered while requesting MiLo recording scan: %{public}s", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_0();
}

@end
