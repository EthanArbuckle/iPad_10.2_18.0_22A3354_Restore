@implementation _HDSPWakeDetectionDetectingState

- (void)didEnter
{
  id v3;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWakeDetection:", -[_HDSPWakeDetectionDetectingState activeTypes](self, "activeTypes"));

}

- (void)didExit
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v8, "hasStateTransitionOrInitializing");
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "nextState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDetectingState") & 1) == 0)
    {
      -[HKSPStateMachineState stateMachine](self, "stateMachine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopWakeDetection");

    }
    v5 = v8;
  }

}

- (unint64_t)activeTypes
{
  return 0;
}

- (BOOL)isDetectingState
{
  return 1;
}

- (BOOL)_isActivityDateInDetectionWindow:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detectionWindowForType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hksp_containsDate:", v6);

  return v10;
}

- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHDSPWakeDetectorTypes(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v8;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeupEventDetected: %{public}@ - %{public}@", buf, 0x20u);

  }
  v11 = -[_HDSPWakeDetectionDetectingState _isActivityDateInDetectionWindow:type:](self, "_isActivityDateInDetectionWindow:type:", v6, a3);
  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      v15 = v14;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection event found", buf, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61___HDSPWakeDetectionDetectingState_wakeupEventDetected_date___block_invoke;
    v20[3] = &unk_24D4E3498;
    v21 = v16;
    v12 = v16;
    +[HDSPWakeDetectionStateMachineContext contextWithType:](HDSPWakeDetectionStateMachineContext, "contextWithType:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject perform:withContext:](v12, "perform:withContext:", v20, v17);

  }
  else if (v13)
  {
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v23 = v18;
    v19 = v18;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring wake up event because it's outside of detection window", buf, 0xCu);

  }
}

- (void)earlyWakeUpWasNotifiedRemotely
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v4 = v11;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] earlyWakeUpWasNotifiedRemotely", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66___HDSPWakeDetectionDetectingState_earlyWakeUpWasNotifiedRemotely__block_invoke;
  v8[3] = &unk_24D4E3498;
  v9 = v5;
  v6 = v5;
  +[HDSPWakeDetectionStateMachineContext contextWithType:](HDSPWakeDetectionStateMachineContext, "contextWithType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "perform:withContext:", v8, v7);

}

@end
