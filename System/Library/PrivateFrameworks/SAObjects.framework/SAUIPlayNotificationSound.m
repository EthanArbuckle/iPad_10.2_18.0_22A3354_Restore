@implementation SAUIPlayNotificationSound

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PlayNotificationSound");
}

+ (id)playNotificationSound
{
  return objc_alloc_init((Class)a1);
}

- (NSString)notificationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationId"));
}

- (void)setNotificationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationId"), a3);
}

- (NSString)notificationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationType"));
}

- (void)setNotificationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationType"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
