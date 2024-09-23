@implementation HVPowerBudgetThrottlingState

- (void)startWork
{
  NSObject *log;
  BOOL v5;
  void *v6;
  uint8_t v7[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21AA1D000, log, OS_LOG_TYPE_DEFAULT, "Starting throttled work", v7, 2u);
  }
  pthread_mutex_lock(&self->_lock);
  if (self->_opInProgress)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVPowerBudget.m"), 711, CFSTR("Work already in progress!"));

  }
  if (self->_hasClassCUnlock)
  {
    self->_opInProgress = 1;
    self->_wasOnBattery = HVIsConnectedToPower() ^ 1;
    if (+[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"))
      v5 = 0;
    else
      v5 = !+[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled");
    self->_wasEnabled = v5;
    self->_absTimeAtOpStart = mach_absolute_time();
    self->_timeSinceOpStart = 0;
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)updateState:(unsigned int)a3
{
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  double v7;
  int64_t v8;
  NSObject *log;
  const __CFString *v10;
  uint64_t budgetState;
  const __CFString *v12;
  int64_t v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (!self->_hasClassCUnlock || self->_state.magic == -1804290770 && self->_state.budgetState == a3)
  {
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = (unint64_t)v7;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 7)
        v10 = CFSTR("Unknown reason");
      else
        v10 = off_24DD7E0E0[a3];
      budgetState = self->_state.budgetState;
      if (budgetState > 7)
        v12 = CFSTR("Unknown reason");
      else
        v12 = off_24DD7E0E0[budgetState];
      v13 = v8 - self->_state.timeOfLastChange;
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      v19 = 2048;
      v20 = v13;
      v14 = log;
      _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "Budget Status Changed to \"%@\" from \"%@\" after %llu seconds", (uint8_t *)&v15, 0x20u);

    }
    self->_state.magic = -1804290770;
    self->_state.budgetState = a3;
    self->_state.timeOfLastChange = v8;
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    pthread_mutex_unlock(p_lock);
  }
}

