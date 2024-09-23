@implementation SAAppsCheckRestriction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("CheckRestriction");
}

+ (id)checkRestriction
{
  return objc_alloc_init((Class)a1);
}

- (NSString)executionEnvironment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionEnvironment"));
}

- (void)setExecutionEnvironment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionEnvironment"), a3);
}

- (NSString)launchId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("launchId"));
}

- (void)setLaunchId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("launchId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
