@implementation SALanguageSettings

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("LanguageSettings");
}

+ (id)languageSettings
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)configuredLocales
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("configuredLocales"));
}

- (void)setConfiguredLocales:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("configuredLocales"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
