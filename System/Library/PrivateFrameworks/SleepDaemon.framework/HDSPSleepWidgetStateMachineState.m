@implementation HDSPSleepWidgetStateMachineState

- (id)stateName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)widgetState
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 1;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 1;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 1;
}

- (void)didEnter
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v10, "hasStateTransitionOrInitializing");
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "previousState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HDSPSleepWidgetStateMachineState widgetState](self, "widgetState");
    if (v6)
      v9 = objc_msgSend(v6, "widgetState");
    else
      v9 = 0;
    objc_msgSend(v7, "sleepWidgetStateDidChange:previousState:", v8, v9);

    v5 = v10;
  }

}

- (void)updateState
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  _BYTE v69[22];
  __int16 v70;
  double v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v69 = 138543362;
    *(_QWORD *)&v69[4] = objc_opt_class();
    v4 = *(id *)&v69[4];
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] determining state", v69, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sleepScheduleModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "sleepScheduleState");
  v11 = objc_msgSend(v6, "inUnscheduledSleepMode");
  if ((objc_msgSend(v6, "isOnboarded") & 1) == 0)
  {
    HKSPLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      objc_msgSend(v5, "notOnboardedState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stateName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v69 = 138543618;
      *(_QWORD *)&v69[4] = v19;
      *(_WORD *)&v69[12] = 2114;
      *(_QWORD *)&v69[14] = v22;
      _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] not onboarded, determined state: %{public}@", v69, 0x16u);

    }
    objc_msgSend(v5, "notOnboardedState");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!v10)
  {
    HKSPLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v25 = v24;
      objc_msgSend(v5, "disabledState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stateName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v69 = 138543618;
      *(_QWORD *)&v69[4] = v24;
      *(_WORD *)&v69[12] = 2114;
      *(_QWORD *)&v69[14] = v27;
      _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule disabled, determined state: %{public}@", v69, 0x16u);

    }
    objc_msgSend(v5, "disabledState");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      objc_msgSend(v5, "bedtimeInProgressState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stateName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v69 = 138543618;
      *(_QWORD *)&v69[4] = v13;
      *(_WORD *)&v69[12] = 2114;
      *(_QWORD *)&v69[14] = v16;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] in user requested sleep mode, determined state: %{public}@", v69, 0x16u);

    }
    objc_msgSend(v5, "bedtimeInProgressState");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v28 = (void *)v17;
    objc_msgSend(v5, "enterState:", v17, *(_OWORD *)v69);
    goto LABEL_16;
  }
  switch(v10)
  {
    case 1:
      if (-[HDSPSleepWidgetStateMachineState shouldGoIntoUpcomingState](self, "shouldGoIntoUpcomingState"))
      {
        objc_msgSend(v5, "upcomingState");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v9, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95C8], v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v8, "timeIntervalSinceDate:", v28);
        v51 = v50;
      }
      else
      {
        v51 = 1.79769313e308;
      }
      HKSPLogForCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = (void *)objc_opt_class();
        *(_DWORD *)v69 = 138543874;
        *(_QWORD *)&v69[4] = v53;
        *(_WORD *)&v69[12] = 2114;
        *(_QWORD *)&v69[14] = v28;
        v70 = 2048;
        v71 = v51;
        v54 = v53;
        _os_log_impl(&dword_21610C000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up date: %{public}@ (secondsAfterWakeUp: %f)", v69, 0x20u);

      }
      objc_msgSend(v5, "greetingState");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "expirationDuration");
      v57 = v56;

      HKSPLogForCategory();
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
      if (v51 >= v57)
      {
        if (v59)
        {
          v64 = (void *)objc_opt_class();
          v65 = v64;
          objc_msgSend(v5, "waitingState");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "stateName");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138543618;
          *(_QWORD *)&v69[4] = v64;
          *(_WORD *)&v69[12] = 2114;
          *(_QWORD *)&v69[14] = v67;
          _os_log_impl(&dword_21610C000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);

        }
        objc_msgSend(v5, "waitingState");
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v59)
        {
          v60 = (void *)objc_opt_class();
          v61 = v60;
          objc_msgSend(v5, "greetingState");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "stateName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138543618;
          *(_QWORD *)&v69[4] = v60;
          *(_WORD *)&v69[12] = 2114;
          *(_QWORD *)&v69[14] = v63;
          _os_log_impl(&dword_21610C000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);

        }
        objc_msgSend(v5, "greetingState");
        v45 = objc_claimAutoreleasedReturnValue();
      }
