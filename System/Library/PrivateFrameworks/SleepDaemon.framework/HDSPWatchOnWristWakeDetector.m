@implementation HDSPWatchOnWristWakeDetector

- (HDSPWatchOnWristWakeDetector)initWithEnvironment:(id)a3
{
  id v4;
  HDSPWatchOnWristWakeDetector *v5;
  HDSPWatchOnWristWakeDetector *v6;
  HDSPWatchOnWristWakeDetector *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPWatchOnWristWakeDetector;
  v5 = -[HDSPWatchOnWristWakeDetector init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (id)onWristMonitor
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "systemMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "watchOnWristMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)startDetecting
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_isDetecting)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v4 = v15;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startDetecting", (uint8_t *)&v14, 0xCu);

    }
    self->_isDetecting = 1;
    -[HDSPWatchOnWristWakeDetector onWristMonitor](self, "onWristMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);

    -[HDSPWatchOnWristWakeDetector onWristMonitor](self, "onWristMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastOnWristDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "currentDateProvider");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", v11);
      if (fabs(v12) < 5.0)
      {
        -[HDSPWatchOnWristWakeDetector wakeDetectorDelegate](self, "wakeDetectorDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "wakeDetector:didDetectWakeUpEventOnDate:", self, v7);

      }
    }

  }
}

- (void)stopDetecting
{
  NSObject *v3;
  id v4;
  void *v5;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopDetecting", (uint8_t *)&v6, 0xCu);

  }
  self->_isDetecting = 0;
  -[HDSPWatchOnWristWakeDetector onWristMonitor](self, "onWristMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (unint64_t)type
{
  return 1;
}

- (void)detectedOnWristOnDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HDSPWatchOnWristWakeDetector isDetecting](self, "isDetecting"))
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v6 = v9;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] detectedOnWristOnDate: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[HDSPWatchOnWristWakeDetector wakeDetectorDelegate](self, "wakeDetectorDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wakeDetector:didDetectWakeUpEventOnDate:", self, v4);

  }
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
