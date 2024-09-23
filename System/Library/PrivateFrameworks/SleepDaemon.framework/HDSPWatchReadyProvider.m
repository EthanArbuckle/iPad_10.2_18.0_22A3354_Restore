@implementation HDSPWatchReadyProvider

- (HDSPWatchReadyProvider)initWithEnvironment:(id)a3
{
  id v4;
  HDSPWatchReadyProvider *v5;
  HDSPWatchReadyProvider *v6;
  HDSPSpringboardMonitor *v7;
  void *v8;
  uint64_t v9;
  HDSPSpringboardMonitor *springboardMonitor;
  NSObject *v11;
  void *v12;
  HDSPSpringboardMonitor *v13;
  id v14;
  HDSPWatchReadyProvider *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HDSPSpringboardMonitor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPWatchReadyProvider;
  v5 = -[HDSPWatchReadyProvider init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = [HDSPSpringboardMonitor alloc];
    objc_msgSend(v4, "defaultCallbackScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDSPSpringboardMonitor initWithCallbackScheduler:isAppleWatch:](v7, "initWithCallbackScheduler:isAppleWatch:", v8, 1);
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

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSystemReady
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[HDSPSpringboardMonitor isSpringboardStarted](self->_springboardMonitor, "isSpringboardStarted");
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v6 = v10;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Carousel is started.", (uint8_t *)&v9, 0xCu);

    }
    if (-[HDSPWatchReadyProvider _waitForInitialSync](self, "_waitForInitialSync"))
      return 1;
  }
  else
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Waiting for Carousel to start.", (uint8_t *)&v9, 0xCu);

    }
    -[HDSPSpringboardMonitor addObserver:](self->_springboardMonitor, "addObserver:", self);
  }
  return 0;
}

- (BOOL)_waitForInitialSync
{
  return 0;
}

- (BOOL)isInRootRobotOrDemoMode
{
  id WeakRetained;
  int v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v4 = objc_msgSend(WeakRetained, "isDemoEnvironment");

  if (!v4)
    return -[HDSPWatchReadyProvider _isInRootRobot](self, "_isInRootRobot");
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] we're in demo environment", (uint8_t *)&v8, 0xCu);

  }
  return 1;
}

- (BOOL)_isInRootRobot
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HDSPWatchReadyProvider__isInRootRobot__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8ED8 != -1)
    dispatch_once(&qword_253DE8ED8, block);
  return _MergedGlobals_13;
}

void __40__HDSPWatchReadyProvider__isInRootRobot__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v1 = v8;
    _os_log_impl(&dword_21610C000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking if we are in root robot.", (uint8_t *)&v7, 0xCu);

  }
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.rootrobot"));
  objc_msgSend(v2, "stringForKey:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_13 = objc_msgSend(CFSTR("minimal"), "isEqualToString:", v3);
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v7 = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = _MergedGlobals_13;
    v6 = v5;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running in root robot %d", (uint8_t *)&v7, 0x12u);

  }
}

- (void)springboardDidStart
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Carousel has started", v6, 0xCu);

  }
  if (-[HDSPWatchReadyProvider _waitForInitialSync](self, "_waitForInitialSync"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "systemDidBecomeReady");

    -[HDSPWatchReadyProvider _finishWaitingForInitialSync](self, "_finishWaitingForInitialSync");
  }
  -[HDSPSpringboardMonitor removeObserver:](self->_springboardMonitor, "removeObserver:", self, *(_OWORD *)v6);
}

- (void)restoreDidFinish
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] restore finished", (uint8_t *)&v6, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemDidBecomeReady");

  -[HDSPWatchReadyProvider _finishWaitingForInitialSync](self, "_finishWaitingForInitialSync");
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

- (BOOL)observingRestore
{
  return self->_observingRestore;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
