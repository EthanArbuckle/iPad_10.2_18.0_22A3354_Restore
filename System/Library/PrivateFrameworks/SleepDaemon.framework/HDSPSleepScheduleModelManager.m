@implementation HDSPSleepScheduleModelManager

- (HKSPSleepSettings)sleepSettings
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepScheduleModelManager_sleepSettings__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepSettings *)v2;
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepScheduleModelManager_sleepEventRecord__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepEventRecord *)v2;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

void __46__HDSPSleepScheduleModelManager_sleepSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__HDSPSleepScheduleModelManager_sleepEventRecord__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HDSPSleepScheduleModelManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepScheduleModelManager *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void (**v9)(void);
  uint64_t v10;
  HKSPMutexProvider *mutexProvider;
  id v12;
  void *v13;
  uint64_t v14;
  HKSPObserverSet *observers;
  HDSPSleepScheduleModelChangeEvaluator *v16;
  HDSPSleepScheduleModelChangeEvaluator *changeEvaluator;
  HDSPSleepScheduleModelManager *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  HDSPSleepScheduleModelManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepScheduleModelManager;
  v5 = -[HDSPSleepScheduleModelManager init](&v20, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2048;
      v24 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_environment, v4);
    objc_msgSend(v4, "mutexGenerator");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
    v10 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v5->_mutexProvider;
    v5->_mutexProvider = (HKSPMutexProvider *)v10;

    v12 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithCallbackScheduler:", v13);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v14;

    v16 = -[HDSPSleepScheduleModelChangeEvaluator initWithEnvironment:]([HDSPSleepScheduleModelChangeEvaluator alloc], "initWithEnvironment:", v4);
    changeEvaluator = v5->_changeEvaluator;
    v5->_changeEvaluator = v16;

    v18 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
}

- (void)environmentWillBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepScheduleModelChangeEvaluator environmentWillBecomeReady:](self->_changeEvaluator, "environmentWillBecomeReady:", v10);
  objc_msgSend(v10, "sleepScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventProvider:", self);

  objc_msgSend(v10, "timeChangeListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  objc_msgSend(v10, "sleepStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_msgSend(v10, "diagnostics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addProvider:", self);

  objc_msgSend(v10, "systemMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWorkspaceMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

}

- (void)environmentDidBecomeReady:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0;
  v5 = -[HDSPSleepScheduleModelManager _loadSleepScheduleModel:](self, "_loadSleepScheduleModel:", &v10);
  v6 = v10;
  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      v9 = v8;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load model: %{public}@", buf, 0x16u);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepScheduleModelChangeEvaluator environmentDidBecomeReady:](self->_changeEvaluator, "environmentDidBecomeReady:", v4);
  if (-[HDSPSleepScheduleModelManager _shouldTurnOffWatchSleepFeatures](self, "_shouldTurnOffWatchSleepFeatures"))
    -[HDSPSleepScheduleModelManager _turnOffWatchSleepFeatures](self, "_turnOffWatchSleepFeatures");
  if (-[HDSPSleepScheduleModelManager _shouldTurnOffSleepSchedule](self, "_shouldTurnOffSleepSchedule"))
    -[HDSPSleepScheduleModelManager _turnOffSleepSchedule](self, "_turnOffSleepSchedule");

}

- (id)_loadSleepScheduleModel:(id *)a3
{
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading model...", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPSleepScheduleModelManager__loadSleepScheduleModel___block_invoke;
  v9[3] = &unk_24D4E6020;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v9);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __57__HDSPSleepScheduleModelManager__loadSleepScheduleModel___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_locked_loadSleepScheduleModel:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_locked_loadSleepScheduleModel:(id *)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  -[HDSPSleepScheduleModelManager _locked_loadSleepSchedule:](self, "_locked_loadSleepSchedule:", &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2114;
      v30 = v6;
      v19 = v18;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load schedule: %{public}@", buf, 0x16u);

    }
  }
  v25 = 0;
  -[HDSPSleepScheduleModelManager _locked_loadSleepSettings:](self, "_locked_loadSleepSettings:", &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v20;
      v29 = 2114;
      v30 = v9;
      v21 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load settings: %{public}@", buf, 0x16u);

    }
  }
  v24 = 0;
  -[HDSPSleepScheduleModelManager _locked_loadSleepEventRecord:](self, "_locked_loadSleepEventRecord:", &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  if (v12)
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2114;
      v30 = v12;
      v23 = v22;
      _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load record: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x24BEA9930], "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v5, v8, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (v9)
      v15 = v9;
    else
      v15 = v12;
    if (v6)
      v16 = v6;
    else
      v16 = v15;
    *a3 = objc_retainAutorelease(v16);
  }

  return v14;
}

- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  NSObject *v9;
  id v10;
  char v11;
  id v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _BYTE *v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSource");
  v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v25 = v8;
    v10 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleModel: %{public}@ - %{public}@", buf, 0x20u);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__21;
  v27 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v8, "dontNotify") ^ 1;
  else
    v11 = 1;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__HDSPSleepScheduleModelManager_saveSleepScheduleModel_error___block_invoke;
  v15[3] = &unk_24D4E6048;
  v15[4] = self;
  v12 = v6;
  v16 = v12;
  v17 = &v20;
  v18 = buf;
  v19 = v11;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v15);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v13 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __62__HDSPSleepScheduleModelManager_saveSleepScheduleModel_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_locked_saveSleepSchedule:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_locked_saveSleepSettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepEventRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_locked_saveSleepEventRecord:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v5, "success");
  if (v12)
  {
    v12 = objc_msgSend(v8, "success");
    if (v12)
      LOBYTE(v12) = objc_msgSend(v11, "success");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
  objc_msgSend(v5, "error");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    v15 = 0;
    v16 = (void *)v13;
  }
  else
  {
    objc_msgSend(v8, "error");
    v17 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)v17;
    if (v17)
    {
      v15 = 0;
      v16 = (void *)v17;
    }
    else
    {
      objc_msgSend(v11, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v16);
  if (v15)

  if (!v14)
  if (*(_BYTE *)(a1 + 64))
  {
    if ((objc_msgSend(v5, "shouldNotify") & 1) != 0 || (objc_msgSend(v8, "shouldNotify") & 1) != 0)
      v18 = 0;
    else
      v18 = objc_msgSend(v11, "shouldNotify") ^ 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (v18 & 1) == 0)
    {
      objc_msgSend(v5, "changeEvaluation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changeEvaluation", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v20;
      objc_msgSend(v11, "changeEvaluation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:](HDSPSleepScheduleModelChangeEvaluation, "combinedEvaluation:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", v23);
    }
  }

}

- (BOOL)removeSleepScheduleModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[7];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    v8 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] removeSleepScheduleModel %{public}@", buf, 0x16u);

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__21;
  v20 = __Block_byref_object_dispose__21;
  v21 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v6, "dontNotify") ^ 1;
  else
    LOBYTE(v9) = 1;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPSleepScheduleModelManager_removeSleepScheduleModelWithError___block_invoke;
  v12[3] = &unk_24D4E6070;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = buf;
  v13 = v9;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v12);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v10 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __67__HDSPSleepScheduleModelManager_removeSleepScheduleModelWithError___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSchedule:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSettings:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepEventRecord:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "success");
  if (v6)
  {
    v6 = objc_msgSend(v4, "success");
    if (v6)
      LOBYTE(v6) = objc_msgSend(v5, "success");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  objc_msgSend(v3, "error");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = 0;
    v10 = (void *)v7;
  }
  else
  {
    objc_msgSend(v4, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)v11;
    if (v11)
    {
      v9 = 0;
      v10 = (void *)v11;
    }
    else
    {
      objc_msgSend(v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
  if (v9)

  if (!v8)
  if (*(_BYTE *)(a1 + 56))
  {
    if ((objc_msgSend(v3, "shouldNotify") & 1) != 0 || (objc_msgSend(v4, "shouldNotify") & 1) != 0)
      v12 = 0;
    else
      v12 = objc_msgSend(v5, "shouldNotify") ^ 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && (v12 & 1) == 0)
    {
      objc_msgSend(v3, "changeEvaluation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changeEvaluation", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v14;
      objc_msgSend(v5, "changeEvaluation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:](HDSPSleepScheduleModelChangeEvaluation, "combinedEvaluation:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", v17);
    }
  }

}

- (void)_locked_notifyObserversForSleepScheduleModelChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDSPEnvironmentContext *v8;
  HDSPEnvironmentContext *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HKSPObserverSet *observers;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(HDSPEnvironmentContext);
  v9 = v8;

  -[HDSPEnvironmentContext contextByApplyingChangeEvaluation:](v9, "contextByApplyingChangeEvaluation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v12;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepScheduleModel changes from %{public}@", buf, 0x16u);

  }
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke;
  v19[3] = &unk_24D4E6098;
  v19[4] = self;
  v20 = v15;
  v21 = v10;
  v17 = v10;
  v18 = v15;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v19);

}

