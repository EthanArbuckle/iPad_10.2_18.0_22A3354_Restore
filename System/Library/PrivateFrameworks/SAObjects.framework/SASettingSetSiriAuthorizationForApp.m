@implementation SASettingSetSiriAuthorizationForApp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetSiriAuthorizationForApp");
}

+ (id)setSiriAuthorizationForApp
{
  return objc_alloc_init((Class)a1);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
