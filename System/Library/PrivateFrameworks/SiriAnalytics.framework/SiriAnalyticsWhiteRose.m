@implementation SiriAnalyticsWhiteRose

- (SiriAnalyticsWhiteRose)initWithQueue:(id)a3 delegate:(id)a4 metastore:(id)a5
{
  id v9;
  id v10;
  id v11;
  SiriAnalyticsWhiteRose *v12;
  SiriAnalyticsWhiteRose *v13;
  SiriAnalyticsDebounce *v14;
  SiriAnalyticsDebounce *clockPulse;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SiriAnalyticsWhiteRose;
  v12 = -[SiriAnalyticsWhiteRose init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_metastore, a5);
    v13->_maximumInactivityInterval = 300.0;
    v13->_maximumClockLifeInterval = 900.0;
    v14 = -[SiriAnalyticsDebounce initWithDebounceInterval:maximumInterval:queue:delegate:]([SiriAnalyticsDebounce alloc], "initWithDebounceInterval:maximumInterval:queue:delegate:", v13->_queue, v13, 2.0, 5.0);
    clockPulse = v13->_clockPulse;
    v13->_clockPulse = v14;

  }
  return v13;
}

- (void)bootstrapWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SiriAnalyticsWhiteRose_bootstrapWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)markTimeForAnnotatedMessage:(id)a3 withRootClock:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id WeakRetained;
  void *v19;
  SiriAnalyticsMessage *v20;
  void *v21;
  void *v22;
  SiriAnalyticsMessage *v23;
  void *v24;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "timestamp");
  objc_msgSend(v7, "clockStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "startedOn");

  if (v8 < v10)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v11 = (void *)SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
    {
      v26 = v11;
      objc_msgSend(v7, "clockIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clockStatistics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315906;
      v30 = "-[SiriAnalyticsWhiteRose markTimeForAnnotatedMessage:withRootClock:]";
      v31 = 2112;
      v32 = v27;
      v33 = 2048;
      v34 = objc_msgSend(v28, "startedOn");
      v35 = 2048;
      v36 = objc_msgSend(v6, "timestamp");
      _os_log_debug_impl(&dword_1A025F000, v26, OS_LOG_TYPE_DEBUG, "%s Backdating root clock: %@ start from: %lu to: %lu", (uint8_t *)&v29, 0x2Au);

    }
    objc_msgSend(v7, "clockStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartedOn:", objc_msgSend(v6, "timestamp"));

  }
  objc_msgSend(v6, "streamUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v7;
  if (v13)
  {
    objc_msgSend(v6, "streamUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "isTrackingDerivativeClockByStreamUUID:", v15);

    objc_msgSend(v6, "streamUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "derivativeClockForStreamUUID:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v16 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "whiteRose:derivativeClockCreated:rootClock:", self, v14, v7);

    }
  }
  objc_msgSend(v14, "logicalTimestampForMachAbsoluteTime:", objc_msgSend(v6, "timestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [SiriAnalyticsMessage alloc];
  objc_msgSend(v6, "messageUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SiriAnalyticsMessage initWithMessageUUID:logicalTimestamp:underlying:](v20, "initWithMessageUUID:logicalTimestamp:underlying:", v21, v19, v22);

  objc_msgSend(v14, "clockStatistics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "noteMessageEmitted");

  -[SiriAnalyticsDebounce pulse](self->_clockPulse, "pulse");
  return v23;
}

- (void)markTimeForAnnotatedMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_ensureActiveClockStartingAt:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  SiriAnalyticsRootClock *activeClock;
  id *p_activeClock;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  SiriAnalyticsRootClock *v13;
  void *v14;
  SiriAnalyticsRootClock *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  SiriAnalyticsRootClock *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  SiriAnalyticsRootClock *v27;
  void (**v28)(id, _QWORD);
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  p_activeClock = (id *)&self->_activeClock;
  activeClock = self->_activeClock;
  if (activeClock)
  {
    -[SiriAnalyticsLogicalClock clockStatistics](activeClock, "clockStatistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "startedOn");

    if (v10 > a3)
    {
      if (SiriAnalyticsLoggingInit_once != -1)
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
      v11 = (void *)SiriAnalyticsLogContextTime;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
      {
        v22 = *p_activeClock;
        v23 = v11;
        objc_msgSend(v22, "clockIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_activeClock, "clockStatistics");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v30 = "-[SiriAnalyticsWhiteRose _ensureActiveClockStartingAt:completion:]";
        v31 = 2112;
        v32 = v24;
        v33 = 2048;
        v34 = objc_msgSend(v25, "startedOn");
        v35 = 2048;
        v36 = a3;
        _os_log_debug_impl(&dword_1A025F000, v23, OS_LOG_TYPE_DEBUG, "%s Backdating root clock: %@ start from: %lu to: %lu", buf, 0x2Au);

      }
      objc_msgSend(*p_activeClock, "clockStatistics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStartedOn:", a3);

    }
    ((void (**)(id, id))v6)[2](v6, *p_activeClock);
  }
  else
  {
    v13 = [SiriAnalyticsRootClock alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SiriAnalyticsRootClock initWithClockIdentifier:timestampOffset:startedOn:metastore:](v13, "initWithClockIdentifier:timestampOffset:startedOn:metastore:", v14, 0, a3, self->_metastore);

    objc_storeStrong((id *)&self->_activeClock, v15);
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v16 = (void *)SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      v17 = *p_activeClock;
      v18 = v16;
      objc_msgSend(v17, "clockIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "-[SiriAnalyticsWhiteRose _ensureActiveClockStartingAt:completion:]";
      v31 = 2112;
      v32 = v19;
      v33 = 2048;
      v34 = a3;
      _os_log_impl(&dword_1A025F000, v18, OS_LOG_TYPE_INFO, "%s Created primary clock: %@, starting on: %lu", buf, 0x20u);

    }
    -[SiriAnalyticsWhiteRose _startMaximumClockLifeTimer](self, "_startMaximumClockLifeTimer");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke;
    v26[3] = &unk_1E4357C48;
    v26[4] = self;
    v27 = v15;
    v28 = v6;
    v21 = v15;
    objc_msgSend(WeakRetained, "whiteRose:willCreateRootClock:completion:", self, v21, v26);

  }
}

- (void)destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose_destroyActiveClockWithReason_completion___block_invoke;
  block[3] = &unk_1E4357298;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  SiriAnalyticsRootClock *activeClock;
  SiriAnalyticsRootClock *v10;
  SiriAnalyticsRootClock *v11;
  id WeakRetained;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SiriAnalyticsLogicalClock clockIdentifier](self->_activeClock, "clockIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v8 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriAnalyticsWhiteRose _destroyActiveClockWithReason:completion:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1A025F000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  activeClock = self->_activeClock;
  if (activeClock)
  {
    -[SiriAnalyticsLogicalClock stopClock](activeClock, "stopClock");
    v10 = self->_activeClock;
    v11 = self->_activeClock;
    self->_activeClock = 0;

  }
  else
  {
    v10 = 0;
  }
  -[SiriAnalyticsWhiteRose _cancelInactivityTimer](self, "_cancelInactivityTimer");
  -[SiriAnalyticsWhiteRose _cancelMaximumClockLifeTimer](self, "_cancelMaximumClockLifeTimer");
  -[SiriAnalyticsWhiteRose _pulseActiveClock](self, "_pulseActiveClock");
  -[SiriAnalyticsDebounce cancel](self->_clockPulse, "cancel");
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SiriAnalyticsWhiteRose__destroyActiveClockWithReason_completion___block_invoke;
    v13[3] = &unk_1E4357C98;
    v15 = v6;
    v14 = v7;
    objc_msgSend(WeakRetained, "whiteRose:rootClockDestroyed:reason:completion:", self, v10, a3, v13);

  }
  else if (v6)
  {
    (*((void (**)(id, void *))v6 + 2))(v6, v7);
  }

}

- (void)_pulseActiveClock
{
  SiriAnalyticsRootClock *activeClock;
  void *v4;
  int v5;
  SiriAnalyticsMetastore *metastore;
  void *v7;
  void *v8;
  id v9;

  activeClock = self->_activeClock;
  if (activeClock)
  {
    -[SiriAnalyticsLogicalClock clockStatistics](activeClock, "clockStatistics");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "messagesEmitted"))
    {
      -[SiriAnalyticsLogicalClock clockStatistics](self->_activeClock, "clockStatistics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "bookkeepingDirtied");

      if (!v5)
        return;
      metastore = self->_metastore;
      -[SiriAnalyticsLogicalClock clockIdentifier](self->_activeClock, "clockIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriAnalyticsLogicalClock clockStatistics](self->_activeClock, "clockStatistics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriAnalyticsMetastore pulseClock:lastEventOn:](metastore, "pulseClock:lastEventOn:", v7, objc_msgSend(v8, "lastMessageEmittedOn"));

      -[SiriAnalyticsLogicalClock clockStatistics](self->_activeClock, "clockStatistics");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBookkeepingDirtied:", 0);
    }

  }
}

- (void)_startInactivityTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *inactivityTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  inactivityTimer = self->_inactivityTimer;
  self->_inactivityTimer = v3;

  v5 = self->_inactivityTimer;
  v6 = dispatch_time(0, (uint64_t)(self->_maximumInactivityInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v7 = self->_inactivityTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SiriAnalyticsWhiteRose__startInactivityTimer__block_invoke;
  v8[3] = &unk_1E4357B38;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_inactivityTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_cancelInactivityTimer
{
  NSObject *inactivityTimer;
  OS_dispatch_source *v4;

  inactivityTimer = self->_inactivityTimer;
  if (inactivityTimer)
  {
    dispatch_source_cancel(inactivityTimer);
    v4 = self->_inactivityTimer;
    self->_inactivityTimer = 0;

  }
}

- (void)_inactivityTimerElapsed
{
  void *v3;
  SiriAnalyticsRootClock *activeClock;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    v5 = v3;
    -[SiriAnalyticsLogicalClock clockIdentifier](activeClock, "clockIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SiriAnalyticsWhiteRose _inactivityTimerElapsed]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A025F000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);

  }
  -[SiriAnalyticsWhiteRose _destroyActiveClockWithReason:completion:](self, "_destroyActiveClockWithReason:completion:", 1, 0);
}

- (void)_startMaximumClockLifeTimer
{
  void *v3;
  SiriAnalyticsRootClock *activeClock;
  NSObject *v5;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *maximumClockLifeTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    v5 = v3;
    -[SiriAnalyticsLogicalClock clockIdentifier](activeClock, "clockIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[SiriAnalyticsWhiteRose _startMaximumClockLifeTimer]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1A025F000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  maximumClockLifeTimer = self->_maximumClockLifeTimer;
  self->_maximumClockLifeTimer = v7;

  v9 = self->_maximumClockLifeTimer;
  v10 = dispatch_time(0, (uint64_t)(self->_maximumClockLifeInterval * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  v11 = self->_maximumClockLifeTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __53__SiriAnalyticsWhiteRose__startMaximumClockLifeTimer__block_invoke;
  handler[3] = &unk_1E4357B38;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_maximumClockLifeTimer);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_cancelMaximumClockLifeTimer
{
  void *v3;
  NSObject *maximumClockLifeTimer;
  OS_dispatch_source *v5;
  SiriAnalyticsRootClock *activeClock;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    activeClock = self->_activeClock;
    v7 = v3;
    -[SiriAnalyticsLogicalClock clockIdentifier](activeClock, "clockIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriAnalyticsWhiteRose _cancelMaximumClockLifeTimer]";
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_1A025F000, v7, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);

  }
  maximumClockLifeTimer = self->_maximumClockLifeTimer;
  if (maximumClockLifeTimer)
  {
    dispatch_source_cancel(maximumClockLifeTimer);
    v5 = self->_maximumClockLifeTimer;
    self->_maximumClockLifeTimer = 0;

  }
}

- (void)_maximumClockLifeExpired
{
  void *v3;
  SiriAnalyticsRootClock *activeClock;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    v5 = v3;
    -[SiriAnalyticsLogicalClock clockIdentifier](activeClock, "clockIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SiriAnalyticsWhiteRose _maximumClockLifeExpired]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A025F000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);

  }
  -[SiriAnalyticsWhiteRose _destroyActiveClockWithReason:completion:](self, "_destroyActiveClockWithReason:completion:", 2, 0);
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  int v19;
  BOOL v20;
  _QWORD aBlock[4];
  id v22;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke;
  aBlock[3] = &unk_1E4357510;
  v22 = v10;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_2;
  block[3] = &unk_1E43572E8;
  v20 = a5;
  block[4] = self;
  v17 = v13;
  v18 = a4;
  v19 = a3;
  v15 = v13;
  dispatch_async(queue, block);

}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  int v19;
  BOOL v20;
  _QWORD aBlock[4];
  id v22;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke;
  aBlock[3] = &unk_1E4357510;
  v22 = v10;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_2;
  block[3] = &unk_1E43572E8;
  v20 = a5;
  block[4] = self;
  v17 = v13;
  v18 = a4;
  v19 = a3;
  v15 = v13;
  dispatch_async(queue, block);

}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke;
  aBlock[3] = &unk_1E4357310;
  v18 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  queue = self->_queue;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_2;
  v14[3] = &unk_1E4357C48;
  v14[4] = self;
  v15 = v6;
  v16 = v10;
  v12 = v10;
  v13 = v6;
  dispatch_async(queue, v14);

}

- (void)debounceFired:(id)a3 maximumReached:(BOOL)a4
{
  if (self->_clockPulse == a3)
    -[SiriAnalyticsWhiteRose _pulseActiveClock](self, "_pulseActiveClock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockPulse, 0);
  objc_storeStrong((id *)&self->_clockPulseTimer, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_maximumClockLifeTimer, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_activeClock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = mach_absolute_time();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_3;
  v6[3] = &unk_1E4357338;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_ensureActiveClockStartingAt:completion:", v3, v6);

}

void __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1[4];
  if (v3)
  {
    v4 = *(void **)(a1[5] + 64);
    objc_msgSend(a2, "clockIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createTagWithShim:onClock:", v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, BOOL))(a1[6] + 16))(a1[6], v6 != 0);
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  int v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 60) || v2[3])
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_8;
    v5[3] = &unk_1E43572C0;
    v8 = *(_DWORD *)(a1 + 56);
    v3 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v6 = v3;
    objc_msgSend(v2, "_ensureActiveClockStartingAt:completion:", v7, v5);

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v4 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SiriAnalyticsWhiteRose sensitiveCondition:endedAt:ensureClockExists:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A025F000, v4, OS_LOG_TYPE_INFO, "%s No active clock exists, ignoring sensitiveCondition", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_8(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sensitiveCondition:endedAt:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  int v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 60) || v2[3])
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_7;
    v5[3] = &unk_1E43572C0;
    v8 = *(_DWORD *)(a1 + 56);
    v3 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v6 = v3;
    objc_msgSend(v2, "_ensureActiveClockStartingAt:completion:", v7, v5);

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v4 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SiriAnalyticsWhiteRose sensitiveCondition:startedAt:ensureClockExists:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A025F000, v4, OS_LOG_TYPE_INFO, "%s No active clock exists, ignoring sensitiveCondition", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sensitiveCondition:startedAt:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__SiriAnalyticsWhiteRose__startMaximumClockLifeTimer__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x1A1AF76A4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_maximumClockLifeExpired");

  objc_autoreleasePoolPop(v2);
}

void __47__SiriAnalyticsWhiteRose__startInactivityTimer__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x1A1AF76A4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inactivityTimerElapsed");

  objc_autoreleasePoolPop(v2);
}

uint64_t __67__SiriAnalyticsWhiteRose__destroyActiveClockWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __66__SiriAnalyticsWhiteRose_destroyActiveClockWithReason_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyActiveClockWithReason:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke_2;
  block[3] = &unk_1E4357C48;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "whiteRose:rootClockCreated:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "_cancelInactivityTimer");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[5], "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = mach_absolute_time();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke_2;
  v8[3] = &unk_1E4357270;
  v5 = a1[5];
  v6 = a1[4];
  v9 = v5;
  v10 = v6;
  v11 = v2;
  v12 = a1[6];
  v7 = v2;
  objc_msgSend(v3, "_ensureActiveClockStartingAt:completion:", v4, v8);

}

void __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "markTimeForAnnotatedMessage:withRootClock:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), v3, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "_startInactivityTimer");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __50__SiriAnalyticsWhiteRose_bootstrapWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[SiriAnalyticsWhiteRose bootstrapWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_1A025F000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clockIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cleanupAbandonedClocksWithActiveClockIdentifier:", v3);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

@end
