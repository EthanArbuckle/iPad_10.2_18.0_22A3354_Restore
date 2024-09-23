@implementation PCSimpleTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerMode, 0);
  objc_storeStrong((id *)&self->_timerRunLoop, 0);
  objc_storeStrong(&self->_timeChangeSource, 0);
  objc_storeStrong((id *)&self->_fireTimer, 0);
  objc_storeStrong((id *)&self->_preventSleepTimer, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledWakeDate, 0);
}

- (PCSimpleTimer)initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 triggerOnGMTChange:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  PCSimpleTimer *v18;
  uint64_t v19;
  NSString *serviceIdentifier;
  void *v22;
  objc_super v23;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PCSimpleTimer;
  v18 = -[PCSimpleTimer init](&v23, sel_init);
  if (v18)
  {
    if (!v16 || !a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PCSimpleTimer.m"), 119, CFSTR("%@ target and selector are required"), objc_opt_class());

    }
    v18->_fireTime = a3;
    v19 = objc_msgSend(v15, "copy");
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    objc_storeStrong(&v18->_target, a5);
    v18->_selector = a6;
    objc_storeStrong(&v18->_userInfo, a7);
    v18->_triggerOnGMTChange = a8;
  }

  return v18;
}

- (void)setDisableSystemWaking:(BOOL)a3
{
  PCSimpleTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_disableSystemWaking = a3;
  -[PCSimpleTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4
{
  NSString *v8;
  PCSimpleTimer *v9;
  void *v10;
  void *v11;
  void *v12;
  NSRunLoop *v13;

  v13 = (NSRunLoop *)a3;
  v8 = (NSString *)a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PCSimpleTimer.m"), 178, CFSTR("%@ run loop mode cannot be nil"), objc_opt_class());

  }
  if (!v9->_target)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PCSimpleTimer.m"), 179, CFSTR("Cannot schedule invalidated %@"), objc_opt_class());

  }
  if (v9->_queue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PCSimpleTimer.m"), 180, CFSTR("Cannot schedule on runloop when already scheduled on queue %@"), objc_opt_class());

  }
  if (v9->_timerRunLoop != v13)
    objc_storeStrong((id *)&v9->_timerRunLoop, a3);
  if (v9->_timerMode != v8)
    objc_storeStrong((id *)&v9->_timerMode, a4);
  -[PCSimpleTimer _scheduleTimer](v9, "_scheduleTimer");
  objc_sync_exit(v9);

}