void __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke_2;
  v9[3] = &unk_24D4E4918;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v4, "perform:withContext:", v9, v7);

}

void __84__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleModelChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager:didUpdateSleepScheduleModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = *(void **)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "sleepSchedule");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sleepScheduleModelManager:didUpdateSleepSchedule:", v3, v4);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = *(void **)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "sleepSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sleepScheduleModelManager:didUpdateSleepSettings:", v6, v7);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "sleepEventRecord");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sleepScheduleModelManager:didUpdateSleepEventRecord:", v9, v10);

    }
  }
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__HDSPSleepScheduleModelManager_sleepScheduleModel__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepScheduleModel *)v2;
}

void __51__HDSPSleepScheduleModelManager_sleepScheduleModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locked_sleepScheduleModel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_locked_sleepScheduleModel
{
  return (id)objc_msgSend(MEMORY[0x24BEA9930], "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", self->_sleepSchedule, self->_sleepSettings, self->_sleepEventRecord);
}

- (id)_loadSleepSchedule:(id *)a3
{
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading schedule...", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__HDSPSleepScheduleModelManager__loadSleepSchedule___block_invoke;
  v9[3] = &unk_24D4E6020;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v9);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __52__HDSPSleepScheduleModelManager__loadSleepSchedule___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_locked_loadSleepSchedule:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_locked_loadSleepSchedule:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadSleepSchedule:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepScheduleModelManager _locked_validateSleepSchedule:generateValidSchedule:](self, "_locked_validateSleepSchedule:generateValidSchedule:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timelineResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "validSleepSchedule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "success") & 1) == 0)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v28 = 138543618;
      v29 = (id)objc_opt_class();
      v30 = 2114;
      v31 = v7;
      v24 = v29;
      _os_log_error_impl(&dword_21610C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] persisted schedule invalid: %{public}@", (uint8_t *)&v28, 0x16u);

    }
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v13)
      {
        v25 = (void *)objc_opt_class();
        v28 = 138543618;
        v29 = v25;
        v30 = 2114;
        v31 = v10;
        v26 = v25;
        _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] persisting valid schedule: %{public}@", (uint8_t *)&v28, 0x16u);

      }
      -[HDSPSleepScheduleModelManager environment](self, "environment");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject sleepStorage](v12, "sleepStorage");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveSleepSchedule:error:", v10, a3);
    }
    else
    {
      if (!v13)
        goto LABEL_10;
      v27 = (void *)objc_opt_class();
      v28 = 138543362;
      v29 = v27;
      v14 = v27;
      _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] no valid schedule could be made", (uint8_t *)&v28, 0xCu);
    }

LABEL_10:
    v15 = v10;

    v7 = v15;
  }
  v16 = *a3;
  HKSPLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      v20 = *a3;
      v28 = 138543618;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      v21 = v19;
      _os_log_error_impl(&dword_21610C000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load schedule with error %{public}@", (uint8_t *)&v28, 0x16u);
LABEL_16:

    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_opt_class();
    v28 = 138543618;
    v29 = v22;
    v30 = 2114;
    v31 = v7;
    v21 = v22;
    _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v28, 0x16u);
    goto LABEL_16;
  }

  objc_storeStrong((id *)&self->_sleepSchedule, v7);
  return v7;
}

- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__HDSPSleepScheduleModelManager_saveSleepSchedule_error___block_invoke;
  v10[3] = &unk_24D4E60C0;
  v12 = &v20;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v13 = &v14;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __57__HDSPSleepScheduleModelManager_saveSleepSchedule_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_locked_saveSleepSchedule:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepSchedule:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  _BYTE v18[24];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v18 = 138543874;
    *(_QWORD *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2114;
    *(_QWORD *)&v18[14] = v6;
    *(_WORD *)&v18[22] = 2114;
    v19 = v8;
    v10 = *(id *)&v18[4];
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepSchedule: %{public}@ - %{public}@", v18, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v8, "dontNotify");
    -[HDSPSleepScheduleModelManager _locked_saveSleepSchedule:](self, "_locked_saveSleepSchedule:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "success");
      goto LABEL_10;
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_saveSleepSchedule:](self, "_locked_saveSleepSchedule:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "shouldNotify", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  if (objc_msgSend(v13, "success") && v14)
  {
    objc_msgSend(v13, "changeEvaluation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelManager _locked_notifyObserversForSleepScheduleChange:](self, "_locked_notifyObserversForSleepScheduleChange:", v15);

  }
LABEL_10:
  if (a4)
  {
    objc_msgSend(v13, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v13, "success", *(_QWORD *)v18, *(_OWORD *)&v18[8], v19);

  return v16;
}

- (id)_locked_saveSleepSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((NAEqualObjects() & 1) != 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);

    }
    +[HDSPSleepScheduleModelSaveResult emptyResult](HDSPSleepScheduleModelSaveResult, "emptyResult");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepSchedule)
    {
      -[HDSPSleepScheduleModelManager _locked_updateSleepSchedule:](self, "_locked_updateSleepSchedule:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HDSPSleepScheduleModelManager _locked_setSleepSchedule:](self, "_locked_setSleepSchedule:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_removeSleepSchedule](self, "_locked_removeSleepSchedule");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_locked_setSleepSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _BOOL8 v12;
  id v13;
  HDSPSleepScheduleModelSaveResult *v14;
  void *v15;
  void *v16;
  HDSPSleepScheduleModelSaveResult *v17;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was created", (uint8_t *)&buf, 0xCu);

  }
  -[HDSPSleepScheduleModelManager _locked_validateSleepSchedule:generateValidSchedule:](self, "_locked_validateSleepSchedule:generateValidSchedule:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "success") & 1) != 0)
  {
    -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__21;
    v28 = __Block_byref_object_dispose__21;
    v10 = MEMORY[0x24BDAC760];
    v29 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke;
    v22[3] = &unk_24D4E3D38;
    v22[4] = self;
    v23 = v9;
    p_buf = &buf;
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke_2;
    v20[3] = &unk_24D4E60E8;
    v20[4] = self;
    v11 = v23;
    v21 = v11;
    v19 = 0;
    v12 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v22, v20, &v19);
    v13 = v19;
    v14 = [HDSPSleepScheduleModelSaveResult alloc];
    v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v16 = v15;
    if (!v15)
    {
      +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v14, "initWithSuccess:changeEvaluation:error:shouldNotify:", v12, v16, v13, 1);
    if (!v15)

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v8);
    v17 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepScheduleAdd:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSchedule___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveSleepSchedule:error:", *(_QWORD *)(a1 + 40), a2);

  return v6;
}

