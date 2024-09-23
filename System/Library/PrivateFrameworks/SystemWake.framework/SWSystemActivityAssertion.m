@implementation SWSystemActivityAssertion

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3
{
  return -[SWSystemActivityAssertion initWithIdentifier:internalConfigurator:](self, "initWithIdentifier:internalConfigurator:", a3, &__block_literal_global_0);
}

void __48__SWSystemActivityAssertion_initWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setAcquireWaitsToAbortSleepRequested:", 0);
  +[SWSystemSleepMonitor monitorUsingMainQueue](SWSystemSleepMonitor, "monitorUsingMainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSleepMonitor:", v2);

  +[SWSystemActivityProvider sharedProvider](SWSystemActivityProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemActivityProvider:", v3);

}

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 configurator:(id)a4
{
  id v6;
  id v7;
  SWSystemActivityAssertion *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SWSystemActivityAssertion_initWithIdentifier_configurator___block_invoke;
  v10[3] = &unk_24BF27E60;
  v11 = v6;
  v7 = v6;
  v8 = -[SWSystemActivityAssertion initWithIdentifier:internalConfigurator:](self, "initWithIdentifier:internalConfigurator:", a3, v10);

  return v8;
}

void __61__SWSystemActivityAssertion_initWithIdentifier_configurator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  +[SWSystemSleepMonitor monitorUsingMainQueue](SWSystemSleepMonitor, "monitorUsingMainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSleepMonitor:", v3);

  +[SWSystemActivityProvider sharedProvider](SWSystemActivityProvider, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemActivityProvider:", v4);

}

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 internalConfigurator:(id)a4
{
  id v7;
  id v8;
  SWSystemActivityAssertion *v9;
  SWSystemActivityAssertion *v10;
  void (**v11)(id, SWSystemActivityAssertion *);
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SWSystemActivityAssertion;
  v9 = -[SWSystemActivityAssertion init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)&v9->_lock_assertionID = 0;
    v9->_lock_state = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (void (**)(id, SWSystemActivityAssertion *))v8;
    v10->_initializing = 1;
    v11[2](v11, v10);
    v10->_initializing = 0;

  }
  return v10;
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
  SWSystemActivityAssertion *v15;
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
  if (!self->_lock_clientDidInvalidate)
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
      v17 = CFSTR("SWSystemActivityAssertion.m");
      v18 = 1024;
      v19 = 91;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656D670);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)SWSystemActivityAssertion;
  -[SWSystemActivityAssertion dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_lock_state, CFSTR("state"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_acquireWaitsToAbortSleepRequested, CFSTR("waitsForAbortSleep"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_lock_acquisitionHandler != 0, CFSTR("pendingAcquisition"), 1);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInt:withName:", self->_lock_assertionID, CFSTR("assertionID"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isActive
{
  SWSystemActivityAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_state == 4;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SWSystemActivityAssertion_acquireWithTimeout_handler___block_invoke;
  block[3] = &unk_24BF27E88;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __56__SWSystemActivityAssertion_acquireWithTimeout_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  int v34;
  int v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  int v43;
  _BOOL4 v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  objc_class *v75;
  void *v76;
  id location;
  _BYTE buf[24];
  _BYTE v79[24];
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (!v2)
    goto LABEL_30;
  SWLogPower();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v45 = *(_QWORD *)(v2 + 8);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v2;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v45;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)v79 = v1;
    _os_log_debug_impl(&dword_206568000, v4, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will acquire with timeout:%lf", buf, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
  *(_QWORD *)(v2 + 72) = v1;
  v5 = objc_msgSend(v3, "copy");
  v6 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = v5;

  *(_BYTE *)(v2 + 82) = objc_msgSend(*(id *)(v2 + 24), "isSleepImminent");
  *(_QWORD *)(v2 + 56) = objc_msgSend(*(id *)(v2 + 32), "getMachContinuousKernelWakeTime");
  if (!*(_QWORD *)(v2 + 64))
  {
    *(_QWORD *)(v2 + 64) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    SWLogPower();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v54 = *(_QWORD *)(v2 + 8);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v54;
      _os_log_debug_impl(&dword_206568000, v15, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will declare system activity", buf, 0x16u);
    }

    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v2 + 44));
    objc_msgSend(*(id *)(v2 + 32), "declareSystemActivityWithName:", *(_QWORD *)(v2 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p system activity assertion - provider returned NULL declare result; id:%@"),
        v2,
        *(_QWORD *)(v2 + 8));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__queue_declareSystemActivity);
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v75 = (objc_class *)objc_opt_class();
        NSStringFromClass(v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v76;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)v79 = v2;
        *(_WORD *)&v79[8] = 2114;
        *(_QWORD *)&v79[10] = CFSTR("SWSystemActivityAssertion.m");
        *(_WORD *)&v79[18] = 1024;
        *(_DWORD *)&v79[20] = 168;
        v80 = 2114;
        v81 = v73;
        _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x20656E400);
    }
    SWLogPower();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v55 = *(_QWORD *)(v2 + 8);
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)v79 = v16;
      _os_log_debug_impl(&dword_206568000, v17, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will system activity result:%@", buf, 0x20u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
    v18 = objc_msgSend(v16, "systemState");
    v19 = v18;
    v20 = *(unsigned __int8 *)(v2 + 82);
    if (*(_BYTE *)(v2 + 82))
      v20 = *(_BYTE *)(v2 + 81) != 0;
    if (v18 == 1)
      v21 = 1;
    else
      v21 = v20;
    *(_BYTE *)(v2 + 83) = v21;
    if (objc_msgSend(v16, "returnValue"))
    {
      SWLogPower();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v60 = objc_msgSend(v16, "returnValue");
        v61 = *(_QWORD *)(v2 + 8);
        v62 = *(_QWORD *)(v2 + 64);
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)v79 = v61;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v62;
        _os_log_fault_impl(&dword_206568000, v22, OS_LOG_TYPE_FAULT, "%p failed to start system activity (%ld) for id:%{public}@ state:%u", buf, 0x26u);
      }

      v23 = (void *)MEMORY[0x24BDD1540];
      location = (id)*MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p failed to start system activity (%ld); id:%@ state:%u"),
        v2,
        (int)objc_msgSend(v16, "returnValue"),
        *(_QWORD *)(v2 + 8),
        *(_QWORD *)(v2 + 64));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &location, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("BSSystemActivityDomain"), 4, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)(v2 + 64) = 5;
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
LABEL_23:
      -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](v2, v26);
