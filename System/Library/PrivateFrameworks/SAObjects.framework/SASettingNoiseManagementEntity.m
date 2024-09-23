@implementation SASettingNoiseManagementEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("NoiseManagementEntity");
}

+ (id)noiseManagementEntity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)previousValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previousValue"));
}

- (void)setPreviousValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previousValue"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
