@implementation SASettingBoolSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("BoolSnippet");
}

+ (id)BOOLSnippet
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)toggle
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("toggle"));
}

- (void)setToggle:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("toggle"), a3);
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
