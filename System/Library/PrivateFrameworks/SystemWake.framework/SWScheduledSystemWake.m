@implementation SWScheduledSystemWake

- (SWScheduledSystemWake)initWithIdentifier:(id)a3
{
  id v5;
  SWScheduledSystemWake *v6;
  SWScheduledSystemWake *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWScheduledSystemWake;
  v6 = -[SWScheduledSystemWake init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  SWScheduledSystemWake *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p must invalidate before dealloc : %@"), self, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("SWScheduledSystemWake.m");
      v18 = 1024;
      v19 = 44;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x206571734);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)SWScheduledSystemWake;
  -[SWScheduledSystemWake dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", self->_lock_wakeDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("wakeDate"));

  -[NSDate timeIntervalSinceNow](self->_lock_wakeDate, "timeIntervalSinceNow");
  v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("timeRemaining"), 1);
  v7 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("leeway"), 0, (double)self->_lock_leeway);
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isScheduled
{
  SWScheduledSystemWake *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_wakeDate != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)wakeTime
{
  os_unfair_lock_s *p_lock;
  NSDate *lock_wakeDate;
  double v5;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_wakeDate = self->_lock_wakeDate;
  if (lock_wakeDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](lock_wakeDate, "timeIntervalSinceReferenceDate");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)leeway
{
  os_unfair_lock_s *p_lock;
  NSDate *lock_wakeDate;
  double v5;
  int64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_wakeDate = self->_lock_wakeDate;
  if (lock_wakeDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](lock_wakeDate, "timeIntervalSinceReferenceDate");
    v6 = (uint64_t)v5;
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)scheduleWake:(double)a3 leeway:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSDate *v9;
  NSDate *v10;
  NSDate *lock_wakeDate;
  NSString *v12;
  void *v13;
  NSString *identifier;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *lock_wakeIdentifier;
  NSDate *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  double v24;
  NSObject *v25;
  void *v26;
  SWScheduledSystemWake *v27;
  objc_class *v28;
  SWScheduledSystemWake *v29;
  _QWORD block[4];
  id v31;
  SWScheduledSystemWake *v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  SWScheduledSystemWake *v36;
  __int16 v37;
  SWScheduledSystemWake *v38;
  __int16 v39;
  SWScheduledSystemWake *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p scheduled wake can not be rescheduled after invalidation : %@"), self, self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (SWScheduledSystemWake *)(id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (SWScheduledSystemWake *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v27;
      v37 = 2114;
      v38 = v29;
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = CFSTR("SWScheduledSystemWake.m");
      v43 = 1024;
      v44 = 84;
      v45 = 2114;
      v46 = v26;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x206571D24);
  }
  v9 = self->_lock_wakeDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_wakeDate = self->_lock_wakeDate;
  self->_lock_wakeDate = v10;

  self->_lock_leeway = a4;
  v12 = self->_lock_wakeIdentifier;
  v13 = (void *)MEMORY[0x24BDD17C8];
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%@"), identifier, v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  lock_wakeIdentifier = self->_lock_wakeIdentifier;
  self->_lock_wakeIdentifier = v17;

  v33[0] = CFSTR("scheduledby");
  v33[1] = CFSTR("time");
  v19 = self->_lock_wakeDate;
  v34[0] = self->_lock_wakeIdentifier;
  v34[1] = v19;
  v33[2] = CFSTR("leeway");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_lock_leeway);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SWScheduledSystemWake_scheduleWake_leeway___block_invoke;
  block[3] = &unk_24BF27F90;
  v23 = v21;
  v31 = v23;
  v32 = self;
  dispatch_async(v22, block);

  if (v9)
  {
    -[NSDate timeIntervalSinceDate:](self->_lock_wakeDate, "timeIntervalSinceDate:", v9);
    if (fabs(v24) < 1.0)
      goto LABEL_7;
  }
  SWLogTimer();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = self;
    v37 = 2114;
    v38 = self;
    _os_log_impl(&dword_206568000, v25, OS_LOG_TYPE_INFO, "%p scheduling system wake: %{public}@", buf, 0x16u);
  }

  if (v9)
LABEL_7:
    -[SWScheduledSystemWake _cancelWakeAtDate:identifier:]((uint64_t)self, v9, v12);
  os_unfair_lock_unlock(p_lock);

}

void __45__SWScheduledSystemWake_scheduleWake_leeway___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (IOPMRequestSysWake())
  {
    SWLogTimer();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134218242;
      v6 = v3;
      v7 = 2114;
      v8 = v4;
      _os_log_error_impl(&dword_206568000, v2, OS_LOG_TYPE_ERROR, "%p failed to request system wake:%{public}@", (uint8_t *)&v5, 0x16u);
    }

  }
}

- (void)_cancelWakeAtDate:(void *)a3 identifier:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__SWScheduledSystemWake__cancelWakeAtDate_identifier___block_invoke;
    block[3] = &unk_24BF27FB8;
    v9 = v5;
    v10 = v6;
    v11 = a1;
    dispatch_async(v7, block);

  }
}

- (void)cancelWake
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  NSDate *lock_wakeDate;
  NSDate *v6;
  NSString *lock_wakeIdentifier;
  int v8;
  SWScheduledSystemWake *v9;
  __int16 v10;
  SWScheduledSystemWake *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_wakeDate)
  {
    SWLogTimer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_206568000, v4, OS_LOG_TYPE_INFO, "%p canceling system wake: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    lock_wakeDate = self->_lock_wakeDate;
    if (lock_wakeDate)
    {
      -[SWScheduledSystemWake _cancelWakeAtDate:identifier:]((uint64_t)self, lock_wakeDate, self->_lock_wakeIdentifier);
      v6 = self->_lock_wakeDate;
      self->_lock_wakeDate = 0;

      lock_wakeIdentifier = self->_lock_wakeIdentifier;
      self->_lock_wakeIdentifier = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  -[SWScheduledSystemWake cancelWake](self, "cancelWake");
}

void __54__SWScheduledSystemWake__cancelWakeAtDate_identifier___block_invoke(uint64_t a1)
{
  IOReturn v2;
  IOReturn v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  IOReturn v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = IOPMCancelScheduledPowerEvent(*(CFDateRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), CFSTR("wake"));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SWLogTimer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v4, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", *(_QWORD *)(a1 + 32));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
      objc_msgSend(v4, "formatDuration:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134219010;
      v11 = v7;
      v12 = 1024;
      v13 = v3;
      v14 = 2114;
      v15 = v6;
      v16 = 2114;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_206568000, v5, OS_LOG_TYPE_ERROR, "%p failed (%d) to cancel system wake id:%{public}@ date:%{public}@ (in %{public}@", (uint8_t *)&v10, 0x30u);

    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock_wakeIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_wakeDate, 0);
}

@end