- (void)setUserVisible:(BOOL)a3
{
  PCSimpleTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_userVisible = a3;
  -[PCSimpleTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)invalidate
{
  -[PCSimpleTimer _invalidateAllowAsync:](self, "_invalidateAllowAsync:", 1);
}

+ (id)lastSystemWakeDate
{
  uint64_t v2;
  _BOOL4 v3;
  void *v4;
  size_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v6 = 16;
  if (sysctlbyname("kern.waketime", &v7, &v6, 0, 0) || (v2 = v7, v7 <= 31535999))
  {
    v3 = sysctlbyname("kern.boottime", &v7, &v6, 0, 0) == 0;
    v2 = v7;
  }
  else
  {
    v3 = 1;
  }
  v4 = 0;
  if (v3 && v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v2 + (double)(int)v8 * 0.000001);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_scheduleTimer
{
  PCSimpleTimer *v2;
  PCDispatchTimer *fireTimer;
  NSObject *v4;
  void *v5;
  PCDispatchTimer *v6;
  CFAbsoluteTime Current;
  NSObject *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  dispatch_queue_t v11;
  PCDispatchTimer *v12;
  PCDispatchTimer *preventSleepTimer;
  PCDispatchTimer *v14;
  PCDispatchTimer *v15;
  NSObject *v16;
  PCDispatchTimer *v17;
  PCDispatchTimer *v18;
  int v19;
  PCSimpleTimer *v20;
  __int16 v21;
  PCDispatchTimer *v22;
  __int16 v23;
  PCDispatchTimer *v24;
  __int16 v25;
  dispatch_queue_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  fireTimer = v2->_fireTimer;
  if (!fireTimer)
  {
    +[PCLog timer](PCLog, "timer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v2->_fireTime);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v5);
      v6 = (PCDispatchTimer *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v2;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1CBC1B000, v4, OS_LOG_TYPE_DEFAULT, "Started simple timer %{public}@ with fire date [%{public}@]", (uint8_t *)&v19, 0x16u);

    }
    Current = CFAbsoluteTimeGetCurrent();
    v2->_startTime = Current;
    v2->_lastUpdateTime = Current;
    queue = v2->_queue;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    if (queue)
      v10 = dispatch_queue_create_with_target_V2("PCSimpleTimer-timerQ", v9, queue);
    else
      v10 = dispatch_queue_create("PCSimpleTimer-timerQ", v9);
    v11 = v10;

    v12 = -[PCDispatchTimer initWithQueue:target:selector:fireTime:]([PCDispatchTimer alloc], "initWithQueue:target:selector:fireTime:", v11, v2, sel__preventSleepFired, -1);
    preventSleepTimer = v2->_preventSleepTimer;
    v2->_preventSleepTimer = v12;

    v14 = -[PCDispatchTimer initWithQueue:target:selector:fireTime:]([PCDispatchTimer alloc], "initWithQueue:target:selector:fireTime:", v11, v2, sel__fireTimerFired, -1);
    v15 = v2->_fireTimer;
    v2->_fireTimer = v14;

    +[PCLog timer](PCLog, "timer");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v2->_preventSleepTimer;
      v18 = v2->_fireTimer;
      v19 = 138544130;
      v20 = v2;
      v21 = 2114;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ created preventSleepTimer %{public}@ and fireTimer %{public}@ on queue %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    fireTimer = v2->_fireTimer;
  }
  -[PCDispatchTimer start](fireTimer, "start");
  -[PCDispatchTimer start](v2->_preventSleepTimer, "start");
  -[PCSimpleTimer _setPowerMonitoringEnabled:](v2, "_setPowerMonitoringEnabled:", 1);
  -[PCSimpleTimer _setSignificantTimeChangeMonitoringEnabled:](v2, "_setSignificantTimeChangeMonitoringEnabled:", 1);
  -[PCSimpleTimer _updateTimers](v2, "_updateTimers");
  objc_sync_exit(v2);

}

- (void)_updateTimers
{
  NSObject *v3;
  PCDispatchTimer *preventSleepTimer;
  void *v5;
  PCDispatchTimer *fireTimer;
  uint64_t v7;
  void *v8;
  double Current;
  double v10;
  NSObject *v11;
  void *v12;
  PCSimpleTimer *v13;
  double v14;
  void *v15;
  double fireTime;
  void *v17;
  id v18;
  void *v19;
  PCDispatchTimer *v20;
  void *v21;
  NSDate *scheduledWakeDate;
  NSObject *v23;
  double v24;
  NSDate *v25;
  NSObject *v26;
  double v27;
  void *v28;
  double earlyFireDelta;
  NSDate *v30;
  NSDate *v31;
  double v32;
  uint8_t buf[4];
  PCSimpleTimer *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_fireTimer && -[PCDispatchTimer isValid](self->_preventSleepTimer, "isValid"))
  {
    if (self->_sleepIsImminent)
    {
      +[PCLog timer](PCLog, "timer");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "Suspended timer for imminent system sleep", buf, 2u);
      }

      preventSleepTimer = self->_preventSleepTimer;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCDispatchTimer setFireDate:](preventSleepTimer, "setFireDate:", v5);

      fireTimer = self->_fireTimer;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      -[PCDispatchTimer setFireDate:](fireTimer, "setFireDate:", v7);
LABEL_31:

      return;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v10 = Current;
    if (self->_triggerOnGMTChange && self->_lastUpdateTime - Current > 60.0)
    {
      +[PCLog timer](PCLog, "timer");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_fireTime);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PCStringFromDate(v12);
        v13 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
        v14 = self->_lastUpdateTime - v10;
        *(_DWORD *)buf = 138543618;
        v34 = v13;
        v35 = 2048;
        v36 = v14;
        _os_log_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEFAULT, "Firing simple timer that was scheduled to fire at [%{public}@] since time has moved backwards by at least %g seconds", buf, 0x16u);

      }
      -[PCDispatchTimer invalidate](self->_preventSleepTimer, "invalidate");
      fireTimer = self->_fireTimer;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v15 = (void *)MEMORY[0x1E0C99D68];
    fireTime = self->_fireTime;
    if (PCScheduledWakeRTCPrecision_onceToken != -1)
    {
      v32 = self->_fireTime;
      dispatch_once(&PCScheduledWakeRTCPrecision_onceToken, &__block_literal_global_9);
      fireTime = v32;
    }
    objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:", fireTime - *(double *)&PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (self->_disableSystemWaking)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v17;
    }
    v19 = v18;
    -[PCDispatchTimer setFireDate:](self->_preventSleepTimer, "setFireDate:", v18);
    v20 = self->_fireTimer;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_fireTime);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCDispatchTimer setFireDate:](v20, "setFireDate:", v21);

    scheduledWakeDate = self->_scheduledWakeDate;
    if (self->_disableSystemWaking)
    {
      if (scheduledWakeDate)
      {
        +[PCLog timer](PCLog, "timer");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(self->_scheduledWakeDate);
          v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138543618;
          v34 = self;
          v35 = 2114;
          v36 = v24;
          _os_log_impl(&dword_1CBC1B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling system wake for simpletimer [%{public}@]", buf, 0x16u);

        }
        +[PCSystemWakeManager scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:](PCSystemWakeManager, "scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:", 0, self->_scheduledWakeDate, self->_userVisible, self->_serviceIdentifier, self, 0.0);
        v25 = 0;
LABEL_29:
        v31 = self->_scheduledWakeDate;
        self->_scheduledWakeDate = v25;

      }
    }
    else if ((objc_msgSend(v8, "isEqualToDate:", scheduledWakeDate) & 1) == 0)
    {
      +[PCLog timer](PCLog, "timer");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        PCStringFromDate(self->_scheduledWakeDate);
        v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        PCStringFromDate(v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        earlyFireDelta = self->_earlyFireDelta;
        *(_DWORD *)buf = 138544130;
        v34 = self;
        v35 = 2114;
        v36 = v27;
        v37 = 2114;
        v38 = v28;
        v39 = 2048;
        v40 = earlyFireDelta;
        _os_log_impl(&dword_1CBC1B000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Existing wake at %{public}@ re-scheduling to %{public}@ with leeway of %g", buf, 0x2Au);

      }
      +[PCSystemWakeManager scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:](PCSystemWakeManager, "scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:", 1, v8, self->_userVisible, self->_serviceIdentifier, self, self->_earlyFireDelta);
      v30 = self->_scheduledWakeDate;
      if (v30)
        +[PCSystemWakeManager scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:](PCSystemWakeManager, "scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:", 0, v30, self->_userVisible, self->_serviceIdentifier, self, 0.0);
      v25 = v8;
      goto LABEL_29;
    }
    self->_lastUpdateTime = v10;

    goto LABEL_31;
  }
}