LABEL_24:

      goto LABEL_30;
    }
    v30 = *(_QWORD *)(v2 + 64);
    if ((v30 | 2) != 3)
    {
      SWLogPower();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v46;
      v44 = v30 != 5;
      if (v30 == 5)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v51 = *(_QWORD *)(v2 + 8);
          v52 = objc_msgSend(v16, "assertionID");
          v53 = *(_QWORD *)(v2 + 16);
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)&buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v51;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)v79 = v52;
          *(_WORD *)&v79[8] = 2114;
          *(_QWORD *)&v79[10] = v53;
          _os_log_impl(&dword_206568000, v47, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated while waiting on system acquisition (will immediately release); id:"
            "%{public}@ assertionID:%lu timer:%{public}@",
            buf,
            0x2Au);
        }

        v26 = 0;
      }
      else
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          v69 = *(_QWORD *)(v2 + 64);
          v70 = *(unsigned int *)(v2 + 40);
          v71 = *(_QWORD *)(v2 + 8);
          v72 = *(_QWORD *)(v2 + 16);
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v71;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v79 = v69;
          *(_WORD *)&v79[4] = 2048;
          *(_QWORD *)&v79[6] = v70;
          *(_WORD *)&v79[14] = 2114;
          *(_QWORD *)&v79[16] = v72;
          _os_log_fault_impl(&dword_206568000, v47, OS_LOG_TYPE_FAULT, "%p system activity assertion state mutated unexpectedly (will immediately release); id:%{public}@ state:%u a"
            "ssertionID:%lu timer:%{public}@",
            buf,
            0x30u);
        }

        v48 = (void *)MEMORY[0x24BDD1540];
        location = (id)*MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p system activity assertion state mutated unexpectedly; id:%@ state:%u"),
          v2,
          *(_QWORD *)(v2 + 8),
          *(_QWORD *)(v2 + 64));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v49;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &location, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("BSSystemActivityDomain"), 3, v50);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)(v2 + 64) = 5;
      }
      objc_msgSend(*(id *)(v2 + 32), "releaseAssertionID:", objc_msgSend(v16, "assertionID"));
