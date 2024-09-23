@implementation SWSystemSleepMonitor

+ (id)monitorUsingMainQueue
{
  if (qword_253DA1578 != -1)
    dispatch_once(&qword_253DA1578, &__block_literal_global);
  return (id)_MergedGlobals;
}

void __45__SWSystemSleepMonitor_monitorUsingMainQueue__block_invoke()
{
  SWSystemSleepMonitor *v0;
  id v1;
  SWSystemSleepMonitorProvider *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = [SWSystemSleepMonitor alloc];
  v1 = MEMORY[0x24BDAC9B8];
  v2 = objc_alloc_init(SWSystemSleepMonitorProvider);
  +[SWSystemSleepAssertionProvider sharedProvider](SWSystemSleepAssertionProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SWSystemSleepMonitor initWithIdentifier:queue:allowsInvalidation:monitorProvider:sleepAssertionProvider:](v0, "initWithIdentifier:queue:allowsInvalidation:monitorProvider:sleepAssertionProvider:", CFSTR("SWSystemSleepMonitor-mainQueue"), MEMORY[0x24BDAC9B8], 0, v2, v3);
  v5 = (void *)_MergedGlobals;
  _MergedGlobals = v4;

}

- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SWSystemSleepMonitorProvider *v8;
  void *v9;
  SWSystemSleepMonitor *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SWSystemSleepMonitorProvider);
  +[SWSystemSleepAssertionProvider sharedProvider](SWSystemSleepAssertionProvider, "sharedProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SWSystemSleepMonitor initWithIdentifier:queue:allowsInvalidation:monitorProvider:sleepAssertionProvider:](self, "initWithIdentifier:queue:allowsInvalidation:monitorProvider:sleepAssertionProvider:", v6, v7, 1, v8, v9);

  return v10;
}

- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4 allowsInvalidation:(BOOL)a5 monitorProvider:(id)a6 sleepAssertionProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  SWSystemSleepMonitor *v16;
  SWSystemSleepMonitor *v17;
  uint64_t v18;
  NSHashTable *lock_observers;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SWSystemSleepMonitor;
  v16 = -[SWSystemSleepMonitor init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_allowsInvalidation = a5;
    objc_storeStrong((id *)&v17->_queue, a4);
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v18 = objc_claimAutoreleasedReturnValue();
    lock_observers = v17->_lock_observers;
    v17->_lock_observers = (NSHashTable *)v18;

    objc_storeStrong((id *)&v17->_sleepAssertionProvider, a7);
    objc_storeStrong((id *)&v17->_monitorProvider, a6);
    objc_msgSend(v14, "registerForSystemPowerOnQueue:withDelegate:", v13, v17);
  }

  return v17;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mach_continuous_time();
  v5 = self->_state - 1;
  if (v5 > 4)
    v6 = CFSTR("waking");
  else
    v6 = off_24BF27E10[v5];
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("state"));
  BSTimeDifferenceFromMachTimeToMachTime();
  v7 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("elapsedState"), 1);
  NSStringForSWSystemSleepPowerManagementPhase(self->_powerManagementPhase);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("phase"));

  BSTimeDifferenceFromMachTimeToMachTime();
  v9 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("elapsedPhase"), 1);
  v10 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_lock_observers, "count"), CFSTR("observerCount"));
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)hasSleepBeenRequested
{
  SWSystemSleepMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state > 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSleepImminent
{
  SWSystemSleepMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state > 3;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (SWSystemSleepMonitorAggregateState)aggregateState
{
  os_unfair_lock_s *p_lock;
  SWSystemSleepMonitorAggregateState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[SWSystemSleepMonitorAggregateState initWithSleepMonitorState:stateTimestamp:powerManagementPhase:phaseTimestamp:]([SWSystemSleepMonitorAggregateState alloc], "initWithSleepMonitorState:stateTimestamp:powerManagementPhase:phaseTimestamp:", self->_state, self->_stateTimestamp, self->_powerManagementPhase, self->_powerManagementPhaseTimestamp);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  SWSystemSleepMonitorProviding *monitorProvider;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  SWSystemSleepMonitor *v15;
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
  if (!self->_allowsInvalidation)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_allowsInvalidation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("SWSystemSleepMonitor.m");
      v18 = 1024;
      v19 = 111;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656A3BCLL);
  }
  os_unfair_lock_unlock(p_lock);
  -[SWSystemSleepMonitorProviding invalidate](self->_monitorProvider, "invalidate");
  monitorProvider = self->_monitorProvider;
  self->_monitorProvider = 0;

}

