@implementation SWWakingTimer

- (SWWakingTimer)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SWWakingTimer *v7;

  v4 = a3;
  +[SWSystemSleepMonitor monitorUsingMainQueue](SWSystemSleepMonitor, "monitorUsingMainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SWSystemSleepAssertionProvider sharedProvider](SWSystemSleepAssertionProvider, "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWWakingTimer initWithIdentifier:sleepMonitor:sleepAssertionProvider:](self, "initWithIdentifier:sleepMonitor:sleepAssertionProvider:", v4, v5, v6);

  return v7;
}

- (SWWakingTimer)initWithIdentifier:(id)a3 sleepMonitor:(id)a4 sleepAssertionProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWWakingTimer *v12;
  SWWakingTimer *v13;
  SWScheduledSystemWake *v14;
  SWScheduledSystemWake *scheduledWake;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SWWakingTimer;
  v12 = -[SWWakingTimer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_sleepMonitor, a4);
    objc_storeStrong((id *)&v13->_sleepAssertionProvider, a5);
    v14 = -[SWScheduledSystemWake initWithIdentifier:]([SWScheduledSystemWake alloc], "initWithIdentifier:", v9);
    scheduledWake = v13->_scheduledWake;
    v13->_scheduledWake = v14;

    objc_msgSend(v10, "addObserver:", v13);
  }

  return v13;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  SWWakingTimer *v6;
  objc_class *v7;
  SWWakingTimer *v8;
  objc_super v9;
  uint8_t buf[4];
  SWWakingTimer *v11;
  __int16 v12;
  SWWakingTimer *v13;
  __int16 v14;
  SWWakingTimer *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  SWLogTimer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = self;
    _os_log_debug_impl(&dword_206568000, v4, OS_LOG_TYPE_DEBUG, "%p dealloc %{public}@", buf, 0x16u);
  }

  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p must invalidate before dealloc : %@"), self, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (SWWakingTimer *)(id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("SWWakingTimer.m");
      v18 = 1024;
      v19 = 53;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656FD30);
  }
  v9.receiver = self;
  v9.super_class = (Class)SWWakingTimer;
  -[SWWakingTimer dealloc](&v9, sel_dealloc);
}

- (BOOL)isScheduled
{
  os_unfair_lock_s *p_lock;
  BSTimerScheduleQuerying *lock_timer;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_timer = self->_lock_timer;
  if (lock_timer)
    v5 = -[BSTimerScheduleQuerying isScheduled](lock_timer, "isScheduled");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)timeRemaining
{
  os_unfair_lock_s *p_lock;
  BSTimerScheduleQuerying *lock_timer;
  double v5;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_timer = self->_lock_timer;
  if (lock_timer)
  {
    -[BSTimerScheduleQuerying timeRemaining](lock_timer, "timeRemaining");
    v6 = v5;
  }
  else
  {
    v6 = NAN;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_lock_timer, CFSTR("timer"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_lock_invalidated, CFSTR("isInvalidated"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id lock_handler;
  NSObject *v16;
  void *v17;
  id v18;
  objc_class *v19;
  SWWakingTimer *v20;
  void *v21;
  id v22;
  objc_class *v23;
  SWWakingTimer *v24;
  void *v25;
  id v26;
  objc_class *v27;
  SWWakingTimer *v28;
  _QWORD v29[4];
  id v30;
  _BYTE location[12];
  __int16 v32;
  SWWakingTimer *v33;
  __int16 v34;
  SWWakingTimer *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v18;
      v32 = 2114;
      v33 = v20;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("SWWakingTimer.m");
      v38 = 1024;
      v39 = 87;
      v40 = 2114;
      v41 = v17;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2065701D4);
  }
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("leeway cannot be negative: %f"), *(_QWORD *)&a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v22;
      v32 = 2114;
      v33 = v24;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("SWWakingTimer.m");
      v38 = 1024;
      v39 = 88;
      v40 = 2114;
      v41 = v21;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2065702CCLL);
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDE8]), "initWithIdentifier:", self->_identifier);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot schedule after invalidating"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v26;
      v32 = 2114;
      v33 = v28;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("SWWakingTimer.m");
      v38 = 1024;
      v39 = 93;
      v40 = 2114;
      v41 = v25;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2065703C0);
  }
  -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
  objc_storeStrong((id *)&self->_lock_timer, v13);
  self->_lock_leeway = a4;
  v14 = (void *)MEMORY[0x20BCF9118](v12);
  lock_handler = self->_lock_handler;
  self->_lock_handler = v14;

  -[SWWakingTimer _lock_setPreventSleepAssertion:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  SWLogTimer();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134218242;
    *(_QWORD *)&location[4] = self;
    v32 = 2114;
    v33 = self;
    _os_log_debug_impl(&dword_206568000, v16, OS_LOG_TYPE_DEBUG, "%p scheduling %{public}@", location, 0x16u);
  }

  objc_initWeak((id *)location, self);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __71__SWWakingTimer_scheduleWithFireInterval_leewayInterval_queue_handler___block_invoke;
  v29[3] = &unk_24BF27F20;
  objc_copyWeak(&v30, (id *)location);
  objc_msgSend(v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", v11, v29, a3, a4);
  if (-[SWSystemSleepMonitor hasSleepBeenRequested](self->_sleepMonitor, "hasSleepBeenRequested"))
    -[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)self);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);

}

