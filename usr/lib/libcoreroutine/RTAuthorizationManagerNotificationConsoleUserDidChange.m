@implementation RTAuthorizationManagerNotificationConsoleUserDidChange

- (RTAuthorizationManagerNotificationConsoleUserDidChange)init
{
  return -[RTAuthorizationManagerNotificationConsoleUserDidChange initWithactiveUser:](self, "initWithactiveUser:", 0);
}

- (RTAuthorizationManagerNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3
{
  RTAuthorizationManagerNotificationConsoleUserDidChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManagerNotificationConsoleUserDidChange;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_activeUser = a3;
  return result;
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

@end
