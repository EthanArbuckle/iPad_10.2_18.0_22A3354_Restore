@implementation SAAppsLaunchApp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("LaunchApp");
}

+ (id)launchApp
{
  return objc_alloc_init((Class)a1);
}

- (NSString)applicationClientIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationClientIdentifier"));
}

- (void)setApplicationClientIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationClientIdentifier"), a3);
}

- (BOOL)doNotDismissSiri
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("doNotDismissSiri"));
}

- (void)setDoNotDismissSiri:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("doNotDismissSiri"), a3);
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
