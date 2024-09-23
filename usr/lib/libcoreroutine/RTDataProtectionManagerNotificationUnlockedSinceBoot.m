@implementation RTDataProtectionManagerNotificationUnlockedSinceBoot

- (RTDataProtectionManagerNotificationUnlockedSinceBoot)initWithUnlockedSinceBoot:(BOOL)a3
{
  RTDataProtectionManagerNotificationUnlockedSinceBoot *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTDataProtectionManagerNotificationUnlockedSinceBoot;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_unlockedSinceBoot = a3;
  return result;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

@end
