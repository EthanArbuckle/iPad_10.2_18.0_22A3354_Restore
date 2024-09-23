@implementation SASettingOpenAppSettings

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("OpenAppSettings");
}

+ (id)openAppSettings
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appWithSettingsId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appWithSettingsId"));
}

- (void)setAppWithSettingsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appWithSettingsId"), a3);
}

- (NSString)location
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