- (id)_locked_updateSleepSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HKSPSleepSchedule *sleepSchedule;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  id v19;
  HDSPSleepScheduleModelSaveResult *v20;
  void *v21;
  void *v22;
  HDSPSleepScheduleModelSaveResult *v23;
  HDSPSleepScheduleModelSaveResult *v24;
  void *v25;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  id v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_opt_class();
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was updated", buf, 0xCu);

  }
  sleepSchedule = self->_sleepSchedule;
  v33 = 0;
  v8 = -[HDSPSleepScheduleModelManager _locked_canApplyChangesFrom:to:error:](self, "_locked_canApplyChangesFrom:to:error:", v4, sleepSchedule, &v33);
  v9 = v33;
  if (v8)
  {
    objc_msgSend(v4, "changeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);

    }
    v14 = (id)-[HKSPSleepSchedule mutableCopy](self->_sleepSchedule, "mutableCopy");
    HKSPApplyChangesToObject();

    -[HDSPSleepScheduleModelManager _locked_validateSleepSchedule:generateValidSchedule:](self, "_locked_validateSleepSchedule:generateValidSchedule:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "success") & 1) != 0)
    {
      -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSavingSleepSchedule:validationResult:](self, "_locked_applyNecessaryChangesBeforeSavingSleepSchedule:validationResult:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v35 = __Block_byref_object_copy__21;
      v36 = __Block_byref_object_dispose__21;
      v17 = MEMORY[0x24BDAC760];
      v37 = 0;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke;
      v30[3] = &unk_24D4E3D38;
      v30[4] = self;
      v31 = v16;
      v32 = buf;
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke_2;
      v28[3] = &unk_24D4E60E8;
      v28[4] = self;
      v14 = v31;
      v29 = v14;
      v27 = 0;
      v18 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v30, v28, &v27);
      v19 = v27;
      v20 = [HDSPSleepScheduleModelSaveResult alloc];
      v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v22 = v21;
      if (!v21)
      {
        +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v23 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v20, "initWithSuccess:changeEvaluation:error:shouldNotify:", v18, v22, v19, 1);
      if (!v21)

      _Block_object_dispose(buf, 8);
    }
    else
    {
      objc_msgSend(v15, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v25);
      v23 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();

    }
    v24 = v23;

    v4 = v14;
  }
  else
  {
    +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v9);
    v24 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

void __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepScheduleUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSchedule___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "saveSleepScheduleChanges:error:", v6, a2);

  return v7;
}

- (id)_locked_applyNecessaryChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleModelManager _locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:validationResult:](self, "_locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:validationResult:", v7, v6);

  return v7;
}

- (void)_locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule:(id)a3 validationResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(void);
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  void *v37;
  id v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepEventRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v7, "timelineResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v11, "snoozeFireDateNeedsReset");
  if ((_DWORD)v7)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (id)objc_opt_class();
      v13 = v68;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting snooze fire date", buf, 0xCu);

    }
    objc_msgSend(v10, "setWakeUpAlarmSnoozedUntilDate:", 0);
  }
  objc_msgSend(v6, "changeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEA9448];
  v16 = objc_msgSend(v14, "hasChangeForPropertyIdentifier:", *MEMORY[0x24BEA9448]);

  if (v16)
  {
    objc_msgSend(v6, "changeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "originalValueForPropertyIdentifier:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "changeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "changedValueForPropertyIdentifier:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v18;
    if (!v18)
    {
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wakeUpComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", v22);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "wakeUpComponents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateFromComponents:", v23);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v62 = 0;
    }
    -[HDSPSleepScheduleModelManager environment](self, "environment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentDateProvider");
    v25 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v25[2]();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v21;
    v27 = objc_msgSend(v21, "isDate:inSameDayAsDate:", v63, v26);
    objc_msgSend(v8, "previousResolvedOccurrenceBeforeDate:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wakeUpEvent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dueDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v28;
    objc_msgSend(v28, "occurrence");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v30;
    if (objc_msgSend(v31, "isSingleDayOverride"))
      v32 = objc_msgSend(v30, "hksp_isBeforeOrSameAsDate:", v26);
    else
      v32 = 0;

    if (v20)
    {
      v33 = v62;
      if (objc_msgSend(v62, "hksp_isAfterDate:", v26))
        v34 = objc_msgSend(v60, "isDate:inSameDayAsDate:", v62, v26) ^ 1;
      else
        v34 = 0;
    }
    else
    {
      v34 = 0;
      v33 = v62;
    }
    if (v20)
      v35 = v34;
    else
      v35 = 1;
    if ((v27 & v32) != 1 || !v35)
    {
LABEL_36:

      goto LABEL_37;
    }
    if (v34)
    {
      HKSPLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v68 = v37;
        v69 = 2114;
        v70 = v63;
        v71 = 2114;
        v72 = v33;
        v38 = v37;
        v39 = "[%{public}@] override that happened today (%{public}@) moving to the future (%{public}@)";
        v40 = v36;
        v41 = 32;
LABEL_29:
        _os_log_impl(&dword_21610C000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);

      }
    }
    else
    {
      if (v20)
      {
LABEL_31:
        objc_msgSend(v10, "setWakeUpOverriddenDate:", v30);
        HKSPLogForCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)objc_opt_class();
          v45 = v44;
          objc_msgSend(v10, "wakeUpOverriddenDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v44;
          v69 = 2114;
          v70 = v46;
          _os_log_impl(&dword_21610C000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] set wakeUpOverriddenDate to %{public}@", buf, 0x16u);

        }
        v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v10, "wakeUpConfirmedUntilDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "na_safeAddObject:", v48);

        objc_msgSend(v8, "computeConfirmedWakeUpUntilDateForOverrideWakeUpDate:", v63);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "na_safeAddObject:", v49);

        objc_msgSend(MEMORY[0x24BDBCE60], "hksp_latestFromDates:", v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWakeUpConfirmedUntilDate:", v50);

        HKSPLogForCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = (void *)objc_opt_class();
          v58 = v52;
          objc_msgSend(v10, "wakeUpConfirmedUntilDate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v52;
          v69 = 2114;
          v70 = v53;
          _os_log_impl(&dword_21610C000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] set wakeUpConfirmedUntilDate to %{public}@", buf, 0x16u);

        }
        v33 = v62;
        goto LABEL_36;
      }
      HKSPLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v68 = v42;
        v69 = 2114;
        v70 = v63;
        v38 = v42;
        v39 = "[%{public}@] override that happened today (%{public}@) deleted";
        v40 = v36;
        v41 = 22;
        goto LABEL_29;
      }
    }

    goto LABEL_31;
  }
