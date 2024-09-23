@implementation SASettingFloatSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("FloatSnippet");
}

+ (id)floatSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)value
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
