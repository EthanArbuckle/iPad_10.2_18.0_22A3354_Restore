@implementation TVRCGetTouchToSelectTravelDistance

void ___TVRCGetTouchToSelectTravelDistance_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedTouchToSelectTravelDistance, CFSTR("com.apple.TVRemote.TouchToSelectTravelDistance"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
