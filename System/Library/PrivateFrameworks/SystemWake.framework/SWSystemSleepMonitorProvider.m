@implementation SWSystemSleepMonitorProvider

- (SWSystemSleepMonitorProvider)init
{
  SWSystemSleepMonitorProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SWSystemSleepMonitorProvider;
  result = -[SWSystemSleepMonitorProvider init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)registerForSystemPowerOnQueue:(id)a3 withDelegate:(id)a4
{
  NSObject *v8;
  SWSystemSleepMonitorProvider *v9;
  BSZeroingWeakReference *v10;
  BSZeroingWeakReference *lock_weakDelegateWrapper;
  io_connect_t v12;
  NSObject *v13;
  const __CFString *lock_systemPowerConnection;
  IONotificationPort *lock_systemPowerPort;
  uint64_t lock_systemPowerNotifier;
  void *v17;
  SWSystemSleepMonitorProvider *v18;
  objc_class *v19;
  NSObject *v20;
  void *v21;
  SWSystemSleepMonitorProvider *v22;
  objc_class *v23;
  NSObject *v24;
  uint8_t buf[4];
  SWSystemSleepMonitorProvider *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  SWSystemSleepMonitorProvider *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  _BYTE v34[18];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (SWSystemSleepMonitorProvider *)a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_registered)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_registered"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (SWSystemSleepMonitorProvider *)(id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v18;
      v27 = 2114;
      v28 = v20;
      v29 = 2048;
      v30 = self;
      v31 = 2114;
      v32 = CFSTR("SWSystemSleepMonitor.m");
      v33 = 1024;
      *(_DWORD *)v34 = 380;
      *(_WORD *)&v34[4] = 2114;
      *(_QWORD *)&v34[6] = v17;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656C638);
  }
  objc_storeStrong((id *)&self->_lock_queue, a3);
  self->_lock_registered = 1;
  objc_msgSend(MEMORY[0x24BE0BED8], "referenceWithObject:", v9);
  v10 = (BSZeroingWeakReference *)objc_claimAutoreleasedReturnValue();
  lock_weakDelegateWrapper = self->_lock_weakDelegateWrapper;
  self->_lock_weakDelegateWrapper = v10;

  v12 = IORegisterForSystemPower(self->_lock_weakDelegateWrapper, &self->_lock_systemPowerPort, (IOServiceInterestCallback)SWSystemPowerCallback, &self->_lock_systemPowerNotifier);
  self->_lock_systemPowerConnection = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_systemPowerConnection != IO_OBJECT_NULL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (SWSystemSleepMonitorProvider *)(id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      v27 = 2114;
      v28 = v24;
      v29 = 2048;
      v30 = self;
      v31 = 2114;
      v32 = CFSTR("SWSystemSleepMonitor.m");
      v33 = 1024;
      *(_DWORD *)v34 = 390;
      *(_WORD *)&v34[4] = 2114;
      *(_QWORD *)&v34[6] = v21;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656C738);
  }
  IONotificationPortSetDispatchQueue(self->_lock_systemPowerPort, v8);
  SWLogPower();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    lock_systemPowerConnection = (const __CFString *)self->_lock_systemPowerConnection;
    lock_systemPowerPort = self->_lock_systemPowerPort;
    lock_systemPowerNotifier = self->_lock_systemPowerNotifier;
    *(_DWORD *)buf = 134219264;
    v26 = self;
    v27 = 2048;
    v28 = v8;
    v29 = 2048;
    v30 = v9;
    v31 = 2048;
    v32 = lock_systemPowerConnection;
    v33 = 2048;
    *(_QWORD *)v34 = lock_systemPowerPort;
    *(_WORD *)&v34[8] = 2048;
    *(_QWORD *)&v34[10] = lock_systemPowerNotifier;
    _os_log_debug_impl(&dword_206568000, v13, OS_LOG_TYPE_DEBUG, "%p registerForSystemPowerOnQueue:%p withDelegate:%p -- connection:%llu port:%llu notifier:%llu", buf, 0x3Eu);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  BSZeroingWeakReference *v5;
  NSObject *lock_queue;
  BSZeroingWeakReference *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  objc_super v12;
  _QWORD block[4];
  BSZeroingWeakReference *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  SWSystemSleepMonitorProvider *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_invalidated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("SWSystemSleepMonitor.m");
      v23 = 1024;
      v24 = 406;
      v25 = 2114;
      v26 = v8;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656CAA4);
  }
  v5 = self->_lock_weakDelegateWrapper;
  os_unfair_lock_unlock(p_lock);
  lock_queue = self->_lock_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SWSystemSleepMonitorProvider_dealloc__block_invoke;
  block[3] = &unk_24BF27D30;
  v14 = v5;
  v7 = v5;
  dispatch_async(lock_queue, block);

  v12.receiver = self;
  v12.super_class = (Class)SWSystemSleepMonitorProvider;
  -[SWSystemSleepMonitorProvider dealloc](&v12, sel_dealloc);
}

id __39__SWSystemSleepMonitorProvider_dealloc__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "object");
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_invalidated;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *lock_systemPowerConnection;
  IONotificationPort *lock_systemPowerPort;
  uint64_t lock_systemPowerNotifier;
  int v13;
  SWSystemSleepMonitorProvider *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  IONotificationPort *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_invalidated = self->_lock_invalidated;
  self->_lock_invalidated = 1;
  if (!lock_invalidated)
  {
    SWLogPower();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lock_systemPowerConnection = (void *)self->_lock_systemPowerConnection;
      lock_systemPowerPort = self->_lock_systemPowerPort;
      lock_systemPowerNotifier = self->_lock_systemPowerNotifier;
      v13 = 134218752;
      v14 = self;
      v15 = 2048;
      v16 = lock_systemPowerConnection;
      v17 = 2048;
      v18 = lock_systemPowerPort;
      v19 = 2048;
      v20 = lock_systemPowerNotifier;
      _os_log_debug_impl(&dword_206568000, v5, OS_LOG_TYPE_DEBUG, "%p unregisterForSystemPower -- connection:%llu port:%llu notifier:%llu", (uint8_t *)&v13, 0x2Au);
    }

    IODeregisterForSystemPower(&self->_lock_systemPowerNotifier);
    IONotificationPortDestroy(self->_lock_systemPowerPort);
    IOServiceClose(self->_lock_systemPowerConnection);
    self->_lock_systemPowerConnection = 0;
    SWLogPower();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      -[BSZeroingWeakReference object](self->_lock_weakDelegateWrapper, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SWLogPower();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = 134218240;
        v14 = self;
        v15 = 2048;
        v16 = v8;
        _os_log_debug_impl(&dword_206568000, v9, OS_LOG_TYPE_DEBUG, "%p invalidated sleep monitor: %p", (uint8_t *)&v13, 0x16u);
      }

    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)allowPowerChange:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SWSystemSleepMonitorProvider *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_invalidated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("SWSystemSleepMonitor.m");
      v19 = 1024;
      v20 = 437;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656CE4CLL);
  }
  IOAllowPowerChange(self->_lock_systemPowerConnection, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelPowerChange:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SWSystemSleepMonitorProvider *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_invalidated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("SWSystemSleepMonitor.m");
      v19 = 1024;
      v20 = 444;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656CFFCLL);
  }
  IOCancelPowerChange(self->_lock_systemPowerConnection, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_weakDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
}

@end
