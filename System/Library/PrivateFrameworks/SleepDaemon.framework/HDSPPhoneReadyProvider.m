@implementation HDSPPhoneReadyProvider

- (HDSPPhoneReadyProvider)initWithEnvironment:(id)a3
{
  id v4;
  HDSPPhoneReadyProvider *v5;
  HDSPPhoneReadyProvider *v6;
  HDSPSpringboardMonitor *v7;
  void *v8;
  uint64_t v9;
  HDSPSpringboardMonitor *springboardMonitor;
  NSObject *v11;
  void *v12;
  HDSPSpringboardMonitor *v13;
  id v14;
  HDSPPhoneReadyProvider *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HDSPSpringboardMonitor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPPhoneReadyProvider;
  v5 = -[HDSPPhoneReadyProvider init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = [HDSPSpringboardMonitor alloc];
    objc_msgSend(v4, "defaultCallbackScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDSPSpringboardMonitor initWithCallbackScheduler:isAppleWatch:](v7, "initWithCallbackScheduler:isAppleWatch:", v8, 0);
    springboardMonitor = v6->_springboardMonitor;
    v6->_springboardMonitor = (HDSPSpringboardMonitor *)v9;

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v6->_springboardMonitor;
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      v14 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);

    }
    v15 = v6;
  }

  return v6;
}

- (BOOL)isSystemReady
{
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = -[HDSPSpringboardMonitor isSpringboardStarted](self->_springboardMonitor, "isSpringboardStarted");
  if (v3)
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] System is ready", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    -[HDSPSpringboardMonitor addObserver:](self->_springboardMonitor, "addObserver:", self);
  }
  return v3;
}

- (void)springboardDidStart
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Springboard started", (uint8_t *)&v6, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemDidBecomeReady");

  -[HDSPSpringboardMonitor removeObserver:](self->_springboardMonitor, "removeObserver:", self);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSystemReadyDelegate)delegate
{
  return (HDSPSystemReadyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDSPSpringboardMonitor)springboardMonitor
{
  return self->_springboardMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
