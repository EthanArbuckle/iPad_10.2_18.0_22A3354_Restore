@implementation HDSPSleepScheduleStateCoordinatorStateMachineState

- (void)didEnter
{
  void *v3;
  char isKindOfClass;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasStateTransitionOrInitializing"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = objc_msgSend(v13, "isInitializing");
    objc_msgSend(v13, "previousState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0 || (isKindOfClass & 1) == 0)
    {
      if (v5)
        v8 = 5;
      else
        v8 = 6;
      +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v13;
    }
    v9 = v7;
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDSPSleepScheduleStateCoordinatorStateMachineState scheduleState](self, "scheduleState");
    if (v6)
      v12 = objc_msgSend(v6, "scheduleState");
    else
      v12 = *MEMORY[0x24BEA96E8];
    objc_msgSend(v10, "sleepScheduleStateDidChange:previousState:context:", v11, v12, v9);

  }
}

- (void)updateState
{
  -[HDSPSleepScheduleStateCoordinatorStateMachineState updateStateForcibly:](self, "updateStateForcibly:", 0);
}

- (void)updateStateForcibly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSPSleepScheduleStateCoordinatorStateMachineState isSleepScheduleDisabled](self, "isSleepScheduleDisabled"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__HDSPSleepScheduleStateCoordinatorStateMachineState_updateStateForcibly___block_invoke;
    v8[3] = &unk_24D4E3498;
    v9 = v5;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "perform:withContext:", v8, v6);

  }
  else if (v3)
  {
    -[HDSPSleepScheduleStateCoordinatorStateMachineState _determineNextStateFromTimeline](self, "_determineNextStateFromTimeline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v7);

  }
}

void __74__HDSPSleepScheduleStateCoordinatorStateMachineState_updateStateForcibly___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "disabledState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)_forceUpdateStateWithChangeReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__HDSPSleepScheduleStateCoordinatorStateMachineState__forceUpdateStateWithChangeReason___block_invoke;
  v7[3] = &unk_24D4E3498;
  v7[4] = self;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "perform:withContext:", v7, v6);

}

uint64_t __88__HDSPSleepScheduleStateCoordinatorStateMachineState__forceUpdateStateWithChangeReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStateForcibly:", 1);
}

- (void)stateDidExpire
{
  -[HDSPSleepScheduleStateCoordinatorStateMachineState _forceUpdateStateWithChangeReason:](self, "_forceUpdateStateWithChangeReason:", 4);
}

- (BOOL)isSleepScheduleDisabled
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  const char *v10;
  id v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isAppleWatch") || (objc_msgSend(v3, "sleepFeaturesEnabled") & 1) != 0)
  {
    objc_msgSend(v3, "sleepScheduleModel");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject sleepSchedule](v4, "sleepSchedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) != 0)
      {
        v7 = 0;
LABEL_15:

        goto LABEL_16;
      }
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = (id)objc_opt_class();
        v9 = v14;
        v10 = "[%{public}@] sleep schedule is disabled";
        goto LABEL_13;
      }
    }
    else
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = (id)objc_opt_class();
        v9 = v14;
        v10 = "[%{public}@] sleep schedule is nil";
LABEL_13:
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);

      }
    }

    v7 = 1;
    goto LABEL_15;
  }
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v11 = v14;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled for this watch", (uint8_t *)&v13, 0xCu);

  }
  v7 = 1;
LABEL_16:

  return v7;
}

- (BOOL)isAlarmEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  return v6;
}

- (id)_timelineForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEA9908];
  objc_msgSend(v6, "sleepScheduleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "builderWithSleepScheduleModel:date:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "buildTimelineWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_determineNextStateFromTimeline
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepScheduleStateCoordinatorStateMachineState _timelineForDate:](self, "_timelineForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedOccurrenceContainingDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windDownInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hksp_containsDate:searchOptions:", v5, 1);

  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = (id)objc_opt_class();
      v11 = v22;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] currently in a wind down session", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(v3, "windDownState");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "bedtimeInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hksp_containsDate:searchOptions:", v5, 1);

    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v21 = 138543362;
        v22 = (id)objc_opt_class();
        v17 = v22;
        _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] currently in a bedtime session", (uint8_t *)&v21, 0xCu);

      }
      objc_msgSend(v3, "bedtimeState");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16)
      {
        v21 = 138543362;
        v22 = (id)objc_opt_class();
        v18 = v22;
        _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] not in a session, must be awake", (uint8_t *)&v21, 0xCu);

      }
      objc_msgSend(v3, "wakeUpState");
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
  v19 = (void *)v12;

  return v19;
}

- (void)significantTimeChange
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] significant time change occurred", (uint8_t *)&v6, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateState");

}

- (void)timeZoneChange
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] timezone change occurred", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepScheduleStateCoordinatorStateMachineState _forceUpdateStateWithChangeReason:](self, "_forceUpdateStateWithChangeReason:", 6);
}

- (void)scheduleModelChanged:(id)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "isSignificantChange");
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v7 = v11;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] significant schedule change occurred", (uint8_t *)&v10, 0xCu);

    }
    -[HDSPSleepScheduleStateCoordinatorStateMachineState significantScheduleChangeOccurred:](self, "significantScheduleChangeOccurred:", 6);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] schedule change not significant", (uint8_t *)&v10, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateState");

  }
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

@end
