@implementation RTUserSessionMonitorNotificationConsoleUserDidChange

- (RTUserSessionMonitorNotificationConsoleUserDidChange)init
{
  return -[RTUserSessionMonitorNotificationConsoleUserDidChange initWithactiveUser:](self, "initWithactiveUser:", 0);
}

- (RTUserSessionMonitorNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3
{
  RTUserSessionMonitorNotificationConsoleUserDidChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTUserSessionMonitorNotificationConsoleUserDidChange;
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
