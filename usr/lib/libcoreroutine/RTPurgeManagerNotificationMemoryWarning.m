@implementation RTPurgeManagerNotificationMemoryWarning

- (RTPurgeManagerNotificationMemoryWarning)initWithMemoryPressureState:(int64_t)a3
{
  RTPurgeManagerNotificationMemoryWarning *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTPurgeManagerNotificationMemoryWarning;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_pressureState = a3;
  return result;
}

- (int64_t)pressureState
{
  return self->_pressureState;
}

- (void)setPressureState:(int64_t)a3
{
  self->_pressureState = a3;
}

@end
