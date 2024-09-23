@implementation SASettingSetNoiseManagement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetNoiseManagement");
}

+ (id)setNoiseManagement
{
  return objc_alloc_init((Class)a1);
}

- (NSString)noiseManagementOption
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("noiseManagementOption"));
}

- (void)setNoiseManagementOption:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("noiseManagementOption"), a3);
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
