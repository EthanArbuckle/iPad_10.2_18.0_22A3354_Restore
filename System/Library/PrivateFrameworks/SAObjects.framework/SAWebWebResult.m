@implementation SAWebWebResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("WebResult");
}

+ (id)webResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)descriptionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("descriptionText"));
}

- (void)setDescriptionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("descriptionText"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("url"), a3);
}

@end