- (void)_lock_setPreventSleepAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v8 = v3;
    v5 = v3;
    v6 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v5;
    v7 = v4;

    objc_msgSend(v7, "invalidate");
    v3 = v8;
  }

}

void __71__SWWakingTimer_scheduleWithFireInterval_leewayInterval_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[SWWakingTimer _timerFired:]((uint64_t)WeakRetained, v3);

}

- (void)_timerFired:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void (**v8)(_QWORD, _QWORD);
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 48);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(id *)(a1 + 56);

    SWLogTimer();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5 == v4)
    {
      if (v7)
      {
        v9 = 134218242;
        v10 = a1;
        v11 = 2114;
        v12 = a1;
        _os_log_impl(&dword_206568000, v6, OS_LOG_TYPE_INFO, "%p timer fired:%{public}@", (uint8_t *)&v9, 0x16u);
      }

      v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BCF9118](*(_QWORD *)(a1 + 64));
      os_unfair_lock_unlock(v3);
      if (v8)
      {
        v8[2](v8, a1);
        -[SWWakingTimer _setPreventSleepAssertion:](a1, 0);
      }
    }
    else
    {
      if (v7)
      {
        v9 = 134218242;
        v10 = a1;
        v11 = 2114;
        v12 = a1;
        _os_log_impl(&dword_206568000, v6, OS_LOG_TYPE_INFO, "%p obsolete timer fired:%{public}@", (uint8_t *)&v9, 0x16u);
      }

      os_unfair_lock_unlock(v3);
      v8 = 0;
    }

  }
}

- (uint64_t)_updateScheduledWakeAndCheckCanSleep
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  double v3;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v1 = (uint64_t)a1;
  v23 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a1 + 12;
    os_unfair_lock_lock(a1 + 12);
    objc_msgSend(*(id *)(v1 + 56), "timeRemaining");
    if (*(_QWORD *)(v1 + 56))
    {
      v5 = v3;
      v6 = v3 + CFAbsoluteTimeGetCurrent();
      v7 = fabs(v6);
      v8 = objc_msgSend(*(id *)(v1 + 16), "isScheduled");
      if (v7 != INFINITY)
      {
        if (!v8 || (objc_msgSend(*(id *)(v1 + 16), "wakeTime"), vabdd_f64(v6, v9) >= 0.25))
        {
          v10 = *(double *)(v1 + 72);
          if ((uint64_t)v10 <= 1)
            v11 = 1;
          else
            v11 = (uint64_t)v10;
          objc_msgSend(*(id *)(v1 + 16), "scheduleWake:leeway:", v11, v6);
        }
        if (v5 <= 0.5)
        {
          v12 = *(double *)(v1 + 72);
          SWLogTimer();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v12 >= 0.0 && v12 < 10.0)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v17 = 134218242;
              v18 = v1;
              v19 = 2114;
              v20 = v1;
              _os_log_impl(&dword_206568000, v14, OS_LOG_TYPE_DEFAULT, "%p preventing sleep for:%{public}@", (uint8_t *)&v17, 0x16u);
            }

            v1 = 0;
            goto LABEL_24;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v16 = *(_QWORD *)(v1 + 72);
            v17 = 134218498;
            v18 = v1;
            v19 = 2114;
            v20 = v1;
            v21 = 2048;
            v22 = v16;
            _os_log_impl(&dword_206568000, v14, OS_LOG_TYPE_INFO, "%p not preventing sleep with fire imminent for %{public}@ because leeway is too large: %fs", (uint8_t *)&v17, 0x20u);
          }

        }
LABEL_23:
        v1 = 1;
LABEL_24:
        os_unfair_lock_unlock(v2);
        return v1;
      }
      if (!v8)
        goto LABEL_23;
      SWLogTimer();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

        objc_msgSend(*(id *)(v1 + 16), "cancelWake");
        goto LABEL_23;
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(v1 + 16), "isScheduled"))
        goto LABEL_23;
      SWLogTimer();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        goto LABEL_22;
    }
    v17 = 134218242;
    v18 = v1;
    v19 = 2114;
    v20 = v1;
    _os_log_debug_impl(&dword_206568000, v4, OS_LOG_TYPE_DEBUG, "%p unscheduled, cancelling wake %{public}@", (uint8_t *)&v17, 0x16u);
    goto LABEL_22;
  }
  return v1;
}

- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id lock_handler;
  NSObject *v17;
  void *v18;
  id v19;
  objc_class *v20;
  SWWakingTimer *v21;
  void *v22;
  id v23;
  objc_class *v24;
  SWWakingTimer *v25;
  _QWORD v26[4];
  id v27;
  _BYTE location[12];
  __int16 v29;
  SWWakingTimer *v30;
  __int16 v31;
  SWWakingTimer *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v19;
      v29 = 2114;
      v30 = v21;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("SWWakingTimer.m");
      v35 = 1024;
      v36 = 116;
      v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x206570C90);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BEC0]), "initWithIdentifier:", self->_identifier);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot schedule after invalidating"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v23;
      v29 = 2114;
      v30 = v25;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("SWWakingTimer.m");
      v35 = 1024;
      v36 = 121;
      v37 = 2114;
      v38 = v22;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x206570D84);
  }
  -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
  objc_storeStrong((id *)&self->_lock_timer, v14);
  v15 = (void *)MEMORY[0x20BCF9118](v13);
  lock_handler = self->_lock_handler;
  self->_lock_handler = v15;

  -[SWWakingTimer _lock_setPreventSleepAssertion:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  SWLogTimer();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134218242;
    *(_QWORD *)&location[4] = self;
    v29 = 2114;
    v30 = self;
    _os_log_debug_impl(&dword_206568000, v17, OS_LOG_TYPE_DEBUG, "%p scheduling %{public}@", location, 0x16u);
  }

  objc_initWeak((id *)location, self);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __62__SWWakingTimer_scheduleForDate_leewayInterval_queue_handler___block_invoke;
  v26[3] = &unk_24BF27F48;
  objc_copyWeak(&v27, (id *)location);
  objc_msgSend(v14, "scheduleForDate:leewayInterval:queue:handler:", v11, v12, v26, a4);
  if (-[SWSystemSleepMonitor isSleepImminent](self->_sleepMonitor, "isSleepImminent"))
    -[SWWakingTimer _updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded]((uint64_t)self);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);

}

void __62__SWWakingTimer_scheduleForDate_leewayInterval_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[SWWakingTimer _timerFired:]((uint64_t)WeakRetained, v3);

}

- (void)_updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded
{
  id v2;

  if (a1)
  {
    if ((-[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)a1) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "acquireSystemActivityAssertionWithIdentifier:", *(_QWORD *)(a1 + 8));
      v2 = (id)objc_claimAutoreleasedReturnValue();
      -[SWWakingTimer _setPreventSleepAssertion:](a1, v2);

    }
  }
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SWWakingTimer _lock_cancel]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancel
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(void **)(a1 + 56);
    if (v2 && objc_msgSend(v2, "isScheduled"))
    {
      SWLogTimer();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = 134218242;
        v6 = a1;
        v7 = 2114;
        v8 = a1;
        _os_log_debug_impl(&dword_206568000, v3, OS_LOG_TYPE_DEBUG, "%p canceling %{public}@", (uint8_t *)&v5, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    -[SWWakingTimer _lock_setPreventSleepAssertion:](a1, 0);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  SWSystemSleepMonitor *sleepMonitor;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  -[SWWakingTimer _lock_cancel]((uint64_t)self);
  -[SWScheduledSystemWake invalidate](self->_scheduledWake, "invalidate");
  -[SWSystemSleepMonitor removeObserver:](self->_sleepMonitor, "removeObserver:", self);
  sleepMonitor = self->_sleepMonitor;
  self->_sleepMonitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, NSString *);

  v7 = (void (**)(id, uint64_t, NSString *))a4;
  v5 = -[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)self);
  v7[2](v7, v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWWakingTimer _setPreventSleepAssertion:]((uint64_t)self, v6);

}

- (void)_setPreventSleepAssertion:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if (*(_BYTE *)(a1 + 80))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
      SWLogTimer();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 134218242;
        v6 = a1;
        v7 = 2114;
        v8 = v3;
        _os_log_impl(&dword_206568000, v4, OS_LOG_TYPE_DEFAULT, "%p timer invalidated while taking power assertion, will invalidate it immediately %{public}@", (uint8_t *)&v5, 0x16u);
      }

      objc_msgSend(v3, "invalidate");
    }
    else
    {
      -[SWWakingTimer _lock_setPreventSleepAssertion:](a1, v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    }
  }

}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  -[SWWakingTimer _updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded]((uint64_t)self);
  v5[2]();

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_handler, 0);
  objc_storeStrong((id *)&self->_lock_timer, 0);
  objc_storeStrong((id *)&self->_preventSleepAssertion, 0);
  objc_storeStrong((id *)&self->_sleepAssertionProvider, 0);
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  objc_storeStrong((id *)&self->_scheduledWake, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
