@implementation SACreateSessionInfoRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CreateSessionInfoRequest");
}

+ (id)createSessionInfoRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)deviceAuthVersion
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceAuthVersion"));
}

- (void)setDeviceAuthVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceAuthVersion"), a3);
}

- (NSData)sessionInfoRequest
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionInfoRequest"));
}

- (void)setSessionInfoRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionInfoRequest"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