- (void)setSleepSlate:(uint64_t)a3 powerManagementPhase:(uint64_t)a4 notificationID:
{
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v9 = mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v11 = v10;
    BSTimeDifferenceFromMachTimeToMachTime();
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 88);
    SWLogPower();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = a4;
      NSStringForSWSystemSleepPowerManagementPhase(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringForSWSystemSleepPowerManagementPhase(v15);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if ((unint64_t)(v14 - 1) > 4)
        v20 = CFSTR("waking");
      else
        v20 = off_24BF27E10[v14 - 1];
      if ((unint64_t)(a2 - 1) > 3)
        v21 = CFSTR("waking");
      else
        v21 = off_24BF27DD0[a2 - 1];
      *(_DWORD *)buf = 134220290;
      v24 = a1;
      v25 = 2114;
      v26 = v17;
      v27 = 1024;
      v28 = a3;
      v29 = 2114;
      v30 = v18;
      v31 = 1024;
      v32 = v15;
      v33 = 2048;
      v34 = v11;
      v35 = 2114;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      v39 = 2048;
      v40 = v13;
      v41 = 2048;
      v42 = v22;
      _os_log_impl(&dword_206568000, v16, OS_LOG_TYPE_DEFAULT, "%p systemPowerChanged:%{public}@(%u) previous:%{public}@(%u) elapsedPhase:%.3lfs state:%{public}@->%{public}@ elapsedState:%.3lfs notificationID:%p", buf, 0x5Eu);

    }
    *(_QWORD *)(a1 + 80) = a2;
    *(_QWORD *)(a1 + 88) = a3;
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v9;
    os_unfair_lock_unlock(v8);
  }
}

