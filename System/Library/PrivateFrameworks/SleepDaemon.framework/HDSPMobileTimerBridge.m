@implementation HDSPMobileTimerBridge

- (HDSPMobileTimerBridge)init
{
  id v3;
  HDSPMobileTimerBridge *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE67828]);
  v4 = -[HDSPMobileTimerBridge initWithAlarmManager:](self, "initWithAlarmManager:", v3);

  return v4;
}

- (HDSPMobileTimerBridge)initWithAlarmManager:(id)a3
{
  id v5;
  HDSPMobileTimerBridge *v6;
  HDSPMobileTimerBridge *v7;
  HDSPMobileTimerBridge *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPMobileTimerBridge;
  v6 = -[HDSPMobileTimerBridge init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alarmManager, a3);
    -[HDSPMobileTimerBridge _checkAlarmServer](v7, "_checkAlarmServer");
    v8 = v7;
  }

  return v7;
}

- (void)_checkAlarmServer
{
  void *v3;
  NAFuture *v4;
  NAFuture *alarmServerReady;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BE6B608];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke;
  v7[3] = &unk_24D4E64E0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v3, "lazyFutureWithBlock:", v7);
  v4 = (NAFuture *)objc_claimAutoreleasedReturnValue();
  alarmServerReady = self->_alarmServerReady;
  self->_alarmServerReady = v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__alarmServerReady, *MEMORY[0x24BE677A8], 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] lazily checking alarm server", buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sleepAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke_186;
  v10[3] = &unk_24D4E64B8;
  v10[4] = WeakRetained;
  v11 = v3;
  v8 = v3;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobiletimerd.MTAlarmServer")))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 1)
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = (id)objc_opt_class();
        v8 = v12;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm server not ready yet", (uint8_t *)&v11, 0xCu);

      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v10 = v12;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm server is ready", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject removeObserver:name:object:](v7, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE677A8], 0);
LABEL_9:

}

- (void)_alarmServerReady
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received notification that alarm server is ready", (uint8_t *)&v6, 0xCu);

  }
  -[NAFuture finishWithNoResult](self->_alarmServerReady, "finishWithNoResult");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677A8], 0);

}

