@implementation TVRCGetTouchCenteringWeight

void ___TVRCGetTouchCenteringWeight_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedTouchCenteringWeight, CFSTR("com.apple.TVRemote.TouchCenteringWeight"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
