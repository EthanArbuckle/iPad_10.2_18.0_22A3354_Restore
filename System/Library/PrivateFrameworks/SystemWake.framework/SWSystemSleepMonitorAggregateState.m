@implementation SWSystemSleepMonitorAggregateState

- (SWSystemSleepMonitorAggregateState)initWithSleepMonitorState:(unint64_t)a3 stateTimestamp:(unint64_t)a4 powerManagementPhase:(unint64_t)a5 phaseTimestamp:(unint64_t)a6
{
  SWSystemSleepMonitorAggregateState *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SWSystemSleepMonitorAggregateState;
  result = -[SWSystemSleepMonitorAggregateState init](&v11, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_phase = a5;
    result->_stateTimestamp = a4;
    result->_phaseTimestamp = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mach_continuous_time();
  v4 = self->_state - 1;
  if (v4 > 4)
    v5 = CFSTR("waking");
  else
    v5 = off_24BF27E10[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("state"));
  BSTimeDifferenceFromMachTimeToMachTime();
  v6 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("elapsedState"), 1);
  NSStringForSWSystemSleepPowerManagementPhase(self->_phase);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("phase"));

  BSTimeDifferenceFromMachTimeToMachTime();
  v8 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("elapsedPhase"), 1);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)sleepMonitorState
{
  return self->_sleepMonitorState;
}

- (unint64_t)sleepMonitorStateTimestamp
{
  return self->_sleepMonitorStateTimestamp;
}

- (unint64_t)powerManagementPhase
{
  return self->_powerManagementPhase;
}

- (unint64_t)powerManagementPhaseTimestamp
{
  return self->_powerManagementPhaseTimestamp;
}

@end
