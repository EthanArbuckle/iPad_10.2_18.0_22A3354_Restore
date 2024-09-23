@implementation RTMotionActivityManagerNotificationMotionSettledStateChange

- (RTMotionActivityManagerNotificationMotionSettledStateChange)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSettledState_);
}

- (RTMotionActivityManagerNotificationMotionSettledStateChange)initWithSettledState:(unint64_t)a3
{
  RTMotionActivityManagerNotificationMotionSettledStateChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTMotionActivityManagerNotificationMotionSettledStateChange;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_settledState = a3;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[RTMotionActivityManager motionSettledStateToString:](RTMotionActivityManager, "motionSettledStateToString:", -[RTMotionActivityManagerNotificationMotionSettledStateChange settledState](self, "settledState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("settled state, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

@end