- (void)checkBatteryStateForRefill
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  double v5;
  double v6;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock && self->_state.budgetState == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)self->_state.timeOfLastChange);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5;

    if (v6 < -300.0)
    {
      _refillState((uint64_t)&self->_state);
      -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (unsigned)canDoDiscretionaryWork:(unsigned int *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  int64_t nsecLeft;
  double v7;
  double v8;
  int v9;
  int opsLeft;
  _BOOL4 v11;
  unsigned int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  _BOOL4 v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  NSObject *log;
  BOOL v24;
  BOOL v25;
  __CFString *v26;
  __CFString *v27;
  int64_t v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  _BOOL4 opInProgress;
  _BOOL4 wasOnBattery;
  _BOOL4 wasEnabled;
  unint64_t timeSinceOpStart;
  NSObject *v37;
  unsigned int v38;
  NSObject *v39;
  int v41;
  unsigned int v42;
  unsigned int *v43;
  _opaque_pthread_mutex_t *v44;
  _BOOL4 v45;
  int v46;
  _BOOL4 v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  _BOOL4 v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  unint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    nsecLeft = self->_state.nsecLeft;
    v43 = a3;
    v44 = p_lock;
    if (self->_opInProgress)
    {
      -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
      if (self->_wasOnBattery && self->_wasEnabled)
        nsecLeft -= self->_timeSinceOpStart;
    }
    v7 = (double)+[HVUserDefaults harvestBudgetNumberOfOperations](HVUserDefaults, "harvestBudgetNumberOfOperations");
    +[HVUserDefaults harvestBudgetReserve](HVUserDefaults, "harvestBudgetReserve");
    v9 = (int)(v8 * v7);
    opsLeft = self->_state.opsLeft;
    v11 = opsLeft > v9;
    if (opsLeft > 0)
      v11 = 1;
    if (opsLeft <= v9)
      v12 = opsLeft > 0;
    else
      v12 = 2;
    if (v11)
      v13 = 2;
    else
      v13 = 3;
    v42 = v13;
    +[HVUserDefaults harvestBudgetCPUTimeSeconds](HVUserDefaults, "harvestBudgetCPUTimeSeconds");
    v15 = v14;
    +[HVUserDefaults harvestBudgetReserve](HVUserDefaults, "harvestBudgetReserve");
    v17 = (uint64_t)(v15 * v16 * 1000000000.0);
    v18 = nsecLeft <= v17;
    if (nsecLeft > v17)
      v19 = 2;
    else
      v19 = nsecLeft > 0;
    if (nsecLeft >= 1)
      v18 = 0;
    v47 = v18;
    v20 = HVIsConnectedToPower();
    v45 = +[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled");
    v46 = v20;
    if (v12 >= v19)
      v21 = v19;
    else
      v21 = v12;
    if (v45 | v20)
      v22 = 2;
    else
      v22 = v21;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v24 = nsecLeft <= v17;
      v25 = opsLeft > v9 || opsLeft <= 0;
      v41 = self->_state.opsLeft;
      if (v25)
        v26 = CFSTR("HVPowerBudgetLevelFull");
      else
        v26 = CFSTR("HVPowerBudgetLevelReserve");
      if (!v12)
        v26 = CFSTR("HVPowerBudgetLevelNone");
      v27 = v26;
      v28 = self->_state.nsecLeft;
      if (v24 && nsecLeft > 0)
        v29 = CFSTR("HVPowerBudgetLevelReserve");
      else
        v29 = CFSTR("HVPowerBudgetLevelFull");
      if (v47)
        v29 = CFSTR("HVPowerBudgetLevelNone");
      v30 = v29;
      if (v22 == 1)
        v31 = CFSTR("HVPowerBudgetLevelReserve");
      else
        v31 = CFSTR("HVPowerBudgetLevelFull");
      if (!v22)
        v31 = CFSTR("HVPowerBudgetLevelNone");
      v32 = v31;
      opInProgress = self->_opInProgress;
      wasOnBattery = self->_wasOnBattery;
      wasEnabled = self->_wasEnabled;
      timeSinceOpStart = self->_timeSinceOpStart;
      *(_DWORD *)buf = 67111682;
      v49 = v41;
      v50 = 2114;
      v51 = v27;
      v52 = 2048;
      v53 = v28;
      v54 = 2114;
      v55 = v30;
      v56 = 1024;
      v57 = v46;
      v58 = 1024;
      v59 = v45;
      v60 = 2114;
      v61 = v32;
      v62 = 1024;
      v63 = opInProgress;
      v64 = 1024;
      v65 = wasOnBattery;
      v66 = 1024;
      v67 = wasEnabled;
      v68 = 2048;
      v69 = timeSinceOpStart;
      v37 = log;
      _os_log_impl(&dword_21AA1D000, v37, OS_LOG_TYPE_DEFAULT, "Throttle check: %i ops left (%{public}@), %lli ns left (%{public}@), connectedToPower %d, disabled %d, canProcess %{public}@, opInProgress %d :(wasOnBattery %d, wasEnabled %d, timeSinceOpStart %lld)", buf, 0x58u);

    }
    a3 = v43;
    if (!v43)
    {
      p_lock = v44;
      goto LABEL_60;
    }
    if (v47)
      v38 = 4;
    else
      v38 = v42;
    if (v46)
      v38 = 1;
    if (v45)
      v38 = 6;
    p_lock = v44;
    goto LABEL_58;
  }
  v39 = self->_log;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v39, OS_LOG_TYPE_DEFAULT, "Throttle check: disabled due to class C lock", buf, 2u);
  }
  LOBYTE(v22) = 0;
  if (a3)
  {
    v38 = 7;
LABEL_58:
    *a3 = v38;
  }
LABEL_60:
  pthread_mutex_unlock(p_lock);
  return v22;
}

