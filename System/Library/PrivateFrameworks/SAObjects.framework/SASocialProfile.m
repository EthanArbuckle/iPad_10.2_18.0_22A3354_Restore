@implementation SASocialProfile

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SocialProfile");
}

+ (id)socialProfile
{
  return objc_alloc_init((Class)a1);
}

- (NSString)serviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceType"));
}

- (void)setServiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceType"), a3);
}

- (NSString)url
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("url"), a3);
}

- (NSString)userName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userName"));
}

- (void)setUserName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userName"), a3);
}

@end