LABEL_38:
  objc_msgSend(v10, "changeSet");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "changes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count");

  if (v56)
  {
    -[HDSPSleepScheduleModelManager environment](self, "environment");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __116__HDSPSleepScheduleModelManager__locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule_validationResult___block_invoke;
    v65[3] = &unk_24D4E3680;
    v65[4] = self;
    v66 = v10;
    objc_msgSend(v57, "perform:withSource:", v65, self);

  }
}

uint64_t __116__HDSPSleepScheduleModelManager__locked_applyNecessaryEventRecordChangesBeforeSavingSleepSchedule_validationResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepEventRecord:error:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_locked_validateSleepSchedule:(id)a3 generateValidSchedule:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  HDSPSleepScheduleModelValidationResult *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  id v24;
  id v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "occurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "occurrences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "na_all:", &__block_literal_global_29);

    if ((v9 & 1) == 0)
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v26 = 138543362;
        v27 = (id)objc_opt_class();
        v25 = v27;
        _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] sleep schedule validation failed due to invalid occurrence", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "hksp_validationErrorWithReason:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSPSleepScheduleModelValidationResult emptyFailureWithError:](HDSPSleepScheduleModelValidationResult, "emptyFailureWithError:", v11);
      v12 = (HDSPSleepScheduleModelValidationResult *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BEA9930], "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v6, self->_sleepSettings, self->_sleepEventRecord);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BEA9908];
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDateProvider");
  v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v16[2]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "builderWithSleepScheduleModel:date:", v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v19 = 7;
  else
    v19 = 3;
  objc_msgSend(v18, "buildTimelineWithOptions:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v11, "sleepScheduleInvalid");
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hksp_validationErrorWithReason:", objc_msgSend(v11, "sleepScheduleInvalidReason"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = 138543618;
      v27 = (id)objc_opt_class();
      v28 = 2114;
      v29 = v21;
      v24 = v27;
      _os_log_error_impl(&dword_21610C000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] sleep schedule validation failed: %{public}@", (uint8_t *)&v26, 0x16u);

    }
  }
  else
  {
    v21 = 0;
  }
  v12 = -[HDSPSleepScheduleModelValidationResult initWithSuccess:timelineResults:error:]([HDSPSleepScheduleModelValidationResult alloc], "initWithSuccess:timelineResults:error:", v20 ^ 1u, v11, v21);

LABEL_16:
  return v12;
}

uint64_t __85__HDSPSleepScheduleModelManager__locked_validateSleepSchedule_generateValidSchedule___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValidOccurrence");
}

- (id)_locked_removeSleepSchedule
{
  NSObject *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  HDSPSleepScheduleModelSaveResult *v8;
  void *v9;
  void *v10;
  HDSPSleepScheduleModelSaveResult *v11;
  void *v12;
  id v14;
  _QWORD v15[5];
  _QWORD v16[6];
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule was deleted", (uint8_t *)&buf, 0xCu);

  }
  -[HDSPSleepScheduleModelManager _locked_resetSleepEventRecord](self, "_locked_resetSleepEventRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "success") & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__21;
    v20 = __Block_byref_object_dispose__21;
    v21 = 0;
    v15[4] = self;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke;
    v16[3] = &unk_24D4E34C0;
    v16[4] = self;
    v16[5] = &buf;
    v14 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke_2;
    v15[3] = &unk_24D4E6150;
    v6 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v16, v15, &v14);
    v7 = v14;
    v8 = [HDSPSleepScheduleModelSaveResult alloc];
    v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v10 = v9;
    if (!v9)
    {
      +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v8, "initWithSuccess:changeEvaluation:error:shouldNotify:", v6, v10, v7, 1);
    if (!v9)

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v12);
    v11 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepScheduleRemove");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __60__HDSPSleepScheduleModelManager__locked_removeSleepSchedule__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "removeSleepScheduleWithError:", a2);

  return v5;
}

- (void)notifyObserversForSleepScheduleChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleModelManager_notifyObserversForSleepScheduleChange___block_invoke;
  v6[3] = &unk_24D4E3680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v6);

}

uint64_t __71__HDSPSleepScheduleModelManager_notifyObserversForSleepScheduleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleChange:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepScheduleChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDSPEnvironmentContext *v8;
  HDSPEnvironmentContext *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HKSPObserverSet *observers;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(HDSPEnvironmentContext);
  v9 = v8;

  -[HDSPEnvironmentContext contextByApplyingChangeEvaluation:](v9, "contextByApplyingChangeEvaluation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v12;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepSchedule change from %{public}@", buf, 0x16u);

  }
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke;
  v19[3] = &unk_24D4E6098;
  v19[4] = self;
  v20 = v15;
  v21 = v10;
  v17 = v10;
  v18 = v15;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v19);

}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke_2;
  v9[3] = &unk_24D4E4918;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v4, "perform:withContext:", v9, v7);

}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepScheduleChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager:didUpdateSleepScheduleModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sleepSchedule");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sleepScheduleModelManager:didUpdateSleepSchedule:", v3, v4);

  }
}

- (HKSPSleepSchedule)sleepSchedule
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepScheduleModelManager_sleepSchedule__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepSchedule *)v2;
}

void __46__HDSPSleepScheduleModelManager_sleepSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_loadSleepSettings:(id *)a3
{
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading settings...", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__HDSPSleepScheduleModelManager__loadSleepSettings___block_invoke;
  v9[3] = &unk_24D4E6020;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v9);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __52__HDSPSleepScheduleModelManager__loadSleepSettings___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_locked_loadSleepSettings:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_locked_loadSleepSettings:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadSleepSettings:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *a3;
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *a3;
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v13 = v11;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load settings with error %{public}@", (uint8_t *)&v15, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v7;
    v13 = v16;
    _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }

  objc_storeStrong((id *)&self->_sleepSettings, v7);
  return v7;
}

- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__HDSPSleepScheduleModelManager_saveSleepSettings_error___block_invoke;
  v10[3] = &unk_24D4E60C0;
  v12 = &v20;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v13 = &v14;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __57__HDSPSleepScheduleModelManager_saveSleepSettings_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_locked_saveSleepSettings:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  _BYTE v18[24];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v18 = 138543874;
    *(_QWORD *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2114;
    *(_QWORD *)&v18[14] = v6;
    *(_WORD *)&v18[22] = 2114;
    v19 = v8;
    v10 = *(id *)&v18[4];
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepSettings: %{public}@ - %{public}@", v18, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v8, "dontNotify");
    -[HDSPSleepScheduleModelManager _locked_saveSleepSettings:](self, "_locked_saveSleepSettings:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "success");
      goto LABEL_10;
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_saveSleepSettings:](self, "_locked_saveSleepSettings:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "shouldNotify", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  if (objc_msgSend(v13, "success") && v14)
  {
    objc_msgSend(v13, "changeEvaluation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelManager _locked_notifyObserversForSleepSettingsChange:](self, "_locked_notifyObserversForSleepSettingsChange:", v15);

  }
LABEL_10:
  if (a4)
  {
    objc_msgSend(v13, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v13, "success", *(_QWORD *)v18, *(_OWORD *)&v18[8], v19);

  return v16;
}

- (id)_locked_saveSleepSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((NAEqualObjects() & 1) != 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);

    }
    +[HDSPSleepScheduleModelSaveResult emptyResult](HDSPSleepScheduleModelSaveResult, "emptyResult");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepSettings)
    {
      -[HDSPSleepScheduleModelManager _locked_updateSleepSettings:](self, "_locked_updateSleepSettings:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HDSPSleepScheduleModelManager _locked_setSleepSettings:](self, "_locked_setSleepSettings:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_resetSleepSettings](self, "_locked_resetSleepSettings");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_locked_setSleepSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BOOL8 v11;
  id v12;
  HDSPSleepScheduleModelSaveResult *v13;
  void *v14;
  void *v15;
  HDSPSleepScheduleModelSaveResult *v16;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were created", (uint8_t *)&buf, 0xCu);

  }
  -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__21;
  v27 = __Block_byref_object_dispose__21;
  v9 = MEMORY[0x24BDAC760];
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke;
  v21[3] = &unk_24D4E3D38;
  v21[4] = self;
  v22 = v8;
  p_buf = &buf;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke_2;
  v19[3] = &unk_24D4E60E8;
  v19[4] = self;
  v10 = v22;
  v20 = v10;
  v18 = 0;
  v11 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v21, v19, &v18);
  v12 = v18;
  v13 = [HDSPSleepScheduleModelSaveResult alloc];
  v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v15 = v14;
  if (!v14)
  {
    +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v13, "initWithSuccess:changeEvaluation:error:shouldNotify:", v11, v15, v12, 1);
  if (!v14)

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepSettingsAdd:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __58__HDSPSleepScheduleModelManager__locked_setSleepSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveSleepSettings:error:", *(_QWORD *)(a1 + 40), a2);

  return v6;
}

- (id)_locked_updateSleepSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HKSPSleepSettings *sleepSettings;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  id v18;
  HDSPSleepScheduleModelSaveResult *v19;
  void *v20;
  void *v21;
  HDSPSleepScheduleModelSaveResult *v22;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _BYTE *v29;
  id v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_opt_class();
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were updated", buf, 0xCu);

  }
  sleepSettings = self->_sleepSettings;
  v30 = 0;
  v8 = -[HDSPSleepScheduleModelManager _locked_canApplyChangesFrom:to:error:](self, "_locked_canApplyChangesFrom:to:error:", v4, sleepSettings, &v30);
  v9 = v30;
  if (v8)
  {
    objc_msgSend(v4, "changeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);

    }
    v14 = (void *)-[HKSPSleepSettings mutableCopy](self->_sleepSettings, "mutableCopy");
    HKSPApplyChangesToObject();

    -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__21;
    v33 = __Block_byref_object_dispose__21;
    v16 = MEMORY[0x24BDAC760];
    v34 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke;
    v27[3] = &unk_24D4E3D38;
    v27[4] = self;
    v28 = v15;
    v29 = buf;
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke_2;
    v25[3] = &unk_24D4E60E8;
    v25[4] = self;
    v4 = v28;
    v26 = v4;
    v24 = 0;
    v17 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v27, v25, &v24);
    v18 = v24;
    v19 = [HDSPSleepScheduleModelSaveResult alloc];
    v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v21 = v20;
    if (!v20)
    {
      +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v19, "initWithSuccess:changeEvaluation:error:shouldNotify:", v17, v21, v18, 1);
    if (!v20)

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v9);
    v22 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepSettingsUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __61__HDSPSleepScheduleModelManager__locked_updateSleepSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "saveSleepSettingsChanges:error:", v6, a2);

  return v7;
}

- (id)_locked_resetSleepSettings
{
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings were reset", (uint8_t *)&v8, 0xCu);

  }
  v5 = objc_alloc_init(MEMORY[0x24BEA9948]);
  -[HDSPSleepScheduleModelManager _locked_setSleepSettings:](self, "_locked_setSleepSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)notifyObserversForSleepSettingsChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleModelManager_notifyObserversForSleepSettingsChange___block_invoke;
  v6[3] = &unk_24D4E3680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v6);

}

uint64_t __71__HDSPSleepScheduleModelManager_notifyObserversForSleepSettingsChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepSettingsChange:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepSettingsChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDSPEnvironmentContext *v8;
  HDSPEnvironmentContext *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HKSPObserverSet *observers;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(HDSPEnvironmentContext);
  v9 = v8;

  -[HDSPEnvironmentContext contextByApplyingChangeEvaluation:](v9, "contextByApplyingChangeEvaluation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v12;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepSettings change from %{public}@", buf, 0x16u);

  }
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke;
  v19[3] = &unk_24D4E6098;
  v19[4] = self;
  v20 = v15;
  v21 = v10;
  v17 = v10;
  v18 = v15;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v19);

}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke_2;
  v9[3] = &unk_24D4E4918;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v4, "perform:withContext:", v9, v7);

}

void __79__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepSettingsChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager:didUpdateSleepScheduleModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sleepSettings");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sleepScheduleModelManager:didUpdateSleepSettings:", v3, v4);

  }
}

- (id)_loadSleepEventRecord:(id *)a3
{
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading event record...", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__HDSPSleepScheduleModelManager__loadSleepEventRecord___block_invoke;
  v9[3] = &unk_24D4E6020;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v9);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __55__HDSPSleepScheduleModelManager__loadSleepEventRecord___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_locked_loadSleepEventRecord:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_locked_loadSleepEventRecord:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadSleepEventRecord:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *a3;
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *a3;
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v13 = v11;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load event record with error %{public}@", (uint8_t *)&v15, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v7;
    v13 = v16;
    _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded %{public}@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }

  objc_storeStrong((id *)&self->_sleepEventRecord, v7);
  return v7;
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__HDSPSleepScheduleModelManager_saveSleepEventRecord_error___block_invoke;
  v10[3] = &unk_24D4E60C0;
  v12 = &v20;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v13 = &v14;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __60__HDSPSleepScheduleModelManager_saveSleepEventRecord_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_locked_saveSleepEventRecord:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4
{
  return -[HDSPSleepScheduleModelManager _locked_saveSleepEventRecord:error:preNotifyBlock:](self, "_locked_saveSleepEventRecord:error:preNotifyBlock:", a3, a4, &__block_literal_global_217);
}

