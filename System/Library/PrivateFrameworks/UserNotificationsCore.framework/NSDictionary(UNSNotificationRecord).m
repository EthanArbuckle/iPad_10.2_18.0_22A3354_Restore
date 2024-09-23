@implementation NSDictionary(UNSNotificationRecord)

- (uint64_t)uns_notificationIdentifier
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("AppNotificationIdentifier"));
}

@end
