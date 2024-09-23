@implementation SAPostUpdatePersonalRequestSettingsNotification

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PostUpdatePersonalRequestSettingsNotification");
}

- (NSString)homeId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeId"));
}

- (void)setHomeId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeId"), a3);
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