uint64_t __68__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__21;
  v23 = __Block_byref_object_dispose__21;
  v24 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__HDSPSleepScheduleModelManager_saveSleepEventRecord_error_preNotifyBlock___block_invoke;
  v14[3] = &unk_24D4E61B8;
  v17 = &v25;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v18 = &v19;
  v11 = v9;
  v16 = v11;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __75__HDSPSleepScheduleModelManager_saveSleepEventRecord_error_preNotifyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_locked_saveSleepEventRecord:error:preNotifyBlock:", v3, &obj, v4);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_locked_saveSleepEventRecord:(id)a3 error:(id *)a4 preNotifyBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  HDSPSleepScheduleModelManager *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v28 = (id)objc_opt_class();
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = v11;
    v13 = v28;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSleepEventRecord: %{public}@ - %{public}@", buf, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(v11, "dontNotify");
    -[HDSPSleepScheduleModelManager _locked_saveSleepEventRecord:](self, "_locked_saveSleepEventRecord:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) != 0)
    {
      v16 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_saveSleepEventRecord:](self, "_locked_saveSleepEventRecord:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldNotify");
LABEL_8:
  if (objc_msgSend(v15, "success"))
  {
    v9[2](v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __83__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error_preNotifyBlock___block_invoke;
      v24 = &unk_24D4E61E0;
      v25 = self;
      v26 = v15;
      v18 = (id)objc_msgSend(v17, "addCompletionBlock:", &v21);

    }
  }
  if (a4)
  {
    objc_msgSend(v15, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(v15, "success", v21, v22, v23, v24, v25);

  return v19;
}

void __83__HDSPSleepScheduleModelManager__locked_saveSleepEventRecord_error_preNotifyBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "changeEvaluation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_locked_notifyObserversForSleepEventRecordChange:", v2);

}

- (id)_locked_saveSleepEventRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((NAEqualObjects() & 1) != 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] no changes to save", (uint8_t *)&v10, 0xCu);

    }
    +[HDSPSleepScheduleModelSaveResult emptyResult](HDSPSleepScheduleModelSaveResult, "emptyResult");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_sleepEventRecord)
    {
      -[HDSPSleepScheduleModelManager _locked_updateSleepEventRecord:](self, "_locked_updateSleepEventRecord:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HDSPSleepScheduleModelManager _locked_setSleepEventRecord:](self, "_locked_setSleepEventRecord:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HDSPSleepScheduleModelManager _locked_resetSleepEventRecord](self, "_locked_resetSleepEventRecord");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_locked_updateSleepEventRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HKSPSleepEventRecord *sleepEventRecord;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  id v18;
  HDSPSleepScheduleModelSaveResult *v19;
  void *v20;
  void *v21;
  HDSPSleepScheduleModelSaveResult *v22;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _BYTE *v29;
  id v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_opt_class();
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was updated", buf, 0xCu);

  }
  sleepEventRecord = self->_sleepEventRecord;
  v30 = 0;
  v8 = -[HDSPSleepScheduleModelManager _locked_canApplyChangesFrom:to:error:](self, "_locked_canApplyChangesFrom:to:error:", v4, sleepEventRecord, &v30);
  v9 = v30;
  if (v8)
  {
    objc_msgSend(v4, "changeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] applying changes: %{public}@", buf, 0x16u);

    }
    v14 = (void *)-[HKSPSleepEventRecord mutableCopy](self->_sleepEventRecord, "mutableCopy");
    HKSPApplyChangesToObject();

    -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSavingSleepEventRecord:](self, "_locked_applyNecessaryChangesBeforeSavingSleepEventRecord:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__21;
    v33 = __Block_byref_object_dispose__21;
    v16 = MEMORY[0x24BDAC760];
    v34 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke;
    v27[3] = &unk_24D4E3D38;
    v27[4] = self;
    v28 = v15;
    v29 = buf;
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke_2;
    v25[3] = &unk_24D4E60E8;
    v25[4] = self;
    v4 = v28;
    v26 = v4;
    v24 = 0;
    v17 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v27, v25, &v24);
    v18 = v24;
    v19 = [HDSPSleepScheduleModelSaveResult alloc];
    v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v21 = v20;
    if (!v20)
    {
      +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v19, "initWithSuccess:changeEvaluation:error:shouldNotify:", v17, v21, v18, 1);
    if (!v20)

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[HDSPSleepScheduleModelSaveResult saveFailedWithError:](HDSPSleepScheduleModelSaveResult, "saveFailedWithError:", v9);
    v22 = (HDSPSleepScheduleModelSaveResult *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepRecordUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __64__HDSPSleepScheduleModelManager__locked_updateSleepEventRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "saveSleepEventRecordChanges:error:", v6, a2);

  return v7;
}

- (id)_locked_applyNecessaryChangesBeforeSavingSleepEventRecord:(id)a3
{
  void *v4;

  -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleModelManager _locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:](self, "_locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:", v4);
  return v4;
}

- (void)_locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "changeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasChangeForPropertyIdentifier:", *MEMORY[0x24BEA9578]))
  {
    v9 = objc_msgSend(v4, "isAnySleepCoachingOnboardingCompleted");

    if (v9)
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = (id)objc_opt_class();
        v11 = v24;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep coaching completed, enabling dnd during wind down", buf, 0xCu);

      }
      objc_msgSend(v7, "setSleepModeOptions:", objc_msgSend(v7, "sleepModeOptions") | 0x840);
    }
  }
  else
  {

  }
  objc_msgSend(v4, "changeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasChangeForPropertyIdentifier:", *MEMORY[0x24BEA9730]))
  {
    v13 = objc_msgSend(v4, "isAnySleepTrackingOnboardingCompleted");

    if (v13)
    {
      HKSPLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        v16 = v15;
        _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking completed, enabling watch screen", buf, 0xCu);

      }
      objc_msgSend(v7, "setSleepModeOptions:", objc_msgSend(v7, "sleepModeOptions") | 4);
    }
  }
  else
  {

  }
  objc_msgSend(v7, "changeSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "changes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[HDSPSleepScheduleModelManager environment](self, "environment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __104__HDSPSleepScheduleModelManager__locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord___block_invoke;
    v21[3] = &unk_24D4E3680;
    v21[4] = self;
    v22 = v7;
    objc_msgSend(v20, "perform:withSource:", v21, self);

  }
}

