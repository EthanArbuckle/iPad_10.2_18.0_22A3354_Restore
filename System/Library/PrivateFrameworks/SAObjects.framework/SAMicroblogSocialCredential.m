@implementation SAMicroblogSocialCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("SocialCredential");
}

+ (id)socialCredential
{
  return objc_alloc_init((Class)a1);
}

- (NSString)accessToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accessToken"));
}

- (void)setAccessToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accessToken"), a3);
}

- (NSString)personalizationPermission
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("personalizationPermission"));
}

- (void)setPersonalizationPermission:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("personalizationPermission"), a3);
}

- (NSString)socialNetwork
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("socialNetwork"));
}

- (void)setSocialNetwork:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("socialNetwork"), a3);
}

- (NSString)tokenSecret
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tokenSecret"));
}

- (void)setTokenSecret:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tokenSecret"), a3);
}

@end