- (void)_invalidateAllowAsync:(BOOL)a3
{
  _BOOL4 v3;
  PCSimpleTimer *v4;
  NSObject *v5;
  id target;
  NSRunLoop *timerRunLoop;
  NSString *timerMode;
  OS_dispatch_queue *queue;
  PCDispatchTimer *preventSleepTimer;
  PCDispatchTimer *fireTimer;
  NSDate *scheduledWakeDate;
  double v13;
  NSObject *v14;
  PCSimpleTimer *v15;
  NSObject *v16;
  PCSimpleTimer *v17;
  NSDate *v18;
  NSObject *v19;
  unsigned int powerAssertionID;
  uint64_t v21;
  uint8_t buf[4];
  PCSimpleTimer *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_target)
  {
    +[PCLog timer](PCLog, "timer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v4;
      _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating simple timer %{public}@", buf, 0xCu);
    }

    target = v4->_target;
    v4->_target = 0;

    v4->_selector = 0;
    timerRunLoop = v4->_timerRunLoop;
    v4->_timerRunLoop = 0;

    timerMode = v4->_timerMode;
    v4->_timerMode = 0;

    queue = v4->_queue;
    v4->_queue = 0;

    -[PCDispatchTimer invalidate](v4->_preventSleepTimer, "invalidate");
    preventSleepTimer = v4->_preventSleepTimer;
    v4->_preventSleepTimer = 0;

    -[PCDispatchTimer invalidate](v4->_fireTimer, "invalidate");
    fireTimer = v4->_fireTimer;
    v4->_fireTimer = 0;

    scheduledWakeDate = v4->_scheduledWakeDate;
    if (scheduledWakeDate)
    {
      -[NSDate timeIntervalSinceNow](scheduledWakeDate, "timeIntervalSinceNow");
      if (v13 >= 2.22044605e-16)
      {
        +[PCLog timer](PCLog, "timer");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v4->_scheduledWakeDate);
          v17 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "Canceling system wake for simpletimer [%{public}@]", buf, 0xCu);

        }
        +[PCSystemWakeManager scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:](PCSystemWakeManager, "scheduleWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:", 0, v4->_scheduledWakeDate, v4->_userVisible, v4->_serviceIdentifier, v4, 0.0);
      }
      else
      {
        +[PCLog timer](PCLog, "timer");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v4->_scheduledWakeDate);
          v15 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_impl(&dword_1CBC1B000, v14, OS_LOG_TYPE_DEFAULT, "Not canceling system wake for [%{public}@], which is in the past", buf, 0xCu);

        }
      }
      v18 = v4->_scheduledWakeDate;
      v4->_scheduledWakeDate = 0;

    }
    if (v4->_powerAssertionID)
    {
      +[PCLog timer](PCLog, "timer");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        powerAssertionID = v4->_powerAssertionID;
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = powerAssertionID;
        _os_log_impl(&dword_1CBC1B000, v19, OS_LOG_TYPE_DEFAULT, "Releasing prevent sleep power assertion %i", buf, 8u);
      }

      v21 = IOPMAssertionRelease(v4->_powerAssertionID);
      if ((_DWORD)v21)
        NSLog(CFSTR("Failed to release power assertion %i. IOPMAssertionRelease returned %#x"), v4->_powerAssertionID, v21);
      v4->_powerAssertionID = 0;
    }
    if (v3)
      -[PCSimpleTimer _setPowerMonitoringEnabled:](v4, "_setPowerMonitoringEnabled:", 0);
    -[PCSimpleTimer _setSignificantTimeChangeMonitoringEnabled:](v4, "_setSignificantTimeChangeMonitoringEnabled:", 0);
  }
  objc_sync_exit(v4);

}

