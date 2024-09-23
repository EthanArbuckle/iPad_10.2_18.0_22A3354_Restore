@implementation SCLSettingsSyncErrorBehavior

- (SCLSettingsSyncErrorBehavior)initWithRecoveryType:(unint64_t)a3 retryInterval:(int64_t)a4
{
  SCLSettingsSyncErrorBehavior *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLSettingsSyncErrorBehavior;
  result = -[SCLSettingsSyncErrorBehavior init](&v7, sel_init);
  if (result)
  {
    result->_recoveryType = a3;
    result->_retryInterval = a4;
  }
  return result;
}

- (unint64_t)recoveryType
{
  return self->_recoveryType;
}

- (int64_t)retryInterval
{
  return self->_retryInterval;
}

@end