LABEL_46:
      v68 = (void *)v45;
      objc_msgSend(v5, "enterState:", v45, *(_QWORD *)v69, *(_QWORD *)&v69[8]);

      break;
    case 2:
    case 6:
      objc_msgSend(v9, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95A0], v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v8, "timeIntervalSinceDate:", v28);
        v30 = v29;
      }
      else
      {
        v30 = 1.79769313e308;
      }
      objc_msgSend(v5, "bedtimeState", *(_QWORD *)v69, *(_QWORD *)&v69[8]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "expirationDuration");
      v38 = v37;

      HKSPLogForCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v30 >= v38)
      {
        if (v40)
        {
          v46 = (void *)objc_opt_class();
          v47 = v46;
          objc_msgSend(v5, "bedtimeInProgressState");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stateName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138543618;
          *(_QWORD *)&v69[4] = v46;
          *(_WORD *)&v69[12] = 2114;
          *(_QWORD *)&v69[14] = v49;
          _os_log_impl(&dword_21610C000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);

        }
        objc_msgSend(v5, "bedtimeInProgressState");
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v40)
        {
          v41 = (void *)objc_opt_class();
          v42 = v41;
          objc_msgSend(v5, "bedtimeState");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stateName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138543618;
          *(_QWORD *)&v69[4] = v41;
          *(_WORD *)&v69[12] = 2114;
          *(_QWORD *)&v69[14] = v44;
          _os_log_impl(&dword_21610C000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);

        }
        objc_msgSend(v5, "bedtimeState");
        v45 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_46;
    case 3:
      HKSPLogForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_opt_class();
        v33 = v32;
        objc_msgSend(v5, "windDownState");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stateName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v69 = 138543618;
        *(_QWORD *)&v69[4] = v32;
        *(_WORD *)&v69[12] = 2114;
        *(_QWORD *)&v69[14] = v35;
        _os_log_impl(&dword_21610C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);

      }
      objc_msgSend(v5, "windDownState");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    default:
      goto LABEL_17;
  }
LABEL_16:

LABEL_17:
}

- (BOOL)shouldGoIntoUpcomingState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "waitingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v6))
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(v2, "upcomingState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stateName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2 && v4)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turned on sleep mode", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v6, "bedtimeInProgressState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enterState:", v9);

  }
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138543362;
      *(_QWORD *)&v12[4] = objc_opt_class();
      v10 = *(id *)&v12[4];
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule state is wind down", v12, 0xCu);

    }
    objc_msgSend(v5, "windDownState");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      -[HKSPStateMachineState stateMachine](self, "stateMachine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateState");
      goto LABEL_11;
    }
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138543362;
      *(_QWORD *)&v12[4] = objc_opt_class();
      v7 = *(id *)&v12[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule state is disabled", v12, 0xCu);

    }
    objc_msgSend(v5, "disabledState");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;
  objc_msgSend(v5, "enterState:", v8, *(_OWORD *)v12);
LABEL_11:

}

- (void)sleepScheduleModelDidChange:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;

  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isOnboarded"))
  {

    goto LABEL_5;
  }
  v5 = -[HDSPSleepWidgetStateMachineState widgetStateHasTimeComponent](self, "widgetStateHasTimeComponent");

  if (v5)
  {
LABEL_5:
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateState");

  }
  if (-[HDSPSleepWidgetStateMachineState reloadsWidgetOnModelChange](self, "reloadsWidgetOnModelChange"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sleepWidgetShouldReload");

  }
}

- (void)significantTimeChangeOccurred
{
  void *v3;
  id v4;

  if (-[HDSPSleepWidgetStateMachineState widgetStateHasTimeComponent](self, "widgetStateHasTimeComponent"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateState");

  }
  if (-[HDSPSleepWidgetStateMachineState reloadsWidgetOnTimeChange](self, "reloadsWidgetOnTimeChange"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepWidgetShouldReload");

  }
}

@end