LABEL_56:
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
      if (!v44)
        goto LABEL_24;
      goto LABEL_23;
    }
    *(_DWORD *)(v2 + 40) = objc_msgSend(v16, "assertionID");
    if (!v21 || *(_QWORD *)(v2 + 64) != 1)
    {
      *(_QWORD *)(v2 + 64) = 4;
      SWLogPower();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = *(_QWORD *)(v2 + 8);
        v41 = objc_msgSend(v16, "systemState");
        v42 = objc_msgSend(v16, "assertionID");
        v43 = *(unsigned __int8 *)(v2 + 82);
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v79 = v41;
        *(_WORD *)&v79[4] = 2048;
        *(_QWORD *)&v79[6] = v42;
        *(_WORD *)&v79[14] = 1024;
        *(_DWORD *)&v79[16] = v43;
        _os_log_impl(&dword_206568000, v39, OS_LOG_TYPE_INFO, "%p created system activity assertion; id:%{public}@ systemState:%u assertionID:%lu wasSleepImminent:%{BOOL}u",
          buf,
          0x2Cu);
      }

      v44 = 1;
      goto LABEL_52;
    }
    SWLogPower();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v19 == 1)
    {
      if (v32)
      {
        v33 = *(_QWORD *)(v2 + 8);
        v34 = objc_msgSend(v16, "returnValue");
        v35 = *(unsigned __int8 *)(v2 + 82);
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)v79 = v34;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v35;
        v36 = "%p created system activity assertion too late, will wait for next system wake, id:%{public}@ err:%ld wasSl"
              "eepImminent:%{BOOL}u";
        v37 = v31;
        v38 = 38;
LABEL_50:
        _os_log_impl(&dword_206568000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
      }
    }
    else if (v32)
    {
      v63 = *(_QWORD *)(v2 + 8);
      v64 = objc_msgSend(v16, "returnValue");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v63;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)v79 = v64;
      v36 = "%p created system activity assertion after sleepRequested, will wait for next system wake, id:%{public}@ err:%ld";
      v37 = v31;
      v38 = 32;
      goto LABEL_50;
    }

    v44 = 0;
    *(_QWORD *)(v2 + 64) = 2;
