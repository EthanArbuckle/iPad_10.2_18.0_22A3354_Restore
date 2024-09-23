@implementation SASettingOpenPreference

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("OpenPreference");
}

+ (id)openPreference
{
  return objc_alloc_init((Class)a1);
}

- (NSString)pane
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pane"));
}

- (void)setPane:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pane"), a3);
}

- (NSString)tag
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tag"));
}

- (void)setTag:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tag"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
