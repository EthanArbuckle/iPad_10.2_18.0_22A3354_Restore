@implementation SASettingSetAppearance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetAppearance");
}

+ (id)setAppearance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appearance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appearance"));
}

- (void)setAppearance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appearance"), a3);
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
