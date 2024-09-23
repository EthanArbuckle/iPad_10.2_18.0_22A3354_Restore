@implementation SANotificationsSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("NotificationsSearch");
}

+ (id)notificationsSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)afterNotificationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("afterNotificationId"));
}

- (void)setAfterNotificationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("afterNotificationId"), a3);
}

- (NSNumber)isOnDeviceSearch
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isOnDeviceSearch"));
}

- (void)setIsOnDeviceSearch:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isOnDeviceSearch"), a3);
}

- (NSString)notificationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationType"));
}

- (void)setNotificationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationType"), a3);
}

- (NSString)priority
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("priority"));
}

- (void)setPriority:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("priority"), a3);
}

- (NSString)sourceAppId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sourceAppId"));
}

- (void)setSourceAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sourceAppId"), a3);
}

- (NSNumber)supportsSpokenNotifications
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportsSpokenNotifications"));
}

- (void)setSupportsSpokenNotifications:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportsSpokenNotifications"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
