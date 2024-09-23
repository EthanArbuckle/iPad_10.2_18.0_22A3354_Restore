@implementation HDSPProcessStateManager

uint64_t __47__HDSPProcessStateManager__updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", a2);
}

void __47__HDSPProcessStateManager__updateConfiguration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v6, "previousState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_process:didUpdateFromState:toState:", v7, v8, v9);
}

- (void)_process:(id)a3 didUpdateFromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "taskState") == 3 && objc_msgSend(v10, "taskState") != 3)
  {
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(v8, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v19;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_INFO, "[%{public}@] process %{public}@ no longer suspended", (uint8_t *)&v20, 0x16u);

    }
    -[HDSPProcessStateManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processNoLongerSuspended:", objc_msgSend(v8, "pid"));
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "taskState") != 3 && objc_msgSend(v10, "taskState") == 3)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v8, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_INFO, "[%{public}@] process %{public}@ is suspended", (uint8_t *)&v20, 0x16u);

    }
    -[HDSPProcessStateManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processDidBecomeSuspended:", objc_msgSend(v8, "pid"));
LABEL_11:

  }
}

void __47__HDSPProcessStateManager__updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "na_map:", &__block_literal_global_16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BE80CF8]);
  objc_msgSend(v5, "setValues:", 1);
  objc_msgSend(v3, "setStateDescriptor:", v5);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__HDSPProcessStateManager__updateConfiguration__block_invoke_3;
  v6[3] = &unk_24D4E5660;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setUpdateHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)stopMonitoringProcessState:(int)a3
{
  void *v4;
  NSMutableSet *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_processIdentifiers;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](self->_processIdentifiers, "containsObject:", v4) & 1) != 0)
  {
    objc_sync_exit(v5);

  }
  else
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] no longer monitoring process: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[NSMutableSet removeObject:](self->_processIdentifiers, "removeObject:", v4);
    objc_sync_exit(v5);

    -[HKSPThrottler execute](self->_updateThrottler, "execute");
  }

}

- (void)startMonitoringProcessState:(int)a3
{
  void *v4;
  NSMutableSet *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_processIdentifiers;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](self->_processIdentifiers, "containsObject:", v4) & 1) != 0)
  {
    objc_sync_exit(v5);

  }
  else
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] monitoring process: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[NSMutableSet addObject:](self->_processIdentifiers, "addObject:", v4);
    objc_sync_exit(v5);

    -[HKSPThrottler execute](self->_updateThrottler, "execute");
  }

}

- (void)_updateConfiguration
{
  NSMutableSet *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  RBSProcessMonitor *processStateMonitor;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v3 = self->_processIdentifiers;
  objc_sync_enter(v3);
  -[NSMutableSet allObjects](self->_processIdentifiers, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v13[5];
  v13[5] = v4;

  objc_sync_exit(v3);
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v13[5];
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v9 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] updating monitor configuration for processes: %{public}@", buf, 0x16u);

  }
  processStateMonitor = self->_processStateMonitor;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPProcessStateManager__updateConfiguration__block_invoke;
  v11[3] = &unk_24D4E5688;
  v11[4] = self;
  v11[5] = &v12;
  -[RBSProcessMonitor updateConfiguration:](processStateMonitor, "updateConfiguration:", v11);
  _Block_object_dispose(&v12, 8);

}

- (HDSPProcessStateManager)init
{
  HDSPProcessStateManager *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__HDSPProcessStateManager_init__block_invoke;
  v5[3] = &unk_24D4E55F8;
  objc_copyWeak(&v6, &location);
  v3 = -[HDSPProcessStateManager initWithProcessStateProvider:](self, "initWithProcessStateProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __31__HDSPProcessStateManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (!v5)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch handle with error: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HDSPProcessStateManager)initWithProcessStateProvider:(id)a3
{
  id v4;
  HDSPProcessStateManager *v5;
  RBSProcessMonitor *v6;
  RBSProcessMonitor *processStateMonitor;
  NSMutableSet *v8;
  NSMutableSet *processIdentifiers;
  uint64_t v10;
  id processStateProvider;
  id v12;
  uint64_t v13;
  HKSPThrottler *updateThrottler;
  HDSPProcessStateManager *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPProcessStateManager;
  v5 = -[HDSPProcessStateManager init](&v20, sel_init);
  if (v5)
  {
    v6 = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x24BE80CC8]);
    processStateMonitor = v5->_processStateMonitor;
    v5->_processStateMonitor = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    processIdentifiers = v5->_processIdentifiers;
    v5->_processIdentifiers = v8;

    v10 = objc_msgSend(v4, "copy");
    processStateProvider = v5->_processStateProvider;
    v5->_processStateProvider = (id)v10;

    objc_initWeak(&location, v5);
    v12 = objc_alloc(MEMORY[0x24BEA9968]);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__HDSPProcessStateManager_initWithProcessStateProvider___block_invoke;
    v17[3] = &unk_24D4E4C10;
    objc_copyWeak(&v18, &location);
    v13 = objc_msgSend(v12, "initWithInterval:executeBlock:", v17, 0.25);
    updateThrottler = v5->_updateThrottler;
    v5->_updateThrottler = (HKSPThrottler *)v13;

    v15 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__HDSPProcessStateManager_initWithProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateConfiguration");

}

- (BOOL)isProcessSuspended:(int)a3
{
  void *v3;
  BOOL v4;

  (*((void (**)(void))self->_processStateProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "taskState") == 3;

  return v4;
}

- (void)dealloc
{
  RBSProcessMonitor *processStateMonitor;
  objc_super v4;

  -[RBSProcessMonitor invalidate](self->_processStateMonitor, "invalidate");
  processStateMonitor = self->_processStateMonitor;
  self->_processStateMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDSPProcessStateManager;
  -[HDSPProcessStateManager dealloc](&v4, sel_dealloc);
}

- (HDSPProcessStateManagerDelegate)delegate
{
  return (HDSPProcessStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong(&self->_processStateProvider, 0);
  objc_storeStrong((id *)&self->_processIdentifiers, 0);
  objc_storeStrong((id *)&self->_processStateMonitor, 0);
}

@end
