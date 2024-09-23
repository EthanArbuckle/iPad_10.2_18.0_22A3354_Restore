@implementation HDSPSleepAlarmManager

- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPMobileTimerBridge *v5;
  HDSPSleepAlarmManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(HDSPMobileTimerBridge);
  v6 = -[HDSPSleepAlarmManager initWithEnvironment:sleepAlarmProvider:](self, "initWithEnvironment:sleepAlarmProvider:", v4, v5);

  return v6;
}

- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3 sleepAlarmProvider:(id)a4
{
  id v6;
  id v7;
  HDSPSleepAlarmManager *v8;
  HDSPSleepAlarmManager *v9;
  HDSPSleepAlarmManager *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepAlarmManager;
  v8 = -[HDSPSleepAlarmManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_sleepAlarmProvider, a4);
    v10 = v9;
  }

  return v9;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "sleepScheduleModelManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (id)currentSleepAlarms
{
  return (id)-[HDSPSleepAlarmProvider sleepAlarmsFutureIgnoringCache:](self->_sleepAlarmProvider, "sleepAlarmsFutureIgnoringCache:", 1);
}

- (void)resetSleepAlarmSnoozeState
{
  NSObject *v3;
  int v4;
  HDSPSleepAlarmManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] reset sleep alarm snooze state", (uint8_t *)&v4, 0xCu);
  }

  -[HDSPSleepAlarmProvider resetSleepAlarmSnoozeState](self->_sleepAlarmProvider, "resetSleepAlarmSnoozeState");
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  NSObject *v5;
  int v6;
  HDSPSleepAlarmManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating sleep alarms for model change", (uint8_t *)&v6, 0xCu);
  }

  -[HDSPSleepAlarmProvider updateSleepAlarms](self->_sleepAlarmProvider, "updateSleepAlarms");
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSleepAlarmProvider)sleepAlarmProvider
{
  return self->_sleepAlarmProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
