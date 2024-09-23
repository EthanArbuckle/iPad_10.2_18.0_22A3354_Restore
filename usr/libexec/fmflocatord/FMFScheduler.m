@implementation FMFScheduler

+ (const)timerIdentifier
{
  return (const char *)FMFScheduleTimerIdentifier;
}

+ (const)alarmStream
{
  return (const char *)FMFFenceTimerAlarmStream;
}

- (void)notifyDelegateThatCurrentSchedulesDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FMFScheduler delegate](self, "delegate"));
  objc_msgSend(v3, "schedulerCurrentSchedulesDidChange:", self);

}

@end
