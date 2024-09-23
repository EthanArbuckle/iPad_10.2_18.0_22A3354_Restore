@implementation SAUserProfile

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserProfile");
}

- (NSArray)names
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("names"));
}

- (void)setNames:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("names"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