- (id)sleepAlarmsFutureIgnoringCache:(BOOL)a3
{
  NAFuture *alarmServerReady;
  _QWORD v5[5];
  BOOL v6;

  alarmServerReady = self->_alarmServerReady;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke;
  v5[3] = &unk_24D4E6508;
  v6 = a3;
  v5[4] = self;
  -[NAFuture flatMap:](alarmServerReady, "flatMap:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  if (*(_BYTE *)(a1 + 40))
    v1 = objc_alloc_init(MEMORY[0x24BE67828]);
  else
    v1 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = v1;
  objc_msgSend(v1, "sleepAlarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke_2;
  v7[3] = &unk_24D4E3630;
  v8 = v2;
  v4 = v2;
  v5 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

  return v3;
}

- (id)sleepAlarmsFuture
{
  return -[HDSPMobileTimerBridge sleepAlarmsFutureIgnoringCache:](self, "sleepAlarmsFutureIgnoringCache:", 0);
}

- (void)updateSleepAlarms
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[MTAlarmManager updateSleepAlarms](self->_alarmManager, "updateSleepAlarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__HDSPMobileTimerBridge_updateSleepAlarms__block_invoke;
  v5[3] = &unk_24D4E4858;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addFailureBlock:", v5);

}

void __42__HDSPMobileTimerBridge_updateSleepAlarms__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_21610C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to update sleep alarms with error %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)resetSleepAlarmSnoozeState
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[MTAlarmManager resetSleepAlarmSnoozeState](self->_alarmManager, "resetSleepAlarmSnoozeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__HDSPMobileTimerBridge_resetSleepAlarmSnoozeState__block_invoke;
  v5[3] = &unk_24D4E4858;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addFailureBlock:", v5);

}

void __51__HDSPMobileTimerBridge_resetSleepAlarmSnoozeState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_21610C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to reset snooze state with error %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (BOOL)sleepAlarm:(id)a3 matchesSleepScheduleModel:(id)a4
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (unint64_t)a3;
  v6 = a4;
  objc_msgSend(v6, "sleepSchedule");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 | v7)
  {
    v9 = 0;
    if (v5 && v7)
    {
      objc_msgSend((id)v7, "occurrences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "alarmConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sleepSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend((id)v5, "hour");
      objc_msgSend(v11, "wakeUpComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == objc_msgSend(v15, "hour"))
      {
        v16 = objc_msgSend((id)v5, "minute");
        objc_msgSend(v11, "wakeUpComponents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == objc_msgSend(v17, "minute"))
        {
          v18 = objc_msgSend((id)v5, "bedtimeHour");
          objc_msgSend(v11, "bedtimeComponents");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 == objc_msgSend(v19, "hour"))
          {
            v20 = objc_msgSend((id)v5, "bedtimeMinute");
            objc_msgSend(v11, "bedtimeComponents");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20 == objc_msgSend(v39, "minute")
              && (v21 = objc_msgSend((id)v5, "repeatSchedule"), v21 == objc_msgSend(v11, "weekdays"))
              && (v22 = objc_msgSend((id)v5, "sleepMode"), v22 == objc_msgSend(v13, "scheduledSleepMode")))
            {
              objc_msgSend((id)v5, "bedtimeReminder");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v38 == 0) != objc_msgSend(v13, "bedtimeReminders")
                && (v24 = objc_msgSend((id)v5, "bedtimeReminderMinutes"), v24 == objc_msgSend(v8, "windDownMinutes"))
                && (v25 = objc_msgSend((id)v5, "sleepSchedule"), v25 == objc_msgSend(v8, "isEnabled"))
                && (v26 = objc_msgSend((id)v5, "isEnabled"), v26 == objc_msgSend(v12, "isEnabled")))
              {
                objc_msgSend((id)v5, "sound");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "soundVolume");
                v27 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "soundVolume");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = (void *)v27;
                if (NAEqualObjects())
                {
                  objc_msgSend((id)v5, "sound");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "toneIdentifier");
                  v28 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "toneIdentifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = (void *)v28;
                  if (NAEqualObjects())
                  {
                    objc_msgSend((id)v5, "sound");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "vibrationIdentifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "vibrationIdentifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v9 = NAEqualObjects();

                  }
                  else
                  {
                    v9 = 0;
                  }

                }
                else
                {
                  v9 = 0;
                }

              }
              else
              {
                v9 = 0;
              }

            }
            else
            {
              v9 = 0;
            }

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)sleepScheduleModelFromSleepAlarm:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEA98B0]);
    objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "sleepSchedule"));
    objc_msgSend(v4, "setWindDownMinutes:", objc_msgSend(v3, "bedtimeReminderMinutes"));
    v5 = objc_alloc_init(MEMORY[0x24BEA98B8]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v6, "setHour:", objc_msgSend(v3, "bedtimeHour"));
    objc_msgSend(v6, "setMinute:", objc_msgSend(v3, "bedtimeMinute"));
    objc_msgSend(v5, "setBedtimeComponents:", v6);
    v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v7, "setHour:", objc_msgSend(v3, "hour"));
    objc_msgSend(v7, "setMinute:", objc_msgSend(v3, "minute"));
    objc_msgSend(v5, "setWakeUpComponents:", v7);
    objc_msgSend(v5, "setWeekdays:", objc_msgSend(v3, "repeatSchedule"));
    v8 = objc_alloc_init(MEMORY[0x24BEA98A0]);
    objc_msgSend(v8, "setEnabled:", objc_msgSend(v3, "isEnabled"));
    objc_msgSend(v3, "sound");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "soundVolume");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSoundVolume:", v10);

    objc_msgSend(v3, "sound");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setToneIdentifier:", v12);

    objc_msgSend(v3, "sound");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vibrationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVibrationIdentifier:", v14);

    objc_msgSend(v5, "setAlarmConfiguration:", v8);
    objc_msgSend(v4, "saveOccurrence:", v5);
    objc_msgSend(v3, "lastModifiedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastModifiedDate:", v15);

    v16 = objc_alloc_init(MEMORY[0x24BEA98C0]);
    objc_msgSend(v16, "setScheduledSleepMode:", objc_msgSend(v3, "sleepMode"));
    objc_msgSend(v3, "bedtimeReminder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(v16, "setBedtimeReminders:", 0);
    objc_msgSend(v3, "lastModifiedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastModifiedDate:", v18);

    v19 = objc_alloc_init(MEMORY[0x24BEA98A8]);
    objc_msgSend(v3, "dismissedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v19, "setWakeUpAlarmDismissedDate:", v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWakeUpAlarmDismissedDate:", v23);

    }
    objc_msgSend(v3, "snoozeFireDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v19, "setWakeUpAlarmSnoozedUntilDate:", v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWakeUpAlarmSnoozedUntilDate:", v25);

    }
    objc_msgSend(v3, "lastModifiedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLastModifiedDate:", v26);

    objc_msgSend(MEMORY[0x24BEA9930], "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v4, v16, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x24BEA9930];
    v4 = objc_alloc_init(MEMORY[0x24BEA9948]);
    v5 = objc_alloc_init(MEMORY[0x24BEA9900]);
    objc_msgSend(v21, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", 0, v4, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (NAFuture)alarmServerReady
{
  return self->_alarmServerReady;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_alarmServerReady, 0);
}

@end
