@implementation SASetSupportedLocales

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetSupportedLocales");
}

+ (id)setSupportedLocales
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)locales
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locales"));
}

- (void)setLocales:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locales"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
