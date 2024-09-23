@implementation SASettingSetBooleanPreference

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetBooleanPreference");
}

+ (id)setBooleanPreference
{
  return objc_alloc_init((Class)a1);
}

- (NSString)settingKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("settingKey"));
}

- (void)setSettingKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("settingKey"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
