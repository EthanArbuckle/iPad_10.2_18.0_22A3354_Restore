@implementation SACreateSessionInfoResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CreateSessionInfoResponse");
}

+ (id)createSessionInfoResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSData)sessionInfo
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionInfo"));
}

- (void)setSessionInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionInfo"), a3);
}

- (NSNumber)validityDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("validityDuration"));
}

- (void)setValidityDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("validityDuration"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
