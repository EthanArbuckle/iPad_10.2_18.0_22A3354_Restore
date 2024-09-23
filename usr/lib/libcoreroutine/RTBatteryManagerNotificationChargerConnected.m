@implementation RTBatteryManagerNotificationChargerConnected

- (RTBatteryManagerNotificationChargerConnected)initWithChargerConnected:(BOOL)a3
{
  RTBatteryManagerNotificationChargerConnected *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTBatteryManagerNotificationChargerConnected;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_connected = a3;
  return result;
}

- (BOOL)connected
{
  return self->_connected;
}

@end
