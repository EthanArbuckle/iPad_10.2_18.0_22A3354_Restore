@implementation UIAccessibilityNotification

+ (void)postNotification:(unsigned int)a3 withData:(id)a4
{
  _UIAccessibilityBroadcastNotificationFunction(*(uint64_t *)&a3, a4);
}

@end