- (void)_writeThrottleStateLocked
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int *v7;
  char *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_INFO, "Writing throttle state", buf, 2u);
    }
    if (!*(_BYTE *)(a1 + 136))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__writeThrottleStateLocked, a1, CFSTR("HVPowerBudget.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasClassCUnlock"));

    }
    v3 = *(_DWORD *)(a1 + 128);
    if ((v3 & 0x80000000) == 0 && pwrite(v3, (const void *)(a1 + 80), 0x20uLL, 0) != 32)
    {
      v4 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        v6 = *__error();
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 67109378;
        v11 = v6;
        v12 = 2080;
        v13 = v8;
        _os_log_error_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_ERROR, "Throttle state write truncated [%i] %s", buf, 0x12u);

      }
    }
  }
}

- (HVPowerBudgetThrottlingState)initWithPath:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  HVPowerBudgetThrottlingState *v8;
  HVPowerBudgetThrottlingState *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 *v13;
  unsigned __int8 v14;
  NSObject *log;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id location;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HVPowerBudgetThrottlingState;
  v8 = -[HVPowerBudgetThrottlingState init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    pthread_mutex_init(&v8->_lock, 0);
    if (v7)
      v10 = v7;
    else
      v10 = (void *)MEMORY[0x24BDACB70];
    objc_storeStrong((id *)&v9->_log, v10);
    location = 0;
    objc_initWeak(&location, v9);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2810000000;
    v24 = &unk_21AA65285;
    v25 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v11 = (void *)MEMORY[0x24BE7A5D0];
    v17[2] = __49__HVPowerBudgetThrottlingState_initWithPath_log___block_invoke;
    v17[3] = &unk_24DD7E0A0;
    v17[1] = 3221225472;
    objc_copyWeak(&v20, &location);
    v12 = v6;
    v18 = v12;
    v19 = &v21;
    objc_msgSend(v11, "runBlockWhenDeviceIsClassCUnlocked:", v17);
    v13 = (unsigned __int8 *)(v22 + 4);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(1u, v13));
    if ((v14 & 1) == 0)
    {
      log = v9->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v12;
        _os_log_impl(&dword_21AA1D000, log, OS_LOG_TYPE_DEFAULT, "HVPowerBudgetThrottlingState initializing before class C unlock with path %@. Budget state will be 0 until class C unlock occurs.", buf, 0xCu);
      }
    }

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  pthread_mutex_destroy(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
      close(fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)HVPowerBudgetThrottlingState;
  -[HVPowerBudgetThrottlingState dealloc](&v4, sel_dealloc);
}

- (unsigned)canDoDiscretionaryWork
{
  return -[HVPowerBudgetThrottlingState canDoDiscretionaryWork:](self, "canDoDiscretionaryWork:", 0);
}

