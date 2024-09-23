@implementation SAMicroblogGetSocialCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("GetSocialCredential");
}

+ (id)getSocialCredential
{
  return objc_alloc_init((Class)a1);
}

- (NSString)explicitUserPermission
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("explicitUserPermission"));
}

- (void)setExplicitUserPermission:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("explicitUserPermission"), a3);
}

- (NSString)socialNetwork
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("socialNetwork"));
}

- (void)setSocialNetwork:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("socialNetwork"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
