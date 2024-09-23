@implementation SASessionHandoffPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SessionHandoffPayload");
}

+ (id)sessionHandoffPayload
{
  return objc_alloc_init((Class)a1);
}

- (NSData)sessionHandoffData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionHandoffData"));
}

- (void)setSessionHandoffData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionHandoffData"), a3);
}

@end