LABEL_52:
    if (*(double *)(v2 + 72) > 0.0)
    {
      objc_msgSend(*(id *)(v2 + 16), "invalidate");
      objc_msgSend(*(id *)(v2 + 32), "createTimerWithIdentifier:", *(_QWORD *)(v2 + 8));
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = *(void **)(v2 + 16);
      *(_QWORD *)(v2 + 16) = v65;

      objc_initWeak(&location, (id)v2);
      v67 = *(void **)(v2 + 16);
      v68 = *(double *)(v2 + 72);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __57__SWSystemActivityAssertion__queue_declareSystemActivity__block_invoke;
      *(_QWORD *)v79 = &unk_24BF27EB0;
      objc_copyWeak((id *)&v79[8], &location);
      objc_msgSend(v67, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], buf, v68, 1.0);
      objc_destroyWeak((id *)&v79[8]);
      objc_destroyWeak(&location);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
      v26 = 0;
      if (!v44)
        goto LABEL_24;
      goto LABEL_23;
    }
    v26 = 0;
    goto LABEL_56;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
  v7 = *(_QWORD *)(v2 + 64);
  SWLogPower();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(v2 + 64);
      v11 = *(unsigned int *)(v2 + 40);
      v12 = *(_QWORD *)(v2 + 8);
      v13 = *(_QWORD *)(v2 + 16);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v79 = v10;
      *(_WORD *)&v79[4] = 2048;
      *(_QWORD *)&v79[6] = v11;
      *(_WORD *)&v79[14] = 2114;
      *(_QWORD *)&v79[16] = v13;
      _os_log_impl(&dword_206568000, v9, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated before declaration; id:%{public}@ state:%u assertionID:%lu timer:%{public}@",
        buf,
        0x30u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    v14 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v56 = *(_QWORD *)(v2 + 64);
      v57 = *(unsigned int *)(v2 + 40);
      v58 = *(_QWORD *)(v2 + 8);
      v59 = *(_QWORD *)(v2 + 16);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v79 = v56;
      *(_WORD *)&v79[4] = 2048;
      *(_QWORD *)&v79[6] = v57;
      *(_WORD *)&v79[14] = 2114;
      *(_QWORD *)&v79[16] = v59;
      _os_log_fault_impl(&dword_206568000, v9, OS_LOG_TYPE_FAULT, "%p system activity assertion already acquired; id:%{public}@ state:%u assertionID:%lu timer:%{public}@",
        buf,
        0x30u);
    }

    v27 = (void *)MEMORY[0x24BDD1540];
    location = (id)*MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p twice tried to acquire system activity assertion; id:%@ state:%u"),
      v2,
      *(_QWORD *)(v2 + 8),
      *(_QWORD *)(v2 + 64));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &location, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("BSSystemActivityDomain"), 2, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    if (v14)
      -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](v2, v14);
  }

LABEL_30:
}

- (void)callbackAcquisitionHandlerWithError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  os_unfair_lock_s *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  SWSystemActivityAcquisitionDetails *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SWLogPower();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 8);
    v15 = 134218498;
    v16 = a1;
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v3;
    _os_log_debug_impl(&dword_206568000, v4, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) callback with error:%{public}@", (uint8_t *)&v15, 0x20u);
  }

  v5 = (os_unfair_lock_s *)(a1 + 44);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x20BCF9118](*(_QWORD *)(a1 + 48));
  v7 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = 0;

  v8 = *(_DWORD *)(a1 + 40);
  v9 = *(unsigned __int8 *)(a1 + 82);
  v10 = *(unsigned __int8 *)(a1 + 83);
  v11 = objc_msgSend(*(id *)(a1 + 32), "getMachContinuousKernelWakeTime");
  v12 = *(_QWORD *)(a1 + 56);
  os_unfair_lock_unlock(v5);
  if (v6)
  {
    v13 = -[SWSystemActivityAcquisitionDetails initWithAfterPendingSleepWasAlreadyInitiated:afterFailingToRevertPendingSleep:afterSleepOfNonZeroDuration:]([SWSystemActivityAcquisitionDetails alloc], "initWithAfterPendingSleepWasAlreadyInitiated:afterFailingToRevertPendingSleep:afterSleepOfNonZeroDuration:", v9 != 0, v10 != 0, v12 != v11);
    ((void (**)(_QWORD, BOOL, id, SWSystemActivityAcquisitionDetails *))v6)[2](v6, v8 != 0, v3, v13);

  }
}

void __57__SWSystemActivityAssertion__queue_declareSystemActivity__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD *WeakRetained;
  uint8_t buf[4];
  _QWORD *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SWLogPower();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2 = WeakRetained[1];
      *(_DWORD *)buf = 134218242;
      v5 = WeakRetained;
      v6 = 2114;
      v7 = v2;
      _os_log_impl(&dword_206568000, v1, OS_LOG_TYPE_DEFAULT, "%p system activity assertion timed out: %{public}@", buf, 0x16u);
    }

    -[SWSystemActivityAssertion invalidateWithReason:]((uint64_t)WeakRetained, 0);
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_clientDidInvalidate = 1;
  os_unfair_lock_unlock(p_lock);
  -[SWSystemActivityAssertion invalidateWithReason:]((uint64_t)self, 1);
}

