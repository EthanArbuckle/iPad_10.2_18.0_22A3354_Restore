@implementation SAUIPerformNotificationAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PerformNotificationAction");
}

- (NSString)actionIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actionIdentifier"));
}

- (void)setActionIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actionIdentifier"), a3);
}

- (NSString)actionTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actionTitle"));
}

- (void)setActionTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actionTitle"), a3);
}

- (NSString)notificationIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationIdentifier"));
}

- (void)setNotificationIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationIdentifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