- (void)_setSignificantTimeChangeMonitoringEnabled:(BOOL)a3
{
  int significantTimeChangeToken;
  int *p_significantTimeChangeToken;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD handler[4];
  id v10;

  p_significantTimeChangeToken = &self->_significantTimeChangeToken;
  significantTimeChangeToken = self->_significantTimeChangeToken;
  if (a3)
  {
    if (significantTimeChangeToken == -1)
    {
      v6 = dispatch_queue_create("PCSimpleTimer-SignificantTimeChangeQueue", 0);
      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __60__PCSimpleTimer__setSignificantTimeChangeMonitoringEnabled___block_invoke;
      handler[3] = &unk_1E87433F0;
      v10 = v7;
      v8 = v7;
      notify_register_dispatch("SignificantTimeChangeNotification", p_significantTimeChangeToken, v6, handler);

    }
  }
  else if (significantTimeChangeToken != -1)
  {
    notify_cancel(significantTimeChangeToken);
    *p_significantTimeChangeToken = -1;
  }
}

- (void)_setPowerMonitoringEnabled:(BOOL)a3
{
  PCSimpleTimer *v3;
  NSObject *v4;
  void (*v5)(uint64_t);
  PCSimpleTimer *v6;
  _QWORD block[4];
  PCSimpleTimer *v8;

  if (a3)
  {
    v3 = self;
    _GetPowerMonitoringQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    v5 = ___EnablePowerMonitoring_block_invoke;
  }
  else
  {
    v3 = self;
    _GetPowerMonitoringQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    v5 = ___DisablePowerMonitoring_block_invoke;
  }
  block[1] = 3221225472;
  block[2] = v5;
  block[3] = &unk_1E8743348;
  v8 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

- (void)updateFireTime:(double)a3 triggerOnGMTChange:(BOOL)a4
{
  _BOOL4 v4;
  PCSimpleTimer *v6;
  double fireTime;
  double earlyFireDelta;
  NSObject *v9;
  double v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  _BOOL4 triggerOnGMTChange;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  PCSimpleTimer *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  fireTime = v6->_fireTime;
  if (fireTime != a3 || v6->_triggerOnGMTChange != v4)
  {
    earlyFireDelta = v6->_earlyFireDelta;
    +[PCLog timer](PCLog, "timer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = fireTime + earlyFireDelta - a3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6->_fireTime);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v6->_earlyFireDelta;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      triggerOnGMTChange = v6->_triggerOnGMTChange;
      v16 = CFSTR("YES");
      v18 = 138544898;
      if (triggerOnGMTChange)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v19 = v6;
      v20 = 2114;
      if (!v4)
        v16 = CFSTR("NO");
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      v26 = 2048;
      v27 = v10;
      v28 = 2114;
      v29 = v17;
      v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_1CBC1B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updateFireTime from %{public}@ + %g to %{public}@ + %g, trigger from %{public}@ to %{public}@", (uint8_t *)&v18, 0x48u);

    }
    v6->_earlyFireDelta = v10;
    v6->_fireTime = a3;
    v6->_triggerOnGMTChange = v4;
    -[PCSimpleTimer _updateTimers](v6, "_updateTimers");
  }
  objc_sync_exit(v6);

}

+ (double)currentMachTimeInterval
{
  if (currentMachTimeInterval_pred != -1)
    dispatch_once(&currentMachTimeInterval_pred, &__block_literal_global_60);
  return *(double *)&currentMachTimeInterval_timeScale * (double)mach_absolute_time();
}

- (void)dealloc
{
  objc_super v3;

  -[PCSimpleTimer _invalidateAllowAsync:](self, "_invalidateAllowAsync:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PCSimpleTimer;
  -[PCSimpleTimer dealloc](&v3, sel_dealloc);
}

- (void)scheduleInRunLoop:(id)a3
{
  -[PCSimpleTimer scheduleInRunLoop:inMode:](self, "scheduleInRunLoop:inMode:", a3, *MEMORY[0x1E0C99860]);
}

- (PCSimpleTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  PCSimpleTimer *v15;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = -[PCSimpleTimer initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:](self, "initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:", v14, v13, a6, v12, 1, CFAbsoluteTimeGetCurrent() + a3);

  return v15;
}

- (BOOL)firingIsImminent
{
  PCSimpleTimer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_powerAssertionID != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_fireTimerFired
{
  PCSimpleTimer *v2;
  NSObject *v3;
  id v4;
  NSString *v5;
  NSRunLoop *v6;
  NSObject *queue;
  NSObject *v8;
  SEL selector;
  void *v10;
  _QWORD block[4];
  id v12;
  PCSimpleTimer *v13;
  SEL v14;
  uint8_t buf[4];
  PCSimpleTimer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_target)
  {
    if (!v2->_disableSystemWaking)
      -[PCSimpleTimer _preventSleepFired](v2, "_preventSleepFired");
    +[PCLog timer](PCLog, "timer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v2;
      _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "SimpleTimer %{public}@ has fired", buf, 0xCu);
    }

    v4 = v2->_target;
    v5 = v2->_timerMode;
    v6 = v2->_timerRunLoop;
    queue = v2->_queue;
    if (queue)
      v8 = queue;
    selector = v2->_selector;
    -[PCSimpleTimer invalidate](v2, "invalidate");
  }
  else
  {
    selector = 0;
    v5 = 0;
    v6 = 0;
    queue = 0;
    v4 = 0;
  }
  objc_sync_exit(v2);

  if (v6 && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRunLoop performSelector:target:argument:order:modes:](v6, "performSelector:target:argument:order:modes:", selector, v4, v2, 0, v10);

    CFRunLoopWakeUp(-[NSRunLoop getCFRunLoop](v6, "getCFRunLoop"));
  }
  else if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PCSimpleTimer__fireTimerFired__block_invoke;
    block[3] = &unk_1E8743878;
    v13 = v2;
    v14 = selector;
    v12 = v4;
    dispatch_async(queue, block);

  }
}