- (void)invalidateWithReason:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BYTE v40[10];
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    objc_msgSend(*(id *)(a1 + 16), "invalidate");
    v5 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v6 = *(_QWORD *)(a1 + 48);
    SWLogPower();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 8);
      v9 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134218754;
      v36 = a1;
      v37 = 2114;
      v38 = v8;
      v39 = 1024;
      *(_DWORD *)v40 = v9;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)&v40[6] = v6 != 0;
      _os_log_impl(&dword_206568000, v7, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated; id:%{public}@ state:%u hasUncalledAcquisitionHandler:%{BOOL}u",
        buf,
        0x22u);
    }

    if (*(_QWORD *)(a1 + 64) == 5)
    {
      SWLogPower();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v21 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 134218242;
        v36 = a1;
        v37 = 2114;
        v38 = v21;
        _os_log_debug_impl(&dword_206568000, v10, OS_LOG_TYPE_DEBUG, "%p system activity assertion already invalid; id:%{public}@",
          buf,
          0x16u);
      }

      v11 = *(unsigned int *)(a1 + 40);
      if ((_DWORD)v11)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p system activity assertion marked invalid but has non-null asssertionID:%u; id:%@ state:%u"),
          a1,
          v11,
          *(_QWORD *)(a1 + 8),
          *(_QWORD *)(a1 + 64));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_invalidateWithReason_);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = (uint64_t)v23;
          v37 = 2114;
          v38 = v25;
          v39 = 2048;
          *(_QWORD *)v40 = a1;
          *(_WORD *)&v40[8] = 2114;
          v41 = CFSTR("SWSystemActivityAssertion.m");
          v42 = 1024;
          v43 = 275;
          v44 = 2114;
          v45 = v22;
          _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x20656EC28);
      }
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p system activity assertion marked invalid but has hasUncalledAcquisitionHandler; id:%@ state:%u"),
          a1,
          *(_QWORD *)(a1 + 8),
          *(_QWORD *)(a1 + 64));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_invalidateWithReason_);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = (uint64_t)v27;
          v37 = 2114;
          v38 = v29;
          v39 = 2048;
          *(_QWORD *)v40 = a1;
          *(_WORD *)&v40[8] = 2114;
          v41 = CFSTR("SWSystemActivityAssertion.m");
          v42 = 1024;
          v43 = 276;
          v44 = 2114;
          v45 = v26;
          _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x20656ED30);
      }
      *(_QWORD *)(a1 + 64) = 5;
      v12 = *(id *)(a1 + 32);
      *(_DWORD *)(a1 + 40) = 0;
    }
    else
    {
      v13 = *(_DWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 64) = 5;
      v12 = *(id *)(a1 + 32);
      *(_DWORD *)(a1 + 40) = 0;
      if (v13)
      {
        +[SWPreventSystemSleepAssertion sharedHighPriorityQueue](SWPreventSystemSleepAssertion, "sharedHighPriorityQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__SWSystemActivityAssertion_invalidateWithReason___block_invoke;
        block[3] = &unk_24BF27ED8;
        v12 = v12;
        v31 = v12;
        v32 = v13;
        dispatch_async(v14, block);

      }
    }
    objc_msgSend(*(id *)(a1 + 24), "removeObserver:", a1);
    v15 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    os_unfair_lock_unlock(v4);
    if (!v6)
      goto LABEL_19;
    if (a2)
    {
      if (a2 == 1)
      {
        os_unfair_lock_lock(v4);
        v16 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = 0;

        os_unfair_lock_unlock(v4);
LABEL_19:

        return;
      }
      v20 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p system activity assertion timed out before acquisition; id:%@"),
        a1,
        *(_QWORD *)(a1 + 8));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BSSystemActivityDomain"), 1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](a1, v20);

    goto LABEL_19;
  }
}

uint64_t __50__SWSystemActivityAssertion_invalidateWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "releaseAssertionID:", *(unsigned int *)(a1 + 40));
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  SWSystemActivityAssertion *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!self->_initializing)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ called after initialization"), v6);
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
      v18 = CFSTR("SWSystemActivityAssertion.m");
      v19 = 1024;
      v20 = 331;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656EF24);
  }
  self->_acquireWaitsToAbortSleepRequested = a3;
}

