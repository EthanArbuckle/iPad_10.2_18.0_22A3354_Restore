@implementation SharedCacheDictionary

void ___SharedCacheDictionary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SharedCacheValuesChangedHandler, CFSTR("com.apple.passkit.sharedcachechanged"), 0, (CFNotificationSuspensionBehavior)0);
}

@end
