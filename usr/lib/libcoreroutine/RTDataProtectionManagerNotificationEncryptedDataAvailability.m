@implementation RTDataProtectionManagerNotificationEncryptedDataAvailability

- (RTDataProtectionManagerNotificationEncryptedDataAvailability)initWithEncryptedDataAvailability:(int64_t)a3
{
  RTDataProtectionManagerNotificationEncryptedDataAvailability *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTDataProtectionManagerNotificationEncryptedDataAvailability;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_availability = a3;
  return result;
}

- (int64_t)availability
{
  return self->_availability;
}

@end
