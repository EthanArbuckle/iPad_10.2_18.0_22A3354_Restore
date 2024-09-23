@implementation SAClientUserActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ClientUserActivity");
}

+ (id)clientUserActivity
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)keywords
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keywords"));
}

- (void)setKeywords:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keywords"), a3);
}

- (NSArray)requiredUserInfoKeys
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requiredUserInfoKeys"));
}

- (void)setRequiredUserInfoKeys:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requiredUserInfoKeys"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userInfo"));
}

- (void)setUserInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userInfo"), a3);
}

- (NSURL)webpageURL
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("webpageURL"));
}

- (void)setWebpageURL:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("webpageURL"), a3);
}

@end
