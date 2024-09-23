@implementation SAProfileSwitch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.profile");
}

- (id)encodedClassName
{
  return CFSTR("Switch");
}

- (NSString)sharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserId"));
}

- (void)setSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserId"), a3);
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
