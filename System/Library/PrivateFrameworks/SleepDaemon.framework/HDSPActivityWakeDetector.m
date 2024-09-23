@implementation HDSPActivityWakeDetector

- (HDSPActivityWakeDetector)initWithEnvironment:(id)a3
{
  id v4;
  HDSPActivityWakeDetector *v5;
  HDSPActivityWakeDetector *v6;
  HDSPActivityWakeDetector *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPActivityWakeDetector;
  v5 = -[HDSPActivityWakeDetector init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (void)startDetecting
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_isDetecting)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v4 = v8;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startDetecting", (uint8_t *)&v7, 0xCu);

    }
    self->_isDetecting = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "notificationListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);

  }
}

- (void)stopDetecting
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopDetecting", (uint8_t *)&v7, 0xCu);

  }
  self->_isDetecting = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "notificationListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (unint64_t)type
{
  return 1;
}

- (void)notifyForActivityDetectedOnDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v4;
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying for activity detected on date %{public}@", (uint8_t *)&v8, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_wakeDetectorDelegate);
  objc_msgSend(WeakRetained, "wakeDetector:didDetectWakeUpEventOnDate:", self, v4);

}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.healthlite.SleepDetectedActivity"))
    && self->_isDetecting)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v5;
      v7 = *(id *)&v16[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v16, 0x16u);

    }
    -[HDSPActivityWakeDetector environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDateProvider");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPActivityWakeDetector notifyForActivityDetectedOnDate:](self, "notifyForActivityDetectedOnDate:", v13);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HDSPWakeDetectorDelegate)wakeDetectorDelegate
{
  return (HDSPWakeDetectorDelegate *)objc_loadWeakRetained((id *)&self->_wakeDetectorDelegate);
}

- (void)setWakeDetectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wakeDetectorDelegate, a3);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (BOOL)isDetecting
{
  return self->_isDetecting;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_wakeDetectorDelegate);
}

@end
