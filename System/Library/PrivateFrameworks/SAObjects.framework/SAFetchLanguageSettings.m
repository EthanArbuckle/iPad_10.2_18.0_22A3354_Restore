@implementation SAFetchLanguageSettings

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("FetchLanguageSettings");
}

+ (id)fetchLanguageSettings
{
  return objc_alloc_init((Class)a1);
}

- (NSString)idiom
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("idiom"));
}

- (void)setIdiom:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("idiom"), a3);
}

- (NSString)systemBuildPrefix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("systemBuildPrefix"));
}

- (void)setSystemBuildPrefix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("systemBuildPrefix"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
