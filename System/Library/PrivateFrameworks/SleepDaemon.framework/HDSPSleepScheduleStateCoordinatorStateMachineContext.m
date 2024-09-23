@implementation HDSPSleepScheduleStateCoordinatorStateMachineContext

+ (id)contextWithReason:(unint64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[5] = a3;
  return v4;
}

+ (id)contextForAlarmTurnedOffWhileFiring
{
  id result;

  result = (id)objc_msgSend(a1, "contextWithReason:", 7);
  *((_BYTE *)result + 32) = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSPSleepScheduleStateCoordinatorStateMachineContext;
  result = -[HKSPStateMachineContext copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 5) = self->_reason;
  *((_BYTE *)result + 32) = self->_isForAlarmTurnedOffWhileFiring;
  return result;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (BOOL)isForAlarmTurnedOffWhileFiring
{
  return self->_isForAlarmTurnedOffWhileFiring;
}

@end
