@implementation SAUILaunchAppWithParameters

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("LaunchAppWithParameters");
}

+ (id)launchAppWithParameters
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parameters"));
}

- (void)setParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parameters"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
