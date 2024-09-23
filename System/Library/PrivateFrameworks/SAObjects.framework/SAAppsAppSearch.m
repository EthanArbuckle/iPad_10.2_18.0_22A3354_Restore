@implementation SAAppsAppSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("AppSearch");
}

+ (id)appSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)applicationName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationName"));
}

- (void)setApplicationName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationName"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
