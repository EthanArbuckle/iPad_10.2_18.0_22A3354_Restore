@implementation RTWatchWristStateManagerWristStateChangedNotification

- (RTWatchWristStateManagerWristStateChangedNotification)initWithWristState:(unint64_t)a3
{
  RTWatchWristStateManagerWristStateChangedNotification *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTWatchWristStateManagerWristStateChangedNotification;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_wristState = a3;
  return result;
}

- (unint64_t)wristState
{
  return self->_wristState;
}

@end
