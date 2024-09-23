@implementation SASettingSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)settingKeys
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("settingKeys"));
}

- (void)setSettingKeys:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("settingKeys"), a3);
}

@end
