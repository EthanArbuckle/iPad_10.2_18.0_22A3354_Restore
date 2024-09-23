@implementation TVRCGetBoundingBoxExitSpeed

void ___TVRCGetBoundingBoxExitSpeed_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedBoundingBoxExitSpeed, CFSTR("com.apple.TVRemote.BoundingBoxExitSpeed"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