- (void)setSleepSlate:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v5 = mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 80);
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v8 - 1) > 4)
        v10 = CFSTR("waking");
      else
        v10 = off_24BF27E10[v8 - 1];
      if ((unint64_t)(a2 - 2) > 3)
        v11 = CFSTR("waking");
      else
        v11 = off_24BF27DF0[a2 - 2];
      v12 = 134218754;
      v13 = a1;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2048;
      v19 = v7;
      _os_log_impl(&dword_206568000, v9, OS_LOG_TYPE_DEFAULT, "%p state:%{public}@->%{public}@ elapsed:%.3lfs", (uint8_t *)&v12, 0x2Au);
    }

    *(_QWORD *)(a1 + 80) = a2;
    *(_QWORD *)(a1 + 64) = v5;
    os_unfair_lock_unlock(v4);
  }
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[32];
  SWSystemSleepMonitor *v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 3, a3, (uint64_t)a4);
      if (self)
      {
        SWLogPower();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          _os_log_debug_impl(&dword_206568000, v8, OS_LOG_TYPE_DEBUG, "%p sleepRequestedWithNotificationID:%ld", buf, 0x16u);
        }

        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke;
        *(_QWORD *)&buf[24] = &unk_24BF27BE0;
        v26 = self;
        v27 = a4;
        *(_QWORD *)&v21 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v21 + 1) = 3221225472;
        *(_QWORD *)&v22 = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_29;
        *((_QWORD *)&v22 + 1) = &unk_24BF27C08;
        *(_QWORD *)&v23 = self;
        *((_QWORD *)&v23 + 1) = a4;
        -[SWSystemSleepMonitor observersOfSelector:performObserverBlock:completion:]((uint64_t)self, sel_systemSleepMonitor_sleepRequestedWithResult_, buf, &v21);
      }
      break;
    case 1u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 4, a3, (uint64_t)a4);
      if (self)
      {
        SWLogPower();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a4;
          _os_log_debug_impl(&dword_206568000, v9, OS_LOG_TYPE_DEBUG, "%p prepareForSleepWithNotificationID:%ld", buf, 0x16u);
        }

        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke;
        *(_QWORD *)&buf[24] = &unk_24BF27BE0;
        v26 = self;
        v27 = a4;
        *(_QWORD *)&v21 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v21 + 1) = 3221225472;
        *(_QWORD *)&v22 = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_34;
        *((_QWORD *)&v22 + 1) = &unk_24BF27C08;
        *(_QWORD *)&v23 = self;
        *((_QWORD *)&v23 + 1) = a4;
        -[SWSystemSleepMonitor observersOfSelector:performObserverBlock:completion:]((uint64_t)self, sel_systemSleepMonitor_prepareForSleepWithCompletion_, buf, &v21);
      }
      break;
    case 2u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 1, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorSleepRequestAborted_);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "systemSleepMonitorSleepRequestAborted:", self, (_QWORD)v21);
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
          }
          while (v11);
        }
        goto LABEL_39;
      }
      break;
    case 9u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 1, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorDidWakeFromSleep_);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "systemSleepMonitorDidWakeFromSleep:", self, (_QWORD)v21);
            }
            v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
          }
          while (v15);
        }
        goto LABEL_39;
      }
      break;
    case 0xBu:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 0, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorWillWakeFromSleep_);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v22;
          do
          {
            for (k = 0; k != v18; ++k)
            {
              if (*(_QWORD *)v22 != v19)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * k), "systemSleepMonitorWillWakeFromSleep:", self, (_QWORD)v21);
            }
            v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
          }
          while (v18);
        }
LABEL_39:

      }
      break;
    default:
      SWLogPower();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a3;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = a4;
        _os_log_error_impl(&dword_206568000, v14, OS_LOG_TYPE_ERROR, "%p unexpected powerChangedMessage:%u notificationID:%p", buf, 0x1Cu);
      }

      break;
  }
}

void __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SWLogPower();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v19 = v12;
    v20 = 2114;
    v21 = v5;
    v22 = 2048;
    v23 = v13;
    _os_log_debug_impl(&dword_206568000, v7, OS_LOG_TYPE_DEBUG, "%p sleepRequested observer:%{public}@ notificationID:%ld", buf, 0x20u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_26;
  v14[3] = &unk_24BF27BB8;
  v14[4] = v8;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v9;
  v17 = v10;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "systemSleepMonitor:sleepRequestedWithResult:", v8, v14);

}

id __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_26(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  _BYTE v20[28];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SWLogPower();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    v12 = a1[5];
    v13 = a1[7];
    v17 = 134218754;
    v18 = v11;
    v19 = 1024;
    *(_DWORD *)v20 = a2;
    *(_WORD *)&v20[4] = 2114;
    *(_QWORD *)&v20[6] = v12;
    *(_WORD *)&v20[14] = 2048;
    *(_QWORD *)&v20[16] = v13;
    _os_log_debug_impl(&dword_206568000, v6, OS_LOG_TYPE_DEBUG, "%p sleepRequested response allowSystemSleep:%{BOOL}u observer:%{public}@ notificationID:%ld", (uint8_t *)&v17, 0x26u);
  }

  if ((a2 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 32), "acquirePreventSystemSleepAssertionWithIdentifier:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = a1[4];
      v15 = a1[5];
      v16 = a1[7];
      v17 = 134218754;
      v18 = v14;
      v19 = 2112;
      *(_QWORD *)v20 = v8;
      *(_WORD *)&v20[8] = 2114;
      *(_QWORD *)&v20[10] = v15;
      *(_WORD *)&v20[18] = 2048;
      *(_QWORD *)&v20[20] = v16;
      _os_log_debug_impl(&dword_206568000, v9, OS_LOG_TYPE_DEBUG, "%p sleepRequested response assertion:%{BOOL}@ observer:%{public}@ notificationID:%ld", (uint8_t *)&v17, 0x2Au);
    }

    v7 = (void *)v8;
  }
  (*(void (**)(void))(a1[6] + 16))();

  return v7;
}

