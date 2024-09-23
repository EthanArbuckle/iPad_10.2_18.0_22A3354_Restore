@implementation HVPowerBudget

+ (id)defaultBudget
{
  if (defaultBudget_onceToken != -1)
    dispatch_once(&defaultBudget_onceToken, &__block_literal_global_116);
  return (id)defaultBudget_instance;
}

- (unsigned)canDoDiscretionaryWork
{
  return -[HVPowerBudget _canDoDiscretionaryWork:]((uint64_t)self, 0);
}

- (void)doDiscretionaryWork:(id)a3 orElse:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  int v8;
  NSObject *log;
  const __CFString *v10;
  NSObject *v11;
  BOOL *p_discretionaryWorkInProgress;
  unsigned __int8 v13;
  NSObject *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _QWORD *v17;
  _DASScheduler *scheduler;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  _DASScheduler *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  int hasDuetBudget;
  const char *v38;
  void *v39;
  void *context;
  unsigned int v41;
  _BYTE buf[22];
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(_QWORD))a4;
  v41 = 0;
  v8 = -[HVPowerBudget _canDoDiscretionaryWork:]((uint64_t)self, &v41);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (v41 > 7)
      v10 = CFSTR("Unknown reason");
    else
      v10 = off_24DD7E0E0[v41];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v8 != 0;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v10;
    v11 = log;
    _os_log_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_DEFAULT, "Can do discretionary work: %i - %@", buf, 0x12u);

  }
  if (!v8)
    goto LABEL_16;
  p_discretionaryWorkInProgress = &self->_discretionaryWorkInProgress;
  do
    v13 = __ldaxr((unsigned __int8 *)p_discretionaryWorkInProgress);
  while (__stlxr(1u, (unsigned __int8 *)p_discretionaryWorkInProgress));
  v14 = self->_log;
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "Discretionary work already in progress", buf, 2u);
    }
LABEL_16:
    v7[2](v7);
    goto LABEL_40;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v14, OS_LOG_TYPE_DEFAULT, "Starting discretionary work", buf, 2u);
  }
  v16 = +[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled");
  v17 = (_QWORD *)MEMORY[0x24BE2E2C8];
  if (v16)
  {
    self->_isScheduled = 0;
  }
  else
  {
    self->_isScheduled = 1;
    context = (void *)MEMORY[0x22074FDF0]();
    scheduler = self->_scheduler;
    v49[0] = *v17;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v49, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASScheduler activityStartedWithParameters:](scheduler, "activityStartedWithParameters:", v22);

    v17 = (_QWORD *)MEMORY[0x24BE2E2C8];
    objc_autoreleasePoolPop(context);
  }
  -[HVPowerBudgetThrottlingState startWork](self->_throttlingState, "startWork");
  v6[2](v6);
  v23 = atomic_load((unsigned __int8 *)&self->_discretionaryWorkInProgress);
  if ((v23 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", sel__endWork, self, CFSTR("HVPowerBudget.m"), 318, CFSTR("Not doing discretionary work!"));

  }
  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v24, OS_LOG_TYPE_DEFAULT, "Ending discretionary work", buf, 2u);
  }
  v25 = -[HVPowerBudgetThrottlingState endWork](self->_throttlingState, "endWork");
  if (self->_isScheduled)
  {
    v26 = (void *)MEMORY[0x22074FDF0](v25);
    v27 = self->_scheduler;
    v48 = (void *)*v17;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "processName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASScheduler activityStoppedWithParameters:](v27, "activityStoppedWithParameters:", v31);

    objc_autoreleasePoolPop(v26);
    self->_isScheduled = 0;
  }
  v32 = self->_log;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v34 = "YES";
    if ((HVIsConnectedToPower() & 1) == 0)
    {
      v34 = "YES";
      if ((-[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self) & 1) == 0
        && !+[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"))
      {
        v34 = "NO";
      }
    }
    if (HVIsConnectedToPower())
      v35 = "YES";
    else
      v35 = "NO";
    if (+[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"))
      v36 = "YES";
    else
      v36 = "NO";
    hasDuetBudget = -[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self);
    *(_DWORD *)buf = 136315906;
    if (hasDuetBudget)
      v38 = "YES";
    else
      v38 = "NO";
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v35;
    v43 = 2080;
    v44 = v36;
    v45 = 2080;
    v46 = v38;
    _os_log_impl(&dword_21AA1D000, v33, OS_LOG_TYPE_DEFAULT, "Ending Duet work; Further duet processing allowed: %s  Connected to power: %s disabled: %s Duet Budget: %s",
      buf,
      0x2Au);

  }
  atomic_store(0, (unsigned __int8 *)p_discretionaryWorkInProgress);
LABEL_40:

}

- (uint64_t)_canDoDiscretionaryWork:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  unsigned int v8;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "checkBatteryStateForRefill");
  v8 = 0;
  if (canDoWorkOverrideForTesting)
  {
    v4 = 6;
    v8 = 6;
    if (objc_msgSend((id)canDoWorkOverrideForTesting, "BOOLValue"))
      v5 = 2;
    else
      v5 = 0;
  }
  else if (+[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"))
  {
    v4 = 6;
    v8 = 6;
    v5 = 2;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 8), "canDoDiscretionaryWork:", &v8);
    v4 = v8;
    if ((_DWORD)v5)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__checkCanDoDiscretionaryWork_, a1, CFSTR("HVPowerBudget.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("*state != HVPowerBudgetStateNotSet"));

      }
      if ((-[HVPowerBudget _hasDuetBudgetRemaining](a1) & 1) != 0)
      {
        if (v5 >= 2)
          v5 = 2;
        else
          v5 = v5;
        v4 = v8;
      }
      else
      {
        v5 = 0;
        v4 = 5;
        v8 = 5;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 8), "updateState:", v4);
  if (a2)
    *a2 = v8;
  return v5;
}

