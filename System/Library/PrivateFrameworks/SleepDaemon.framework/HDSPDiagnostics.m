@implementation HDSPDiagnostics

- (HDSPDiagnostics)initWithEnvironment:(id)a3
{
  id v4;
  HDSPDiagnostics *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPObserverSet *providers;
  uint64_t v13;
  HKSPDiagnostics *diagnostics;
  HDSPDiagnostics *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HDSPDiagnostics *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPDiagnostics;
  v5 = -[HDSPDiagnostics init](&v17, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2048;
      v21 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_environment, v4);
    v9 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCallbackScheduler:", v10);
    providers = v5->_providers;
    v5->_providers = (HKSPObserverSet *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEA9870]), "initWithLabel:", CFSTR("com.apple.sleepd"));
    diagnostics = v5->_diagnostics;
    v5->_diagnostics = (HKSPDiagnostics *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "notificationListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)addProvider:(id)a3
{
  HKSPObserverSet *providers;
  id v5;

  if (a3)
  {
    providers = self->_providers;
    v5 = a3;
    -[HKSPObserverSet addObserver:](providers, "addObserver:", v5);
    -[HKSPDiagnostics addProvider:](self->_diagnostics, "addProvider:", v5);

  }
}

- (void)removeProvider:(id)a3
{
  HKSPObserverSet *providers;
  id v5;

  if (a3)
  {
    providers = self->_providers;
    v5 = a3;
    -[HKSPObserverSet removeObserver:](providers, "removeObserver:", v5);
    -[HKSPDiagnostics removeProvider:](self->_diagnostics, "removeProvider:", v5);

  }
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  HKSPObserverSet *providers;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.diagnostics")) & 1) != 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v7 = v16;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);

    }
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    providers = self->_providers;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__HDSPDiagnostics_notificationListener_didReceiveNotificationWithName___block_invoke;
    v13[3] = &unk_24D4E3C98;
    v14 = v8;
    v10 = v8;
    -[HKSPObserverSet enumerateObserversWithBlock:](providers, "enumerateObserversWithBlock:", v13);
    -[HDSPDiagnostics _logDiagnostics:](self, "_logDiagnostics:", v10);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __71__HDSPDiagnostics_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "diagnosticDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("<none>");
  v6 = *(void **)(a1 + 32);
  v7 = (objc_class *)objc_opt_class();

  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

}

- (void)_logDiagnostics:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        HKSPLogForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v8;
          _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "----------------------------%{public}@----------------------------", buf, 0xCu);
        }

        HKSPLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v11;
          _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]", buf, 0xCu);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPObserverSet)providers
{
  return self->_providers;
}

- (HKSPDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
