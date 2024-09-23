@implementation SAStartHandoffRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartHandoffRequest");
}

+ (id)startHandoffRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSData)handoffData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("handoffData"));
}

- (void)setHandoffData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("handoffData"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
