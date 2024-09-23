@implementation HDSPSleepWidgetBedtimeInProgressState

- (id)stateName
{
  return CFSTR("BedtimeInProgress");
}

- (int64_t)widgetState
{
  return 5;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  NSObject *v4;
  id v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 == 2 && a4)
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turned on sleep mode, staying here", buf, 0xCu);

    }
  }
  else
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateState");

  }
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "inUnscheduledSleepMode");

  if ((v7 & 1) != 0)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      v9 = v12;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] in user requested sleep mode, staying here", buf, 0xCu);

    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HDSPSleepWidgetBedtimeInProgressState;
    -[HDSPSleepWidgetStateMachineState sleepScheduleStateDidChange:](&v10, sel_sleepScheduleStateDidChange_, a3);
  }

}

@end
