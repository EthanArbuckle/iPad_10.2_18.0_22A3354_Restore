@implementation SAUISirilandSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SirilandSnippet");
}

+ (id)sirilandSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)navigationPath
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("navigationPath"));
}

- (void)setNavigationPath:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("navigationPath"), a3);
}

@end
