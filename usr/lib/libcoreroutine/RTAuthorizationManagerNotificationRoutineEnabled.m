@implementation RTAuthorizationManagerNotificationRoutineEnabled

- (RTAuthorizationManagerNotificationRoutineEnabled)initWithEnabled:(BOOL)a3
{
  RTAuthorizationManagerNotificationRoutineEnabled *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManagerNotificationRoutineEnabled;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_enabled = a3;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end
