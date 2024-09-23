@implementation HDSPSleepModeExitDetector

- (HDSPSleepModeExitDetector)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepModeExitDetector *v5;
  HDSPSleepModeExitDetector *v6;
  HDSPSleepModeExitDetector *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepModeExitDetector;
  v5 = -[HDSPSleepModeExitDetector init](&v9, sel_init);
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
    objc_msgSend(WeakRetained, "sleepModeManager");
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
  objc_msgSend(WeakRetained, "sleepModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (unint64_t)type
{
  return 2;
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  id WeakRetained;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepModeExitDetector environment](self, "environment", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3
    && HKSPSleepModeChangeReasonTreatedAsUserRequestedLocally()
    && -[HDSPSleepModeExitDetector isDetecting](self, "isDetecting"))
  {
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "dontSync");

      if (v11)
      {
        HKSPLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138543362;
          v21 = (id)objc_opt_class();
          v13 = v21;
          _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring remote sleep mode exit", (uint8_t *)&v20, 0xCu);

        }
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = (id)objc_opt_class();
      v15 = v21;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode manually exited, treating as wake up event", (uint8_t *)&v20, 0xCu);

    }
    -[HDSPSleepModeExitDetector wakeDetectorDelegate](self, "wakeDetectorDelegate");
    v12 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "currentDateProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17[2](v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject wakeDetector:didDetectWakeUpEventOnDate:](v12, "wakeDetector:didDetectWakeUpEventOnDate:", self, v19);

    goto LABEL_12;
  }
LABEL_13:

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
