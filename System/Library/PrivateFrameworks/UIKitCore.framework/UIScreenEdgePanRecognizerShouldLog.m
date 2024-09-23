@implementation UIScreenEdgePanRecognizerShouldLog

void ___UIScreenEdgePanRecognizerShouldLog_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_UIScreenEdgePanRecognizerShouldLogClear, CFSTR("com.apple.UIKit.UIScreenEdgePanRecognizerShouldLog"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
