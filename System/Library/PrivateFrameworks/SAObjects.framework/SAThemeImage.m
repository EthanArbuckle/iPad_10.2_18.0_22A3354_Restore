@implementation SAThemeImage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ThemeImage");
}

+ (id)themeImage
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appearanceSetting
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appearanceSetting"));
}

- (void)setAppearanceSetting:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appearanceSetting"), a3);
}

- (NSData)dynamicImage
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dynamicImage"));
}

- (void)setDynamicImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dynamicImage"), a3);
}

@end
