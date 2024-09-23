@implementation InstallGlobalPreferencesObserverIfNecessary

void ___InstallGlobalPreferencesObserverIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_GlobalPreferencesChangedHandler, CFSTR("com.apple.passbook.globalprefschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_ManagedConfigProfilesChangedHandler, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
