@implementation SAPostPersonalDomainActivityNotification

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PostPersonalDomainActivityNotification");
}

- (NSString)homeId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeId"));
}

- (void)setHomeId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeId"), a3);
}

- (NSString)notificationBody
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationBody"));
}

- (void)setNotificationBody:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationBody"), a3);
}

- (NSString)originatingDeviceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originatingDeviceName"));
}

- (void)setOriginatingDeviceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originatingDeviceName"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