- (void)setSleepMonitor:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  SWSystemActivityAssertion *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (!self->_initializing)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ called after initialization"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("SWSystemActivityAssertion.m");
      v21 = 1024;
      v22 = 336;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656F0F8);
  }
  objc_storeStrong((id *)&self->_sleepMonitor, a3);
  objc_msgSend(v12, "addObserver:", self);

}

- (void)setSystemActivityProvider:(id)a3
{
  SWSystemActivityProviding *v5;
  SWSystemActivityProviding *provider;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  SWSystemActivityAssertion *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (SWSystemActivityProviding *)a3;
  if (!self->_initializing)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ called after initialization"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("SWSystemActivityAssertion.m");
      v21 = 1024;
      v22 = 342;
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_206568000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x20656F2D0);
  }
  provider = self->_provider;
  self->_provider = v5;

}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  -[SWSystemActivityAssertion _checkIfCompleteForAction:]((uint64_t)self, CFSTR("sleepRequestAborted"));
}

- (void)_checkIfCompleteForAction:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  _BYTE v21[44];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
    goto LABEL_14;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 == 1)
  {
    SWLogPower();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(unsigned int *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 8);
      v13 = *(_QWORD *)(a1 + 16);
      v18 = 134219010;
      v19 = a1;
      v20 = 2114;
      *(_QWORD *)v21 = v3;
      *(_WORD *)&v21[8] = 2114;
      *(_QWORD *)&v21[10] = v12;
      *(_WORD *)&v21[18] = 2048;
      *(_QWORD *)&v21[20] = v11;
      *(_WORD *)&v21[28] = 2114;
      *(_QWORD *)&v21[30] = v13;
      _os_log_debug_impl(&dword_206568000, v9, OS_LOG_TYPE_DEBUG, "%p system activity assertion woke while still acquiring, waiting for acquisition to complete (%{public}@); id:%{"
        "public}@ assertionID:%lu timer:%{public}@",
        (uint8_t *)&v18,
        0x34u);
    }

    *(_QWORD *)(a1 + 64) = 3;
    goto LABEL_13;
  }
  if (v4 != 2)
  {
    SWLogPower();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(unsigned int *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 8);
      v17 = *(_QWORD *)(a1 + 16);
      v18 = 134219266;
      v19 = a1;
      v20 = 1024;
      *(_DWORD *)v21 = v14;
      *(_WORD *)&v21[4] = 2114;
      *(_QWORD *)&v21[6] = v3;
      *(_WORD *)&v21[14] = 2114;
      *(_QWORD *)&v21[16] = v16;
      *(_WORD *)&v21[24] = 2048;
      *(_QWORD *)&v21[26] = v15;
      *(_WORD *)&v21[34] = 2114;
      *(_QWORD *)&v21[36] = v17;
      _os_log_debug_impl(&dword_206568000, v10, OS_LOG_TYPE_DEBUG, "%p system activity assertion not complete, state:%u (%{public}@); id:%{public}@ assertionID:%lu timer:%{public}@",
        (uint8_t *)&v18,
        0x3Au);
    }

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
    goto LABEL_14;
  }
  *(_QWORD *)(a1 + 64) = 4;
  SWLogPower();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(unsigned int *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    v18 = 134219010;
    v19 = a1;
    v20 = 2114;
    *(_QWORD *)v21 = v3;
    *(_WORD *)&v21[8] = 2114;
    *(_QWORD *)&v21[10] = v7;
    *(_WORD *)&v21[18] = 2048;
    *(_QWORD *)&v21[20] = v6;
    *(_WORD *)&v21[28] = 2114;
    *(_QWORD *)&v21[30] = v8;
    _os_log_impl(&dword_206568000, v5, OS_LOG_TYPE_INFO, "%p system activity assertion now valid (%{public}@); id:%{public}@ assertionID:%lu timer:%{public}@",
      (uint8_t *)&v18,
      0x34u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](a1, 0);
LABEL_14:

}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  -[SWSystemActivityAssertion _checkIfCompleteForAction:]((uint64_t)self, CFSTR("didWakeFromSleep"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
