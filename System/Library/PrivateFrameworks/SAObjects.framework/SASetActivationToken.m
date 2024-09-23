@implementation SASetActivationToken

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetActivationToken");
}

+ (id)setActivationToken
{
  return objc_alloc_init((Class)a1);
}

- (NSData)activationToken
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationToken"));
}

- (void)setActivationToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationToken"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
