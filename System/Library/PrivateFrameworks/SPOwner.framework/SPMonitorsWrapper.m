@implementation SPMonitorsWrapper

- (SPMonitorsWrapper)initWithBeaconManager:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  SPMonitorsWrapper *v8;
  SPMonitorsWrapper *v9;
  OS_dispatch_queue *v10;
  NSObject *delegateQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SPMonitorsWrapper;
  v8 = -[SPMonitorsWrapper init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v10;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      delegateQueue = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create("com.apple.icloud.SPOwner.monitor-wrapper", delegateQueue);
      v13 = v9->_delegateQueue;
      v9->_delegateQueue = (OS_dispatch_queue *)v12;

    }
  }

  return v9;
}

- (int)_cpuType
{
  if (_cpuType_onceToken != -1)
    dispatch_once(&_cpuType_onceToken, &__block_literal_global_4);
  return _cpuType_cachedCPUType;
}

void __29__SPMonitorsWrapper__cpuType__block_invoke()
{
  NSObject *v0;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("hw.cputype", &v2, &v1, 0, 0) == -1)
  {
    LogCategory_BeaconManager();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      __29__SPMonitorsWrapper__cpuType__block_invoke_cold_1(v0);

  }
  _cpuType_cachedCPUType = v2;
}

- (BOOL)useLegacyMacBeaconing
{
  return -[SPMonitorsWrapper _cpuType](self, "_cpuType") == 7;
}

- (BOOL)isNetworkUp
{
  void *v2;
  char v3;

  -[SPMonitorsWrapper networkMonitor](self, "networkMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkUp");

  return v3;
}

- (unint64_t)powerState
{
  return 0;
}

- (void)start
{
  SPNetworkMonitor *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(SPNetworkMonitor);
  -[SPMonitorsWrapper setNetworkMonitor:](self, "setNetworkMonitor:", v3);

  -[SPMonitorsWrapper networkMonitor](self, "networkMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __26__SPMonitorsWrapper_start__block_invoke;
  v8 = &unk_1E5E16C28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "startMonitoringWithCallback:", &v5);

  -[SPMonitorsWrapper resume](self, "resume", v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__SPMonitorsWrapper_start__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateDidChange:powerState:", a2, objc_msgSend(WeakRetained, "powerState"));

}

- (void)stop
{
  void *v3;

  -[SPMonitorsWrapper networkMonitor](self, "networkMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoring");

  -[SPMonitorsWrapper setNetworkMonitor:](self, "setNetworkMonitor:", 0);
  -[SPMonitorsWrapper pause](self, "pause");
}

- (void)pause
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMonitorWrapper: pausing", v4, 2u);
  }

  -[SPMonitorsWrapper setIsRunning:](self, "setIsRunning:", 0);
}

- (void)resume
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMonitorWrapper: resuming", v4, 2u);
  }

  -[SPMonitorsWrapper setIsRunning:](self, "setIsRunning:", 1);
}

- (SPMonitorsWrapperDelegate)delegate
{
  return (SPMonitorsWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (SPNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (NSDate)lastStateChangeDate
{
  return self->_lastStateChangeDate;
}

- (void)setLastStateChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastStateChangeDate, a3);
}

- (NSDate)nextStateChangeDate
{
  return self->_nextStateChangeDate;
}

- (void)setNextStateChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateChangeDate, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextStateChangeDate, 0);
  objc_storeStrong((id *)&self->_lastStateChangeDate, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __29__SPMonitorsWrapper__cpuType__block_invoke_cold_1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1AEA79000, a1, OS_LOG_TYPE_FAULT, "hw.cputype failed with error: %d", (uint8_t *)v3, 8u);
}

@end