uint64_t __104__HDSPSleepScheduleModelManager__locked_applyNecessarySleepSettingsChangesBeforeSavingSleepEventRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_saveSleepSettings:error:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_locked_setSleepEventRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BOOL8 v11;
  id v12;
  HDSPSleepScheduleModelSaveResult *v13;
  void *v14;
  void *v15;
  HDSPSleepScheduleModelSaveResult *v16;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was created", (uint8_t *)&buf, 0xCu);

  }
  -[HDSPSleepScheduleModelManager _locked_applyNecessaryChangesBeforeSaving:](self, "_locked_applyNecessaryChangesBeforeSaving:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__21;
  v27 = __Block_byref_object_dispose__21;
  v9 = MEMORY[0x24BDAC760];
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke;
  v21[3] = &unk_24D4E3D38;
  v21[4] = self;
  v22 = v8;
  p_buf = &buf;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke_2;
  v19[3] = &unk_24D4E60E8;
  v19[4] = self;
  v10 = v22;
  v20 = v10;
  v18 = 0;
  v11 = -[HDSPSleepScheduleModelManager _locked_updateModelWithBlock:persistBlock:error:](self, "_locked_updateModelWithBlock:persistBlock:error:", v21, v19, &v18);
  v12 = v18;
  v13 = [HDSPSleepScheduleModelSaveResult alloc];
  v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v15 = v14;
  if (!v14)
  {
    +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[HDSPSleepScheduleModelSaveResult initWithSuccess:changeEvaluation:error:shouldNotify:](v13, "initWithSuccess:changeEvaluation:error:shouldNotify:", v11, v15, v12, 1);
  if (!v14)

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateSleepRecordAdd:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __61__HDSPSleepScheduleModelManager__locked_setSleepEventRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveSleepEventRecord:error:", *(_QWORD *)(a1 + 40), a2);

  return v6;
}

- (id)_locked_resetSleepEventRecord
{
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event record was reset", (uint8_t *)&v8, 0xCu);

  }
  v5 = objc_alloc_init(MEMORY[0x24BEA9900]);
  -[HDSPSleepScheduleModelManager _locked_setSleepEventRecord:](self, "_locked_setSleepEventRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_locked_updateModelWithBlock:(id)a3 persistBlock:(id)a4 error:(id *)a5
{
  void (**v7)(_QWORD);
  int v8;
  id v9;
  NSObject *v10;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(_QWORD))a3;
  v14 = 0;
  v8 = (*((uint64_t (**)(id, id *))a4 + 2))(a4, &v14);
  v9 = v14;
  if (v8)
  {
    v7[2](v7);
  }
  else if (a5)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v9;
      v13 = v12;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] save failed with error: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEA9590], 2, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_locked_canApplyChangesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lastModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastModifiedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || v9 && !objc_msgSend(v9, "hksp_isBeforeDate:", v10))
    goto LABEL_7;
  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138544386;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v9;
    v12 = v16;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] trying to update %{public}@ (last modified: %{public}@) to %{public}@ (last modified: %{public}@), seeing if we can resolve changes", (uint8_t *)&v15, 0x34u);

  }
  if ((HKSPCanResolveChangesToObject() & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEA9590], 1, 0);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
LABEL_7:
    v13 = 1;
  }

  return v13;
}

- (id)_locked_applyNecessaryChangesBeforeSaving:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDateProvider");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastModifiedDate:", v7);

  return v4;
}

- (void)notifyObserversForSleepEventRecordChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__HDSPSleepScheduleModelManager_notifyObserversForSleepEventRecordChange___block_invoke;
  v6[3] = &unk_24D4E3680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v6);

}

uint64_t __74__HDSPSleepScheduleModelManager_notifyObserversForSleepEventRecordChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepEventRecordChange:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_notifyObserversForSleepEventRecordChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDSPEnvironmentContext *v8;
  HDSPEnvironmentContext *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HKSPObserverSet *observers;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(HDSPEnvironmentContext);
  v9 = v8;

  -[HDSPEnvironmentContext contextByApplyingChangeEvaluation:](v9, "contextByApplyingChangeEvaluation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v12;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepEventRecord change from %{public}@", buf, 0x16u);

  }
  -[HDSPSleepScheduleModelManager _locked_sleepScheduleModel](self, "_locked_sleepScheduleModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke;
  v19[3] = &unk_24D4E6098;
  v19[4] = self;
  v20 = v15;
  v21 = v10;
  v17 = v10;
  v18 = v15;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v19);

}

void __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke_2;
  v9[3] = &unk_24D4E4918;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v4, "perform:withContext:", v9, v7);

}

void __82__HDSPSleepScheduleModelManager__locked_notifyObserversForSleepEventRecordChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager:didUpdateSleepScheduleModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sleepEventRecord");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sleepScheduleModelManager:didUpdateSleepEventRecord:", v3, v4);

  }
}

- (NSString)providerIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HDSPSleepScheduleModelManager _earliestDateToScheduleEventsForDate:](self, "_earliestDateToScheduleEventsForDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleModelManager sleepScheduleModel](self, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upcomingEventsDueAfterDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_earliestDateToScheduleEventsForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HDSPSleepScheduleModelManager sleepEventRecord](self, "sleepEventRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wakeUpAlarmDismissedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hksp_isAfterDate:", v4))
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (void)significantTimeChangeDetected:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  char v56;
  char v57;
  char v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v60 = (id)objc_opt_class();
    v5 = v60;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);

  }
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDateProvider");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepScheduleModelManager sleepSchedule](self, "sleepSchedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[HDSPSleepScheduleModelManager sleepSettings](self, "sleepSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[HDSPSleepScheduleModelManager sleepEventRecord](self, "sleepEventRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v10, "lastModifiedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hksp_isAfterDate:", v8);

  if (v16)
  {
    HKSPLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v18;
      v19 = v18;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on schedule to current date because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v10, "setLastModifiedDate:", v8);
  }
  objc_msgSend(v12, "lastModifiedDate", v50);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hksp_isAfterDate:", v8);

  if (v21)
  {
    HKSPLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v23;
      v24 = v23;
      _os_log_impl(&dword_21610C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on settings to current date because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v12, "setLastModifiedDate:", v8);
  }
  objc_msgSend(v14, "wakeUpEarlyNotificationConfirmedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v25, "hksp_isAfterDate:", v8);

  if ((_DWORD)v26)
  {
    HKSPLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      v29 = v28;
      _os_log_impl(&dword_21610C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting wakeUpEarlyNotificationConfirmedDate because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v14, "setWakeUpEarlyNotificationConfirmedDate:", 0);
    objc_msgSend(v14, "setWakeUpConfirmedUntilDate:", 0);
  }
  objc_msgSend(v14, "wakeUpOverriddenDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hksp_isAfterDate:", v8);

  if (v31)
  {
    HKSPLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v32;
      v33 = v32;
      _os_log_impl(&dword_21610C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting wakeUpOverriddenDate because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v14, "setWakeUpOverriddenDate:", 0);
    objc_msgSend(v14, "setWakeUpConfirmedUntilDate:", 0);
    LOBYTE(v26) = 1;
  }
  objc_msgSend(v14, "lastModifiedDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "hksp_isAfterDate:", v8);

  if (v35)
  {
    HKSPLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v36;
      v37 = v36;
      _os_log_impl(&dword_21610C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastModifiedDate on event record to current date because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v14, "setLastModifiedDate:", v8);
    LOBYTE(v26) = 1;
  }
  objc_msgSend(v14, "wakeUpAlarmDismissedDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "hksp_isAfterDate:", v8);

  if (v39)
  {
    HKSPLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v40;
      v41 = v40;
      _os_log_impl(&dword_21610C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting wakeUpAlarmDismissedDate on event record to current date because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v14, "setWakeUpAlarmDismissedDate:", v8);
    LOBYTE(v26) = 1;
  }
  objc_msgSend(v14, "goodMorningDismissedDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "hksp_isAfterDate:", v8);

  if (v43)
  {
    HKSPLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v60 = v44;
      v45 = v44;
      _os_log_impl(&dword_21610C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting goodMorningDismissedDate on event record to current date because it's in the future", buf, 0xCu);

    }
    objc_msgSend(v14, "setGoodMorningDismissedDate:", v8);
    LOBYTE(v26) = 1;
  }
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __63__HDSPSleepScheduleModelManager_significantTimeChangeDetected___block_invoke;
  v52[3] = &unk_24D4E6208;
  v56 = v16;
  v52[4] = self;
  v53 = v10;
  v57 = v21;
  v58 = (char)v26;
  v54 = v12;
  v55 = v14;
  v47 = v14;
  v48 = v12;
  v49 = v10;
  objc_msgSend(v46, "perform:withSource:", v52, v51);

}

uint64_t __63__HDSPSleepScheduleModelManager_significantTimeChangeDetected___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 64))
    result = objc_msgSend(*(id *)(result + 32), "saveSleepSchedule:error:", *(_QWORD *)(result + 40), 0);
  if (*(_BYTE *)(v1 + 65))
    result = objc_msgSend(*(id *)(v1 + 32), "saveSleepSettings:error:", *(_QWORD *)(v1 + 48), 0);
  if (*(_BYTE *)(v1 + 66))
    return objc_msgSend(*(id *)(v1 + 32), "saveSleepEventRecord:error:", *(_QWORD *)(v1 + 56), 0);
  return result;
}

