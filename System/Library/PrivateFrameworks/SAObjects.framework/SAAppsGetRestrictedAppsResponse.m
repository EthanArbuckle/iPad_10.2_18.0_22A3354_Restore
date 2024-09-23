@implementation SAAppsGetRestrictedAppsResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("GetRestrictedAppsResponse");
}

+ (id)getRestrictedAppsResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)appToItsRestrictionsMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appToItsRestrictionsMap"));
}

- (void)setAppToItsRestrictionsMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appToItsRestrictionsMap"), a3);
}

- (NSArray)restrictedApps
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("restrictedApps"));
}

- (void)setRestrictedApps:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("restrictedApps"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
