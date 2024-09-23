@implementation SANotificationsSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("NotificationsSearchCompleted");
}

+ (id)notificationsSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)notifications
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("notifications"), v3);
}

- (void)setNotifications:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("notifications"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