- (void)scheduleInQueue:(id)a3
{
  PCSimpleTimer *v6;
  void *v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *v10;

  v10 = (OS_dispatch_queue *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_target)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PCSimpleTimer.m"), 196, CFSTR("Cannot schedule invalidated %@"), objc_opt_class());

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PCSimpleTimer.m"), 197, CFSTR("Cannot schedule on NULL queue %@"), objc_opt_class());

LABEL_3:
  if (v6->_timerRunLoop)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PCSimpleTimer.m"), 198, CFSTR("Cannot schedule on queue when already scheduled on runloop %@"), objc_opt_class());

  }
  if (v6->_queue != v10)
    objc_storeStrong((id *)&v6->_queue, a3);
  -[PCSimpleTimer _scheduleTimer](v6, "_scheduleTimer");
  objc_sync_exit(v6);

}

- (PCSimpleTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  PCSimpleTimer *v15;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v15 = -[PCSimpleTimer initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:](self, "initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:", v14, v13, a6, v12, 0);

  return v15;
}

- (BOOL)isUserVisible
{
  PCSimpleTimer *v2;
  BOOL userVisible;

  v2 = self;
  objc_sync_enter(v2);
  userVisible = v2->_userVisible;
  objc_sync_exit(v2);

  return userVisible;
}

