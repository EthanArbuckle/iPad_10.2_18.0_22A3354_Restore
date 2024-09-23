@implementation AttachSharedCacheValuesObserverIfNeeded

void ___AttachSharedCacheValuesObserverIfNeeded_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SharedCacheValuesChangedHandler_0, CFSTR("com.apple.passkit.sharedcachechanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
