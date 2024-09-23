@implementation TVRCGetBoundingBoxExtraRightDistance

void ___TVRCGetBoundingBoxExtraRightDistance_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__clearCachedBoundingBoxExtraRightDistance, CFSTR("com.apple.TVRemote.BoundingBoxExtraRightDistance"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