- (BOOL)isValid
{
  PCSimpleTimer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_target != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)userInfo
{
  PCSimpleTimer *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

- (id)_getTimerRunLoop
{
  PCSimpleTimer *v2;
  NSRunLoop *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timerRunLoop;
  objc_sync_exit(v2);

  return v3;
}

- (id)_getTimerMode
{
  PCSimpleTimer *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timerMode;
  objc_sync_exit(v2);

  return v3;
}

- (void)_performBlockOnQueue:(id)a3
{
  id v4;
  PCSimpleTimer *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    queue = v5->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PCSimpleTimer__performBlockOnQueue___block_invoke;
      block[3] = &unk_1E8743850;
      v8 = v4;
      dispatch_async(queue, block);

    }
  }
  objc_sync_exit(v5);

}

uint64_t __38__PCSimpleTimer__performBlockOnQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_preventSleepFired
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1CBC1B000, a2, OS_LOG_TYPE_FAULT, "Unable to take power assertion. IOPMAssertionCreateWithDescription() returned %#x", (uint8_t *)v2, 8u);
}

uint64_t __32__PCSimpleTimer__fireTimerFired__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_powerNotificationSleepIsNotImminent
{
  PCSimpleTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_sleepIsImminent = 0;
  -[PCSimpleTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)_powerNotificationSleepIsImminent
{
  PCSimpleTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_sleepIsImminent = 1;
  -[PCSimpleTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)_significantTimeChange
{
  PCSimpleTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PCSimpleTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

void __60__PCSimpleTimer__setSignificantTimeChangeMonitoringEnabled___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_significantTimeChange");

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  id target;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PCSimpleTimer;
  -[PCSimpleTimer description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_fireTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_disableSystemWaking)
    v6 = "yes";
  else
    v6 = "no";
  target = self->_target;
  NSStringFromSelector(self->_selector);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{fireDate = %@, disable system waking = %s, target = %@, selector = %@}"), v4, v5, v6, target, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

double __40__PCSimpleTimer_currentMachTimeInterval__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 * 0.000000001;
  currentMachTimeInterval_timeScale = *(_QWORD *)&result;
  return result;
}

- (BOOL)disableSystemWaking
{
  return self->_disableSystemWaking;
}

@end