uint64_t __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_29(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  SWLogPower();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 134218496;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 2048;
    v14 = v8;
    _os_log_debug_impl(&dword_206568000, v4, OS_LOG_TYPE_DEBUG, "%p sleepRequested preventSystemSleep:%{BOOL}u notificationID:%ld", (uint8_t *)&v9, 0x1Cu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return objc_msgSend(*(id *)(v5 + 24), "allowPowerChange:", *(_QWORD *)(a1 + 40));
  -[SWSystemSleepMonitor setSleepSlate:](v5, 2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelPowerChange:", *(_QWORD *)(a1 + 40));
}

- (void)observersOfSelector:(void *)a3 performObserverBlock:(void *)a4 completion:
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  void *v24;
  uint64_t v25;
  void (**v26)(id, uint64_t, _QWORD *);
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  const char *v35;
  _QWORD v36[3];
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[8];
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 56) + 1;
  *(_QWORD *)(a1 + 56) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke;
  v43[3] = &unk_24BF27C58;
  v43[4] = a1;
  v25 = v8;
  v45 = v8;
  v21 = v7;
  v44 = v21;
  v46 = a2;
  v52 = (id)MEMORY[0x20BCF9118](v43);
  -[SWSystemSleepMonitor observersRespondingToSelector:](a1, (uint64_t)a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v9 = (void *)MEMORY[0x24BE0BDC0];
    v10 = *(_QWORD *)(a1 + 8);
    v11 = objc_msgSend(v22, "count");
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_38;
    v42[3] = &unk_24BF27C80;
    v42[4] = a1;
    v42[5] = &v47;
    v42[6] = v8;
    v42[7] = a2;
    objc_msgSend(v9, "sentinelWithQueue:signalCount:signalHandler:", v10, v11, v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v22;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2020000000;
          v37 = 0;
          v16 = objc_alloc(MEMORY[0x24BE0BE98]);
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("response from <%@: %p> must be made exactly once"), objc_opt_class(), v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v16, "initWithIdentifier:forReason:invalidationBlock:", v17, v18, &__block_literal_global_47);

          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_2;
          v27[3] = &unk_24BF27CE8;
          v20 = v19;
          v28 = v20;
          v29 = a1;
          v33 = sel_observersOfSelector_performObserverBlock_completion_;
          v34 = v25;
          v35 = a2;
          v32 = v36;
          v30 = v15;
          v31 = v24;
          v26[2](v26, v15, v27);

          _Block_object_dispose(v36, 8);
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v12);
    }

  }
  else
  {
    (*(void (**)(void))(v48[5] + 16))();
  }

  _Block_object_dispose(&v47, 8);
}

void __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  SWLogPower();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v19 = v12;
    v20 = 2114;
    v21 = v5;
    v22 = 2048;
    v23 = v13;
    _os_log_debug_impl(&dword_206568000, v7, OS_LOG_TYPE_DEBUG, "%p prepareForSleep observer:%{public}@ notificationID:%ld", buf, 0x20u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_33;
  v14[3] = &unk_24BF27C30;
  v14[4] = v8;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v9;
  v17 = v10;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "systemSleepMonitor:prepareForSleepWithCompletion:", v8, v14);

}

