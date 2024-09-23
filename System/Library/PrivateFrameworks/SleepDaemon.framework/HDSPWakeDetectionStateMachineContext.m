@implementation HDSPWakeDetectionStateMachineContext

+ (id)contextWithType:(unint64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[4] = a3;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSPWakeDetectionStateMachineContext;
  result = -[HKSPStateMachineContext copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_type;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

@end
