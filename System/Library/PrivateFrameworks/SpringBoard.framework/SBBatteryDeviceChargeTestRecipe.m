@implementation SBBatteryDeviceChargeTestRecipe

- (id)title
{
  return CFSTR("Change Battery Device Charge");
}

- (void)handleVolumeIncrease
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SBBatteryDeviceChargeTestRecipeIncreaseNotification"), 0, 0, 0);
}

- (void)handleVolumeDecrease
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SBBatteryDeviceChargeTestRecipeDecreaseNotification"), 0, 0, 0);
}

@end
