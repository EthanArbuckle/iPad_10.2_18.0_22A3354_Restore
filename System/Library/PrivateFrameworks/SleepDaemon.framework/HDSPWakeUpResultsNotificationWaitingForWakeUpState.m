@implementation HDSPWakeUpResultsNotificationWaitingForWakeUpState

- (id)stateName
{
  return CFSTR("WaitingForWakeUp");
}

- (void)wakeUpDidOccur
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received wake up event", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationWaitingForWakeUpState _transitionToDelayingForTrackingState](self, "_transitionToDelayingForTrackingState");
}

- (void)_transitionToDelayingForTrackingState
{
  NSObject *v3;
  id v4;
  void *v5;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transitioning to delaying for tracking state", (uint8_t *)&v7, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delayingForTrackingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v6);

}

@end