- (NSSet)observedApplicationBundleIdentifiers
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDD4608], *MEMORY[0x24BEA9410], 0);
}

- (void)observedApplicationDidUninstall:(id)a3
{
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] observedApplicationDidUninstall", v6, 0xCu);

  }
  if (-[HDSPSleepScheduleModelManager _shouldTurnOffWatchSleepFeatures](self, "_shouldTurnOffWatchSleepFeatures"))
    -[HDSPSleepScheduleModelManager _turnOffWatchSleepFeatures](self, "_turnOffWatchSleepFeatures");
  if (-[HDSPSleepScheduleModelManager _shouldTurnOffSleepSchedule](self, "_shouldTurnOffSleepSchedule", *(_OWORD *)v6))
    -[HDSPSleepScheduleModelManager _turnOffSleepSchedule](self, "_turnOffSleepSchedule");
}

- (BOOL)_shouldTurnOffWatchSleepFeatures
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAppleWatch"))
  {
    objc_msgSend(WeakRetained, "systemMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationWorkspaceMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isApplicationInstalled:", *MEMORY[0x24BEA9410]) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_turnOffWatchSleepFeatures
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepScheduleModelManager sleepSettings](self, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "watchSleepFeaturesEnabled"))
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      v5 = v12;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off watch sleep features since sleep app was removed", buf, 0xCu);

    }
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "setWatchSleepFeaturesEnabled:", 0);
    -[HDSPSleepScheduleModelManager environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__HDSPSleepScheduleModelManager__turnOffWatchSleepFeatures__block_invoke;
    v9[3] = &unk_24D4E3680;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "perform:withSource:", v9, self);

  }
}

void __59__HDSPSleepScheduleModelManager__turnOffWatchSleepFeatures__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v4 = objc_msgSend(v2, "saveSleepSettings:error:", v3, &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to turn off watch sleep features with error %{public}@", buf, 0x16u);

    }
  }

}

- (BOOL)_shouldTurnOffSleepSchedule
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAppleWatch") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "systemMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationWorkspaceMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isApplicationInstalled:", *MEMORY[0x24BDD4608]) ^ 1;

  }
  return v4;
}

- (void)_turnOffSleepSchedule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[HDSPSleepScheduleModelManager sleepSettings](self, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "setShareAcrossDevices:", 0);
  -[HDSPSleepScheduleModelManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HDSPSleepScheduleModelManager__turnOffSleepSchedule__block_invoke;
  v7[3] = &unk_24D4E3680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "perform:withSource:", v7, self);

}

void __54__HDSPSleepScheduleModelManager__turnOffSleepSchedule__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  v4 = objc_msgSend(v2, "saveSleepSettings:error:", v3, &v18);
  v5 = v18;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEnabled"))
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v20 = v8;
        v9 = v8;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off sleep schedule since Health app was removed", buf, 0xCu);

      }
      v10 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v10, "setEnabled:", 0);
      v11 = *(void **)(a1 + 32);
      v17 = v5;
      v12 = objc_msgSend(v11, "saveSleepSchedule:error:", v10, &v17);
      v13 = v17;

      if ((v12 & 1) == 0)
      {
        HKSPLogForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v20 = v15;
          v21 = 2114;
          v22 = v13;
          v16 = v15;
          _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] failed to turn off sleep schedule with error %{public}@", buf, 0x16u);

        }
      }

      v5 = v13;
    }

  }
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)sleepStorageDidChangeExternally:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepStorageDidChangeExternally", buf, 0xCu);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke;
  v8[3] = &unk_24D4E3680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HDSPSleepScheduleModelManager _withLock:](self, "_withLock:", v8);

}

void __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v17 = 0;
  v3 = (id)objc_msgSend(v2, "_locked_loadSleepScheduleModel:", &v17);
  v4 = v17;
  if (v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v4;
      v7 = v6;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to load sleep schedule after sync with error %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v8 = *(_QWORD **)(a1 + 32);
    v9 = (void *)v8[8];
    objc_msgSend(v8, "_locked_sleepScheduleModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "evaluateSleepScheduleModelChange:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke_2;
    v15[3] = &unk_24D4E3680;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15[4] = v13;
    v16 = v11;
    v5 = v11;
    objc_msgSend(v12, "perform:withSource:", v15, v14);

  }
}

uint64_t __65__HDSPSleepScheduleModelManager_sleepStorageDidChangeExternally___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_notifyObserversForSleepScheduleModelChange:", *(_QWORD *)(a1 + 40));
}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepScheduleModelManager sleepScheduleModel](self, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Sleep Schedule Model: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSleepEventDelegate)sleepEventDelegate
{
  return (HDSPSleepEventDelegate *)objc_loadWeakRetained((id *)&self->_sleepEventDelegate);
}

- (void)setSleepEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sleepEventDelegate, a3);
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (HDSPSleepScheduleModelChangeEvaluator)changeEvaluator
{
  return self->_changeEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