- (unsigned)canDoExtraDiscretionaryWork
{
  _opaque_pthread_mutex_t *p_lock;
  double extraOpsLeft;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *log;
  int v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    extraOpsLeft = (double)self->_state.extraOpsLeft;
    +[HVUserDefaults harvestBudgetReserve](HVUserDefaults, "harvestBudgetReserve");
    v6 = v5 * 200.0 < extraOpsLeft || self->_state.extraOpsLeft > 0;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_state.extraOpsLeft;
      v10 = CFSTR("HVPowerBudgetLevelNone");
      if (v6)
        v10 = CFSTR("HVPowerBudgetLevelReserve");
      v11 = v10;
      v14[0] = 67109378;
      v14[1] = v9;
      v15 = 2114;
      v16 = v11;
      v12 = log;
      _os_log_impl(&dword_21AA1D000, v12, OS_LOG_TYPE_DEFAULT, "Extra budgeted operations check: %i extra ops left (%{public}@)", (uint8_t *)v14, 0x12u);

    }
  }
  else
  {
    v7 = self->_log;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "Extra budgeted operations check: disabled due to class C lock", (uint8_t *)v14, 2u);
      LOBYTE(v6) = 0;
    }
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)state
{
  _opaque_pthread_mutex_t *p_lock;
  int64_t nsecLeft;
  NSObject *log;
  int opsLeft;
  _BOOL4 wasOnBattery;
  _BOOL4 wasEnabled;
  unint64_t timeSinceOpStart;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    nsecLeft = self->_state.nsecLeft;
    if (self->_opInProgress)
    {
      -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
      if (self->_wasOnBattery && self->_wasEnabled)
        nsecLeft -= self->_timeSinceOpStart;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      opsLeft = self->_state.opsLeft;
      wasOnBattery = self->_wasOnBattery;
      wasEnabled = self->_wasEnabled;
      timeSinceOpStart = self->_timeSinceOpStart;
      *(_DWORD *)buf = 67110144;
      v21 = opsLeft;
      v22 = 2048;
      v23 = nsecLeft;
      v24 = 1024;
      v25 = wasOnBattery;
      v26 = 1024;
      v27 = wasEnabled;
      v28 = 2048;
      v29 = timeSinceOpStart;
      _os_log_impl(&dword_21AA1D000, log, OS_LOG_TYPE_DEFAULT, "Throttle check: %i ops left, %lli ns left, onBattery %d, disabled %d, timeSinceOpStart %lld", buf, 0x28u);
    }
    v18[0] = CFSTR("opsLeft");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_state.opsLeft);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v18[1] = CFSTR("nsecLeft");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", nsecLeft);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    v18[2] = CFSTR("extraOpsLeft");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_state.extraOpsLeft);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "Throttle check: disabled due to class C lock, returning all 0's for state", buf, 2u);
    }
    v16[0] = CFSTR("opsLeft");
    v16[1] = CFSTR("nsecLeft");
    v17[0] = &unk_24DD8BCB0;
    v17[1] = &unk_24DD8BCE0;
    v16[2] = CFSTR("extraOpsLeft");
    v17[2] = &unk_24DD8BCB0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  pthread_mutex_unlock(p_lock);
  return v13;
}

- (void)refillState
{
  _opaque_pthread_mutex_t *p_lock;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    _refillState((uint64_t)&self->_state);
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)endWork
{
  _opaque_pthread_mutex_t *p_lock;
  int opsLeft;
  BOOL v5;
  int v6;
  int64_t nsecLeft;
  NSObject *log;
  int64_t v9;
  double v10;
  const char *v11;
  const char *v12;
  int v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock && self->_opInProgress)
  {
    -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
    if (self->_wasOnBattery && self->_wasEnabled)
    {
      opsLeft = self->_state.opsLeft;
      v5 = __OFSUB__(opsLeft, 1);
      v6 = opsLeft - 1;
      if (v6 < 0 == v5)
      {
        nsecLeft = self->_state.nsecLeft;
        if (nsecLeft >= 1)
        {
          self->_state.opsLeft = v6;
          self->_state.nsecLeft = nsecLeft - self->_timeSinceOpStart;
          -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
        }
      }
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_state.nsecLeft;
      v10 = (double)self->_timeSinceOpStart * 0.000001;
      v11 = "YES";
      if (self->_wasOnBattery)
        v12 = "YES";
      else
        v12 = "NO";
      if (!self->_wasEnabled)
        v11 = "NO";
      v13 = self->_state.opsLeft;
      v14 = 134219266;
      v15 = v10;
      v16 = 2048;
      v17 = (double)v9 * 0.000001;
      v18 = 2080;
      v19 = v12;
      v20 = 2080;
      v21 = v11;
      v22 = 1024;
      v23 = v13;
      v24 = 2048;
      v25 = v9;
      _os_log_impl(&dword_21AA1D000, log, OS_LOG_TYPE_DEFAULT, "Ending throttled work; duration was %f ms (%f ms left), wasOnBattery %s, wasEnabled %s, Throttle Budget: %d ops "
        "left, %lld ns left",
        (uint8_t *)&v14,
        0x3Au);
    }
    self->_opInProgress = 0;
    self->_timeSinceOpStart = 0;
    *(_WORD *)&self->_wasOnBattery = 0;
  }
  pthread_mutex_unlock(p_lock);
}

