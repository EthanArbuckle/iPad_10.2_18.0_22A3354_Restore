@implementation HDSPWakeDetectionStateMachineState

- (BOOL)isDetectingState
{
  return 0;
}

- (void)updateState
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSPWakeDetectionStateMachineState isWakeDetectionDisabled](self, "isWakeDetectionDisabled"))
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = objc_opt_class();
      v5 = *(id *)&v14[4];
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection disabled", v14, 0xCu);

    }
    objc_msgSend(v3, "disabledState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enterState:", v6);
  }
  else
  {
    objc_msgSend(v3, "infoProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activeTypes");
    if ((v7 & 1) != 0)
    {
      HKSPLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 138543362;
        *(_QWORD *)&v14[4] = objc_opt_class();
        v10 = *(id *)&v14[4];
        _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] in detection window for activity (and explicit)", v14, 0xCu);

      }
      objc_msgSend(v3, "activityDetectingState");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if ((v7 & 2) != 0)
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 138543362;
        *(_QWORD *)&v14[4] = objc_opt_class();
        v12 = *(id *)&v14[4];
        _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] in detection window for explicit", v14, 0xCu);

      }
      objc_msgSend(v3, "explicitDetectingState");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "waitingState");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v8;
    objc_msgSend(v3, "enterState:", v8, *(_OWORD *)v14);

  }
}

- (BOOL)isWakeDetectionDisabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) != 0)
  {
    objc_msgSend(v4, "sleepSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isWatch")
      && (-[NSObject watchSleepFeaturesEnabled](v6, "watchSleepFeaturesEnabled") & 1) == 0)
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = (id)objc_opt_class();
        v10 = v16;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled", (uint8_t *)&v15, 0xCu);

      }
      goto LABEL_20;
    }
    objc_msgSend(v4, "sleepEventRecord");
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isWatch")
      && (-[NSObject isAnySleepTrackingOnboardingCompleted](v7, "isAnySleepTrackingOnboardingCompleted") & 1) == 0)
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

LABEL_20:
        v8 = 1;
        goto LABEL_21;
      }
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      v13 = "[%{public}@] sleep tracking onboarding not completed";
    }
    else
    {
      if ((objc_msgSend(v3, "isWatch") & 1) != 0
        || (-[NSObject isAnySleepCoachingOnboardingCompleted](v7, "isAnySleepCoachingOnboardingCompleted") & 1) != 0)
      {
        v8 = 0;
LABEL_21:

        goto LABEL_22;
      }
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      v13 = "[%{public}@] sleep coaching onboarding not completed";
    }
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);

    goto LABEL_19;
  }
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = (id)objc_opt_class();
    v9 = v16;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule disabled", (uint8_t *)&v15, 0xCu);

  }
  v8 = 1;
LABEL_22:

  return v8;
}

@end
