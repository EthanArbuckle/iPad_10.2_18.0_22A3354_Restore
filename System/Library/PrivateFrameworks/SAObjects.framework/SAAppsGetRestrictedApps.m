@implementation SAAppsGetRestrictedApps

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("GetRestrictedApps");
}

+ (id)getRestrictedApps
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appIds"));
}

- (void)setAppIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appIds"), a3);
}

- (NSString)executionEnvironment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionEnvironment"));
}

- (void)setExecutionEnvironment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionEnvironment"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