uint64_t __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_33(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  SWLogPower();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[7];
    v7 = 134218498;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    _os_log_debug_impl(&dword_206568000, v2, OS_LOG_TYPE_DEBUG, "%p prepareForSleep response observer:%{public}@ notificationID:%ld", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SWLogPower();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_debug_impl(&dword_206568000, v2, OS_LOG_TYPE_DEBUG, "%p prepareForSleep complete notificationID:%ld", (uint8_t *)&v6, 0x16u);
  }

  -[SWSystemSleepMonitor setSleepSlate:](*(_QWORD *)(a1 + 32), 5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allowPowerChange:", *(_QWORD *)(a1 + 40));
}

void __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  if (v4 == v6)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
  }
  else
  {
    SWLogPower();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218754;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      v15 = 1024;
      v16 = a2 ^ 1;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_206568000, v7, OS_LOG_TYPE_DEFAULT, "%p (%llu) final response(%{BOOL}u) to %{public}@ came too late", (uint8_t *)&v11, 0x26u);

    }
  }
}

- (id)observersRespondingToSelector:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__SWSystemSleepMonitor_observersRespondingToSelector___block_invoke;
  v9[3] = &__block_descriptor_40_e40_B32__0___SWSystemSleepObserver__8Q16_B24l;
  v9[4] = a2;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (!objc_msgSend(v3, "isComplete"))
      goto LABEL_12;
    v5 = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  else
  {
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218754;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      v17 = 1024;
      v18 = v5 ^ 1;
      v19 = 2114;
      v20 = v12;
      _os_log_debug_impl(&dword_206568000, v9, OS_LOG_TYPE_DEBUG, "%p (%llu) response(%{BOOL}u) to %{public}@ after early completion", (uint8_t *)&v13, 0x26u);

    }
  }
LABEL_12:

}

uint64_t __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  unsigned __int8 *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BYTE v26[24];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  do
    v5 = __ldxr(v4);
  while (__stxr(1u, v4));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!hadBeenCalled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      v22 = v17;
      v23 = 2114;
      v24 = v19;
      v25 = 2048;
      *(_QWORD *)v26 = v20;
      *(_WORD *)&v26[8] = 2114;
      *(_QWORD *)&v26[10] = CFSTR("SWSystemSleepMonitor.m");
      *(_WORD *)&v26[18] = 1024;
      *(_DWORD *)&v26[20] = 291;
      v27 = 2114;
      v28 = v16;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656BF24);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(v7 + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
  if (v6 != v8)
  {
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 40);
      v13 = *(void **)(a1 + 80);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134219010;
      v22 = v12;
      v23 = 2048;
      v24 = v13;
      v25 = 1024;
      *(_DWORD *)v26 = a2 ^ 1;
      *(_WORD *)&v26[4] = 2114;
      *(_QWORD *)&v26[6] = v14;
      *(_WORD *)&v26[14] = 2114;
      *(_QWORD *)&v26[16] = v15;
      _os_log_error_impl(&dword_206568000, v9, OS_LOG_TYPE_ERROR, "%p (%llu) response(%{BOOL}u to %{public}@ from:%{public}@ came too late", buf, 0x30u);

    }
  }
  v10 = *(void **)(a1 + 56);
  if (a2)
    return objc_msgSend(v10, "signalWithContext:", MEMORY[0x24BDBD1C8]);
  else
    return objc_msgSend(v10, "signal");
}

- (void)addObserver:(id)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  SWSystemSleepMonitor *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer != nil"));
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
      v17 = CFSTR("SWSystemSleepMonitor.m");
      v18 = 1024;
      v19 = 332;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656C0E8);
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  SWSystemSleepMonitor *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer != nil"));
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
      v17 = CFSTR("SWSystemSleepMonitor.m");
      v18 = 1024;
      v19 = 339;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656C2B4);
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v9);
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __54__SWSystemSleepMonitor_observersRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_sleepAssertionProvider, 0);
  objc_storeStrong((id *)&self->_monitorProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
