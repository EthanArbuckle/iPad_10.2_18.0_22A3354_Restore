@implementation TVRCGetBoundingBoxThresholdDistance

void ___TVRCGetBoundingBoxThresholdDistance_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedBoundingBoxThresholdDistance, CFSTR("com.apple.TVRemote.BoundingBoxThresholdDistance"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
