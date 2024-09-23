@implementation InstallStockholmPreferencesObserverIfNecessary

uint64_t ___InstallStockholmPreferencesObserverIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_StockholmPrefsChangedHandler, CFSTR("com.apple.stockholm.preferenceschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return _CFPreferencesSetBackupDisabled();
}

@end
