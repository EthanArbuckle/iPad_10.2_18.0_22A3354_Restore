@implementation SWPreventSystemSleepAssertion

+ (id)sharedHighPriorityQueue
{
  if (qword_253DA15B0 != -1)
    dispatch_once(&qword_253DA15B0, &__block_literal_global_2);
  return (id)qword_253DA15A8;
}

void __56__SWPreventSystemSleepAssertion_sharedHighPriorityQueue__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  inactive = dispatch_workloop_create_inactive("SWPreventSystemSleepAssertion workloop");
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)_MergedGlobals_2);
  v2 = dispatch_queue_create_with_target_V2("SWPreventSystemSleepAssertionQueue", 0, (dispatch_queue_t)_MergedGlobals_2);
  v3 = (void *)qword_253DA15A8;
  qword_253DA15A8 = (uint64_t)v2;

}

- (SWPreventSystemSleepAssertion)initWithIdentifier:(id)a3
{
  id v4;
  SWPreventSystemSleepAssertion *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWPreventSystemSleepAssertion;
  v5 = -[SWPreventSystemSleepAssertion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    *(_QWORD *)&v5->_lock_assertionID = 0;
    v5->_lock_timeoutTime = 0.0;
    v5->_invalidated = 0;
    v5->_lock_state = 0;
  }

  return v5;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  id v7;
  unint64_t lock_state;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  double v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  SWPreventSystemSleepAssertion *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  if (lock_state)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SWPreventSystemSleepAssertion:%p id:%@ state:%u can only be acquired once"), self, self->_identifier, lock_state);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v19 = v12;
      v20 = 2114;
      v21 = v14;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = CFSTR("SWPreventSystemSleepAssertion.m");
      v26 = 1024;
      v27 = 69;
      v28 = 2114;
      v29 = v11;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20657272CLL);
  }
  self->_lock_state = 1;
  os_unfair_lock_unlock(&self->_lock);
  +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SWPreventSystemSleepAssertion_acquireWithTimeout_handler___block_invoke;
  block[3] = &unk_24BF27E88;
  v17 = a3;
  block[4] = self;
  v16 = v7;
  v10 = v7;
  dispatch_async(v9, block);

}

void __60__SWPreventSystemSleepAssertion_acquireWithTimeout_handler___block_invoke(uint64_t a1)
{
  double v1;
  uint64_t v2;
  void (**v3)(id, uint64_t);
  uint64_t v4;
  void *v5;
  const __CFDictionary *v6;
  IOReturn v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v1 = *(double *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void (**)(id, uint64_t))*(id *)(a1 + 40);
  if (!v2)
    goto LABEL_23;
  AssertionID = 0;
  if (v1 <= 0.0)
  {
    v7 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, *(CFStringRef *)(v2 + 8), &AssertionID);
  }
  else
  {
    v24[0] = CFSTR("AssertType");
    v24[1] = CFSTR("AssertName");
    v4 = *(_QWORD *)(v2 + 8);
    v25[0] = CFSTR("NoIdleSleepAssertion");
    v25[1] = v4;
    v24[2] = CFSTR("TimeoutSeconds");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = CFSTR("TimeoutAction");
    v25[2] = v5;
    v25[3] = CFSTR("TimeoutActionRelease");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v7 = IOPMAssertionCreateWithProperties(v6, &AssertionID);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  v8 = *(_QWORD *)(v2 + 32);
  if (v8 != 3)
  {
    if (!v7)
    {
      *(_DWORD *)(v2 + 16) = AssertionID;
      *(_QWORD *)(v2 + 32) = 2;
      if (v1 > 0.0)
      {
        BSContinuousMachTimeNow();
        *(double *)(v2 + 24) = v1 + v12;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
      SWLogPower();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(v2 + 8);
        *(_DWORD *)buf = 134218498;
        v19 = v2;
        v20 = 2114;
        v21 = v13;
        v22 = 1024;
        LODWORD(v23) = AssertionID;
        _os_log_impl(&dword_206568000, v9, OS_LOG_TYPE_INFO, "%p power assertion taken identifier:%{public}@ id:%d", buf, 0x1Cu);
      }
      goto LABEL_12;
    }
    *(_QWORD *)(v2 + 32) = 3;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
LABEL_9:
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(v2 + 8);
      *(_DWORD *)buf = 134218498;
      v19 = v2;
      v20 = 2048;
      v21 = v7;
      v22 = 2114;
      v23 = v16;
      _os_log_error_impl(&dword_206568000, v9, OS_LOG_TYPE_ERROR, "%p error:%ld creating power assertion identifier:%{public}@", buf, 0x20u);
    }
    v10 = 0;
LABEL_12:

    v11 = v8 == 3;
    if (!v3)
      v11 = 1;
    if (!v11)
      v3[2](v3, v10);
    goto LABEL_23;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  if (v7)
    goto LABEL_9;
  SWLogPower();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(v2 + 8);
    *(_DWORD *)buf = 134218498;
    v19 = v2;
    v20 = 2112;
    v21 = v15;
    v22 = 1024;
    LODWORD(v23) = AssertionID;
    _os_log_impl(&dword_206568000, v14, OS_LOG_TYPE_DEFAULT, "%p power assertion take complete after invalidation, will release immediately, identifier:%@ id:%d", buf, 0x1Cu);
  }

  IOPMAssertionRelease(AssertionID);
