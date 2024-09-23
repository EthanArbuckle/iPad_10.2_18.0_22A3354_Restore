@implementation SBBatteryDeviceCountTestRecipe

- (id)title
{
  return CFSTR("Change Battery Device Count");
}

- (void)handleVolumeIncrease
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SBBatteryDeviceCountTestRecipeIncreaseNotification"), 0, 0, 0);
}

- (void)handleVolumeDecrease
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SBBatteryDeviceCountTestRecipeDecreaseNotification"), 0, 0, 0);
}

@end
