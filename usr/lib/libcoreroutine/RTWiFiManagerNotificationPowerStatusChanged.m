@implementation RTWiFiManagerNotificationPowerStatusChanged

- (RTWiFiManagerNotificationPowerStatusChanged)initWithPowerStatus:(unint64_t)a3
{
  RTWiFiManagerNotificationPowerStatusChanged *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTWiFiManagerNotificationPowerStatusChanged;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_powerStatus = a3;
  return result;
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

@end