- (uint64_t)_hasDuetBudgetRemaining
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BE2E230], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BE2E2C0];
  v6 = *MEMORY[0x24BE2E2D0];
  v7[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("com.apple.proactive.ProactiveHarvesting"), v2, v3);

  return v4;
}

- (HVPowerBudget)initWithThrottleBudget:(id)a3
{
  id v5;
  HVPowerBudget *v6;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  _DASScheduler *scheduler;
  void *v11;
  HVPowerBudget *v12;
  uint64_t v13;
  NSObject *batteryObserver;
  _QWORD v16[4];
  HVPowerBudget *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HVPowerBudget;
  v6 = -[HVPowerBudget init](&v18, sel_init);
  if (v6)
  {
    v7 = os_log_create("com.apple.suggestions", "HVPowerBudget");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_msgSend(MEMORY[0x24BE2E228], "sharedScheduler");
    v9 = objc_claimAutoreleasedReturnValue();
    scheduler = v6->_scheduler;
    v6->_scheduler = (_DASScheduler *)v9;

    objc_storeStrong((id *)&v6->_throttlingState, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __40__HVPowerBudget_initWithThrottleBudget___block_invoke;
    v16[3] = &unk_24DD7E018;
    v12 = v6;
    v17 = v12;
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("kHVBatteryStateChangedNotification"), 0, 0, v16);
    v13 = objc_claimAutoreleasedReturnValue();
    batteryObserver = v12->_batteryObserver;
    v12->_batteryObserver = v13;

  }
  return v6;
}

- (HVPowerBudget)init
{
  void *v3;
  HVPowerBudgetThrottlingState *v4;
  HVPowerBudget *v5;

  +[HVPathsBase filename:](HVPaths, "filename:", CFSTR("throttle-state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HVPowerBudgetThrottlingState initWithPath:log:]([HVPowerBudgetThrottlingState alloc], "initWithPath:log:", v3, self->_log);
  v5 = -[HVPowerBudget initWithThrottleBudget:](self, "initWithThrottleBudget:", v4);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_batteryObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_batteryObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)HVPowerBudget;
  -[HVPowerBudget dealloc](&v4, sel_dealloc);
}

- (void)refillThrottleBudget
{
  -[HVPowerBudgetThrottlingState refillState](self->_throttlingState, "refillState");
}

- (unsigned)canDoExtraDiscretionaryWork
{
  if ((HVIsConnectedToPower() & 1) != 0)
    return 2;
  if (self)
    return -[HVPowerBudgetThrottlingState canDoExtraDiscretionaryWork](self->_throttlingState, "canDoExtraDiscretionaryWork");
  return 0;
}

- (void)didConsumeAnExtraBudgetedOperation
{
  NSObject *log;
  uint8_t v4[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21AA1D000, log, OS_LOG_TYPE_DEFAULT, "Did consume one extra budgeted operation", v4, 2u);
  }
  if ((HVIsConnectedToPower() & 1) == 0)
    -[HVPowerBudgetThrottlingState didConsumeAnExtraBudgetedOperation](self->_throttlingState, "didConsumeAnExtraBudgetedOperation");
}

- (id)throttlingState
{
  void *v3;
  void *v4;
  BOOL *p_discretionaryWorkInProgress;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x24BDAC8D0];
  -[HVPowerBudgetThrottlingState state](self->_throttlingState, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v3, "mutableCopy");

  v22[0] = CFSTR("isProcessing");
  v4 = (void *)MEMORY[0x24BDD16E0];
  p_discretionaryWorkInProgress = &self->_discretionaryWorkInProgress;
  v6 = atomic_load((unsigned __int8 *)&self->_discretionaryWorkInProgress);
  objc_msgSend(v4, "numberWithBool:", v6 & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("canDoDiscretionaryWork");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[HVPowerBudget canDoDiscretionaryWork](self, "canDoDiscretionaryWork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = CFSTR("hasDuetBudgetRemaining");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  v22[3] = CFSTR("lastPluginTime");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSince1970](self->_lastPlugInTime, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v10;
  v22[4] = CFSTR("discretionaryWorkInProgress");
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = atomic_load((unsigned __int8 *)p_discretionaryWorkInProgress);
  objc_msgSend(v11, "numberWithBool:", v12 & 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v13;
  v22[5] = CFSTR("isConnectedToPower");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", HVIsConnectedToPower());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v14;
  v22[6] = CFSTR("disabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v15;
  v22[7] = CFSTR("throttleBudgetDisabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v16;
  v22[8] = CFSTR("refillDisabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[HVUserDefaults harvestBudgetRefillDisabled](HVUserDefaults, "harvestBudgetRefillDisabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v18);

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_batteryObserver, 0);
  objc_storeStrong((id *)&self->_lastPlugInTime, 0);
  objc_storeStrong((id *)&self->_throttlingState, 0);
}

uint64_t __40__HVPowerBudget_initWithThrottleBudget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "canDoDiscretionaryWork");
}

+ (void)setCanDoWorkOverrideForTesting:(id)a3
{
  objc_storeStrong((id *)&canDoWorkOverrideForTesting, a3);
}

void __30__HVPowerBudget_defaultBudget__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultBudget_instance;
  defaultBudget_instance = v0;

}

@end
