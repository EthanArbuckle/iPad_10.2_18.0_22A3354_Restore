@implementation TVRCGetBoundingBoxThresholdSpeed

void ___TVRCGetBoundingBoxThresholdSpeed_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedBoundingBoxThresholdSpeed, CFSTR("com.apple.TVRemote.BoundingBoxThresholdSpeed"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