LABEL_23:

}

- (BOOL)isActive
{
  os_unfair_lock_s *p_lock;
  double v4;
  BOOL v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_assertionID)
  {
    if (self->_lock_timeoutTime == 0.0)
    {
      v5 = 1;
    }
    else
    {
      BSContinuousMachTimeNow();
      v5 = v4 < self->_lock_timeoutTime;
    }
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  unsigned int lock_assertionID;
  unint64_t lock_state;
  double v7;
  double v8;
  double lock_timeoutTime;
  NSObject *v10;
  NSString *v11;
  NSObject *v12;
  NSString *identifier;
  const char *v14;
  NSString *v15;
  void *v16;
  SWPreventSystemSleepAssertion *v17;
  objc_class *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  _QWORD block[4];
  unsigned int v23;
  uint8_t buf[4];
  SWPreventSystemSleepAssertion *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  SWPreventSystemSleepAssertion *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_assertionID = self->_lock_assertionID;
  self->_lock_assertionID = 0;
  lock_state = self->_lock_state;
  self->_lock_state = 3;
  if (!lock_assertionID)
  {
    os_unfair_lock_unlock(p_lock);
    switch(lock_state)
    {
      case 0uLL:
        SWLogPower();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = identifier;
        v14 = "%p invalidated power assertion before starting acquisition identifier:%{public}@";
        goto LABEL_23;
      case 1uLL:
        SWLogPower();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        v20 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v20;
        v14 = "%p invalidated power assertion during acquisition identifier:%{public}@";
        goto LABEL_23;
      case 2uLL:
        if (self->_lock_state == 2)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SWPreventSystemSleepAssertion:%p id:%@ state:%u acquired but assertionID null before invalidation"), self, self->_identifier, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v17 = (SWPreventSystemSleepAssertion *)(id)objc_claimAutoreleasedReturnValue();
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v25 = v17;
            v26 = 2114;
            v27 = v19;
            v28 = 2048;
            v29 = self;
            v30 = 2114;
            v31 = CFSTR("SWPreventSystemSleepAssertion.m");
            v32 = 1024;
            v33 = 177;
            v34 = 2114;
            v35 = v16;
            _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x206572EB4);
        }
        return;
      case 3uLL:
        SWLogPower();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        v21 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v21;
        v14 = "%p already invalidated power assertion identifier:%{public}@";
LABEL_23:
        _os_log_debug_impl(&dword_206568000, v12, OS_LOG_TYPE_DEBUG, v14, buf, 0x16u);
        goto LABEL_13;
      default:
        return;
    }
  }
  if (self->_lock_timeoutTime == 0.0)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_10:
    SWLogPower();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = self->_identifier;
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2114;
      v27 = v15;
      v28 = 1024;
      LODWORD(v29) = lock_assertionID;
      _os_log_impl(&dword_206568000, v10, OS_LOG_TYPE_INFO, "%p will invalidate power assertion; identifier:%{public}@ id:%d",
        buf,
        0x1Cu);
    }
    goto LABEL_12;
  }
  BSContinuousMachTimeNow();
  v8 = v7;
  lock_timeoutTime = self->_lock_timeoutTime;
  os_unfair_lock_unlock(p_lock);
  if (v8 < lock_timeoutTime)
    goto LABEL_10;
  SWLogPower();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self->_identifier;
    *(_DWORD *)buf = 134218498;
    v25 = self;
    v26 = 2114;
    v27 = v11;
    v28 = 1024;
    LODWORD(v29) = lock_assertionID;
    _os_log_debug_impl(&dword_206568000, v10, OS_LOG_TYPE_DEBUG, "%p power assertion timed out; identifier:%{public}@ id:%d",
      buf,
      0x1Cu);
  }
LABEL_12:

  +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SWPreventSystemSleepAssertion_invalidate__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v23 = lock_assertionID;
  dispatch_async(v12, block);
LABEL_13:

}

uint64_t __43__SWPreventSystemSleepAssertion_invalidate__block_invoke(uint64_t a1)
{
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_state;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SWPreventSystemSleepAssertion *v16;
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
  lock_state = self->_lock_state;
  if (lock_state != 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SWPreventSystemSleepAssertion:%p id:%@ state:%u dealloced before invalidation"), self, self->_identifier, lock_state);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("SWPreventSystemSleepAssertion.m");
      v19 = 1024;
      v20 = 188;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20657313CLL);
  }
  os_unfair_lock_unlock(p_lock);
  v10.receiver = self;
  v10.super_class = (Class)SWPreventSystemSleepAssertion;
  -[SWPreventSystemSleepAssertion dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
