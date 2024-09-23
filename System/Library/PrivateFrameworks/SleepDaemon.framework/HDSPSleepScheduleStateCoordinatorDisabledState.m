@implementation HDSPSleepScheduleStateCoordinatorDisabledState

- (id)stateName
{
  return CFSTR("Disabled");
}

- (unint64_t)scheduleState
{
  return 0;
}

- (void)updateStateForcibly:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__HDSPSleepScheduleStateCoordinatorDisabledState_updateStateForcibly___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "perform:withContext:", v6, v5);

}

id __70__HDSPSleepScheduleStateCoordinatorDisabledState_updateStateForcibly___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HDSPSleepScheduleStateCoordinatorDisabledState;
  return objc_msgSendSuper2(&v2, sel_updateStateForcibly_, 1);
}

@end