- (void)didConsumeAnExtraBudgetedOperation
{
  _opaque_pthread_mutex_t *p_lock;
  int extraOpsLeft;
  BOOL v5;
  int v6;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    if ((HVIsConnectedToPower() & 1) == 0)
      self->_wasOnBattery = 1;
    if (!+[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled")
      && !+[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled"))
    {
      self->_wasEnabled = 1;
    }
    if (self->_wasOnBattery && self->_wasEnabled)
    {
      extraOpsLeft = self->_state.extraOpsLeft;
      v5 = __OFSUB__(extraOpsLeft, 1);
      v6 = extraOpsLeft - 1;
      if (v6 < 0 == v5)
      {
        self->_state.extraOpsLeft = v6;
        -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
      }
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (uint64_t)_updateOperationProgress
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 136))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateOperationProgress, v1, CFSTR("HVPowerBudget.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasClassCUnlock"));

    }
    v2 = mach_absolute_time() - *(_QWORD *)(v1 + 112);
    if (machTimeToNanoseconds_onceToken != -1)
      dispatch_once(&machTimeToNanoseconds_onceToken, &__block_literal_global_146);
    *(_QWORD *)(v1 + 120) = v2 * machTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_253E499F4;
    if ((HVIsConnectedToPower() & 1) == 0)
      *(_BYTE *)(v1 + 134) = 1;
    result = +[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled");
    if ((result & 1) == 0)
    {
      result = +[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled");
      if ((result & 1) == 0)
        *(_BYTE *)(v1 + 135) = 1;
    }
  }
  return result;
}

void __49__HVPowerBudgetThrottlingState_initWithPath_log___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  __int128 v11;
  unsigned __int8 *v12;
  unsigned __int8 v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  int *v17;
  char *v18;
  void *v19;
  uint8_t buf[40];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    v4 = pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    WeakRetained[136] = 1;
    v5 = (void *)MEMORY[0x22074FDF0](v4);
    v6 = objc_retainAutorelease(v3);
    v7 = open((const char *)objc_msgSend(v6, "UTF8String"), 514, 384);
    objc_autoreleasePoolPop(v5);
    *((_DWORD *)WeakRetained + 32) = v7;
    if (v7 < 0)
    {
      v8 = *((_QWORD *)WeakRetained + 9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v15 = v8;
        v16 = *__error();
        v17 = __error();
        v18 = strerror(*v17);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v16;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = v18;
        _os_log_error_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_ERROR, "Error opening throttle state [%i]: %s", buf, 0x12u);

      }
    }
    v9 = *((_QWORD *)WeakRetained + 9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_INFO, "Reading throttle state", buf, 2u);
    }
    if (!WeakRetained[136])
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__readThrottleStateLocked, WeakRetained, CFSTR("HVPowerBudget.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasClassCUnlock"));

    }
    v10 = *((_DWORD *)WeakRetained + 32);
    if ((v10 & 0x80000000) == 0
      && (memset(buf, 0, 32), pread(v10, buf, 0x20uLL, 0) == 32)
      && *(_DWORD *)buf == -1804290770)
    {
      v11 = *(_OWORD *)&buf[16];
      *((_OWORD *)WeakRetained + 5) = *(_OWORD *)buf;
      *((_OWORD *)WeakRetained + 6) = v11;
    }
    else
    {
      _refillState((uint64_t)(WeakRetained + 80));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));

    v12 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(1u, v12));
    if ((v13 & 1) != 0)
    {
      v14 = *((_QWORD *)WeakRetained + 9);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "HVPowerBudgetThrottlingState deferred class C unlock completed", buf, 2u);
      }
    }
  }

}

@end
